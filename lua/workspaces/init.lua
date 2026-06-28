local hostname = vim.g.hostname or vim.fn.hostname()

local machines = {
    ["UK05CG2089J5Y"] = (function() -- Work laptop
        local repoDir = "C:/Users/e314680/repo/james"
        local appServerDir = "C:/Users/e314680/repo/profile/jboss"
        local deployDir = appServerDir .. "/JAMES"

        return {
            lsp_enabled = false,
            proxy = "http://proxy-zs3.global.lmco.com:80",
            locations = {
                { key = "j", desc = "JAMES Root", path = repoDir .. "/james_dev" },
                { key = "a", desc = "JAMES App",  path = repoDir .. "/james_dev/Application" },
                { key = "d", desc = "DMI",        path = repoDir .. "/james_dev/Deployed_Mgmt_Interface/Application" },
            },
            commands = {
                { key = "m",  desc = "BuildDeploy",       cmd = "vsplit term:// gradlew deployMainJamesWar -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies" },
                { key = "cm", desc = "Clean BuildDeploy", cmd = "vsplit term:// gradlew clean deployMainJamesWar -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies --rerun-tasks" },
                { key = "w",  desc = "WebBuildDeploy",    cmd = "vsplit term:// gradlew hotDeployWebappFiles -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies" },
                { key = "cw", desc = "Clean WebDeploy",   cmd = "vsplit term:// gradlew clean hotDeployWebappFiles -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies --rerun-tasks" },
            }
        }
    end)(),

    ["WAROWDA-TSS01"] = (function() -- Work VM
        local repoDir = "C:/Users/nick/repo/james"

        return {
            lsp_enabled = true,
            proxy = "http://proxy-zs3.global.lmco.com:80",
            locations = {
                { key = "j", desc = "JAMES Root", path = repoDir .. "/james_dev" },
                { key = "a", desc = "JAMES App",  path = repoDir .. "/james_dev/Application" },
                { key = "d", desc = "DMI",        path = repoDir .. "/james_dev/Deployed_Mgmt_Interface/Application" },
            },
            commands = {
                { key = "m", desc = "BuildDeploy",    cmd = "./gradlew buildDeployMainJamesWar" },
                { key = "w", desc = "WebBuildDeploy", cmd = "./gradlew buildDeployWebappFiles" },
            }
        }
    end)(),

    ["Nick-Laptop2025"] = (function() 
        local repoDir = "dont care"

        return {
            lsp_enabled = false,
            proxy = "http://proxy-zs3.global.lmco.com:80",
            locations = {
                { key = "j", desc = "JAMES Root", path = repoDir .. "/james_dev" },
                { key = "a", desc = "JAMES App",  path = repoDir .. "/james_dev/Application" },
                { key = "d", desc = "DMI",        path = repoDir .. "/james_dev/Deployed_Mgmt_Interface/Application" },
            },
            commands = {
                { key = "m", desc = "BuildDeploy",    cmd = "./gradlew buildDeployMainJamesWar" },
                { key = "w", desc = "WebBuildDeploy", cmd = "./gradlew buildDeployWebappFiles" },
            }
        }
    end)(),

    ["Nick-Laptop"] = (function() -- Linux mint
        local repoDir = "~/Development/Github"

        return {
            lsp_enabled = false,
            locations = {
                { key = "a", desc = "Advent of Code", path = repoDir .. "/adventofcode" },
                { key = "t", desc = "TimerApp",       path = repoDir .. "/timerapp" },
            },
            commands = {
                { key = "t", desc = "Test", cmd = "vsplit term:// ./gradlew test" },
            }
        }
    end)(),

    ["Nick-PC"] = (function() 
        local githubRepoDir = "D:/Development/Github"

        return {
            lsp_enabled = true,
            locations = {
                { key = "t", desc = "Timer App",      path = githubRepoDir .. "/timerapp" },
                { key = "a", desc = "Advent of Code", path = githubRepoDir .. "/adventofcode" },
                { key = "v", desc = "Obsidian Vault", path = "F:/My Drive/Notes/Vault" },
            },
            commands = {
                { key = "t", desc = "Test",             cmd = "vsplit term:// gradlew test" },
                { key = "b", desc = "Timer App Build",  cmd = "vsplit term:// gradlew build" },
            }
        }
    end)()
}

local current_workspace = machines[hostname] or { lsp_enabled = true, locations = {}, commands = {} }

local map = vim.keymap.set
local opts = { silent = true }

if current_workspace.locations then
    for _, loc in ipairs(current_workspace.locations) do
        map("n", "<leader>cd" .. loc.key, function()
            local target = vim.fn.expand(loc.path)
            vim.cmd("cd " .. target)
            print("Switched directory to: " .. loc.desc)
        end, vim.tbl_extend("force", opts, { desc = "CD to " .. loc.desc }))
    end
end

if current_workspace.commands then
    for _, task in ipairs(current_workspace.commands) do
        map("n", "<leader>cx" .. task.key, function()
            vim.cmd(task.cmd)
        end, vim.tbl_extend("force", opts, { desc = "Run: " .. task.desc }))
    end
end

return current_workspace
