local hostname = vim.uv.os_gethostname()
local isWindows = vim.fn.has("windows") > 0
local isLinux = vim.fn.has("linux") > 0
-- local Job = require 'plenary.job'

-- function runCommand(options)
--     Job:new(options):sync() -- or start()
-- end

local workspace = {
    ["lsp-enabled"] = true,
}

if (hostname == "UK05CG2089J5Y") then -- Work laptop
    local repoDir = "C:\\Users\\e314680\\repo\\james"
    local appServerDir = "C:\\Users\\e314680\\repo\\profile\\jboss"
    local deployDir = appServerDir .. "\\JAMES"
 
    workspace["lsp-enabled"] = false
    workspace["proxy"] = "http://proxy-zs3.global.lmco.com:80"
    workspace["locations"] = {
        ["JAMES Root"] = {key = "j", location = repoDir .. "\\james_dev"},
        ["JAMES App"] = {key = "a", location = repoDir .. "\\james_dev\\Application"},
        ["DMI"] = {key = "d", location = repoDir .. "\\james_dev\\Deployed_Mgmt_Interface\\Application"},
    }
    workspace["commands"] = {
        ["JAMES BuildDeploy"] = {key = "m", cmd = "vsplit term:// gradlew deployMainJamesWar -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies"},
        ["JAMES Clean BuildDeploy"] = {key = "cm", cmd = "vsplit term:// gradlew clean deployMainJamesWar -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies --rerun-tasks"},
        ["JAMES WebBuildDeploy"] = {key = "w", cmd = "vsplit term:// gradlew hotDeployWebappFiles -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies"},
        ["JAMES Clean WebBuildDeploy"] = {key = "cw", cmd = "vsplit term:// gradlew clean hotDeployWebappFiles -PdeployDir=" .. deployDir .. " -PappServerDir=" .. appServerDir .. " --profile --refresh-dependencies --rerun-tasks"},
    }
elseif (hostname == "WAROWDA-TSS01") then -- Work VM
    -- vim.g.proxy_required = true
    -- vim.g.proxy = "http://proxy-zs3.global.lmco.com:80"
    local repoDir = "C:\\Users\\nick\\repo\\james"
    -- workspaces["JAMES"] = {name = "JAMES root", key = "j", location = repoDir .. "\\james_dev"}
    -- workspaces["JAMES App"] = {name = "JAMES App", key = "a", location = repoDir .. "\\james_dev\\Application"}
    -- workspaces["DMI"] = {name = "DMI", key = "d", location = repoDir .. "\\james_dev\\Deployed_Mgmt_Interface\\Application"}
    workspace["proxy"] = "http://proxy-zs3.global.lmco.com:80"
    workspace["locations"] = {
        ["JAMES Root"] = {key = "j", location = repoDir .. "\\james_dev"},
        ["JAMES App"] = {key = "a", location = repoDir .. "\\james_dev\\Application"},
        ["DMI"] = {key = "d", location = repoDir .. "\\james_dev\\Deployed_Mgmt_Interface\\Application"},
    }
    workspace["commands"] = {
        ["JAMES BuildDeploy"] = {key = "m", cmd = "./gradlew buildDeployMainJamesWar"},
        ["JAMES WebBuildDeploy"] = {key = "w", cmd = "./gradlew buildDeployWebappFiles"},
    }
elseif (hostname == "Nick-Laptop2025") then -- Need different Windows/Ubuntu configs?
    local repoDir = "dont care"
    workspace["lsp-enabled"] = false
    workspace["proxy"] = "http://proxy-zs3.global.lmco.com:80"
    workspace["locations"] = {
        ["JAMES Root"] = {key = "j", location = repoDir .. "\\james_dev"},
        ["JAMES App"] = {key = "a", location = repoDir .. "\\james_dev\\Application"},
        ["DMI"] = {key = "d", location = repoDir .. "\\james_dev\\Deployed_Mgmt_Interface\\Application"},
    }
    workspace["commands"] = {
        ["JAMES BuildDeploy"] = {key = "m", cmd = "./gradlew buildDeployMainJamesWar"},
        ["JAMES WebBuildDeploy"] = {key = "w", cmd = "./gradlew buildDeployWebappFiles"},
    }

elseif (hostname == "Nick-PC") then -- Need different Windows/Ubuntu configs?

    local githubRepoDir = "D:\\Development\\Github"
    workspace["locations"] = {
        ["Timer App"] = {key = "t", location = githubRepoDir .. "\\timerapp"},
        ["Obsidian Vault"] = {key = "v", location = "F:\\My Drive\\Notes\\Vault"},
    }
    workspace["commands"] = {
        ["Timer App Build"] = {key = "b", cmd = "vsplit term:// gradlew build"},
    }
end

return workspace
    
