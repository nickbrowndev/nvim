local hostname = vim.g.hostname or vim.uv.os_gethostname()
local utils = require("utils") -- Import your shared helper function

local engines = {
    gradle = {
        commands = {
            -- Tests and Builds run fast and smooth in the background
            { key = "t", strategy = "async", desc = "Run Tests",     cmd = "gradlew test" },
            { key = "b", strategy = "async", desc = "Standard Build", cmd = "gradlew build" },
        }
    },
    dotnet = {
        commands = {
            { key = "t", strategy = "async", desc = "Dotnet Test",  cmd = "dotnet test" },
            { key = "b", strategy = "async", desc = "Dotnet Build", cmd = "dotnet build" },
            -- Run needs to hold the terminal open because it keeps executing!
            { key = "r", strategy = "term",  desc = "Dotnet Run",   cmd = "dotnet run" },
        }
    }
}

local machines = {
    ["nick-laptop-2025-fedora"] = (function()
        local rootDir = "~/projects"

        return {
            lsp_enabled = true,
            locations = {
                adventofcode = { 
                    key = "a", 
                    desc = "Advent of Code", 
                    path = rootDir .. "/adventofcode",
                    engine = "gradle",
                },
                choicetracker = { 
                    key = "c", 
                    desc = "Choice Tracker", 
                    path = rootDir .. "/choicetracker",
                },
                dotnet = {
                    key = "d",
                    desc = ".NET Stuff",
                    path = rootDir .. "/dotnet",
                    engine = "dotnet",
                    commands = {},
                },
                nvim = {
                    key = "n",
                    desc = "Neovim Config",
                    path = rootDir .. "/nvim",
                },
                vimcheatsheet = {
                    key = "v",
                    desc = "VIM Cheat Sheet",
                    path = rootDir .. "/vimcheatsheet",
                },
                webtimerapp = {
                    key = "w",
                    desc = "Web Timer App",
                    path = rootDir .. "/webtimerapp",
                }
            }
        }
    end)(),

    ["Nick-PC"] = (function() 
        local githubRepoDir = "D:/Development/Github"

        return {
            lsp_enabled = true,
            locations = {
                timerapp = { 
                    key = "t", 
                    desc = "Timer App",      
                    path = githubRepoDir .. "/timerapp", 
                    engine = "gradle",
                },
                adventofcode = { 
                    key = "a", 
                    desc = "Advent of Code", 
                    path = githubRepoDir .. "/adventofcode", 
                    engine = "gradle",
                },
                obsidian = { 
                    key = "v", 
                    desc = "Obsidian Vault", 
                    path = "F:/My Drive/Notes/Vault" 
                },
            }
        }
    end)()
}

local current_workspace = machines[hostname] or { lsp_enabled = true, locations = {} }

local map = vim.keymap.set

-- 1. Dynamic Navigation Mappings (<leader>cd[key])
for id, loc in pairs(current_workspace.locations) do
    map("n", "<leader>cd" .. loc.key, function()
        local target_path = vim.fn.expand(loc.path)
        -- Execute a robust, side-effect-free directory switch
        vim.cmd(string.format("noautocmd cd %s", target_path))

        print("Switched directory to: " .. loc.desc)
    end, { silent = true, desc = "CD to " .. loc.desc })
end

-- 2. Native Context Mapping Generation
for id, loc in pairs(current_workspace.locations) do
    
    -- Resolve cross-references instantly using the hash dictionary key
    local target_loc = loc
    if loc.inherits_commands_from then
        target_loc = current_workspace.locations[loc.inherits_commands_from] or loc
    end

    -- Toolchain composition: Combine baseline engine scripts and local keys
    local resolved_commands = {}
    if target_loc.engine and engines[target_loc.engine] then
        resolved_commands = vim.deepcopy(engines[target_loc.engine].commands)
    end
    if target_loc.commands then
        resolved_commands = vim.tbl_deep_extend("force", resolved_commands, target_loc.commands)
    end

    -- Register hotkeys natively
    for _, task in ipairs(resolved_commands) do
        map("n", "<leader>cx" .. task.key, function()
            -- Step 1: Physical root discovery utilizing your updated shared utils
            local discovered_root = utils.get_project_root()

            -- Step 2: Absolute path validation
            local target_path = vim.fn.expand(target_loc.path):gsub("\\", "/"):lower()
            local normalized_root = discovered_root:gsub("\\", "/"):lower()

            -- Guard Clause: Ensure active buffer location matches this mapped framework block
            if not string.find(normalized_root, target_path) then
                return
            end

            -- Step 3: Transient subdirectory safe shell execution
            local cmd_string = string.format("noautocmd lcd %s | %s | noautocmd lcd -", discovered_root, task.cmd)
            vim.cmd(cmd_string)
            
            print(string.format("Fired %s task from root: %s", loc.desc, task.desc))
        end, { silent = true, desc = loc.desc .. ": " .. task.desc })
    end
end

return current_workspace
