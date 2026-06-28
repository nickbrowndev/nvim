local M = {}

--- Find the physical root directory of the current project
---@return string: The absolute path to the project root, or the current directory fallback
function M.get_project_root()
    -- Native Neovim upward search for project marker files
    local discovered_root = vim.fs.root(0, { 
        -- Git boundary
        ".git", 
        -- Java / Gradle / Maven markers
        "build.gradle", 
        "gradlew", 
        "pom.xml", 
        -- C# / .NET markers
        "*.sln", 
        "*.csproj", 
        "global.json",
        -- Frontend / Miscellaneous markers
        "package.json" 
    })
    
    -- Fallback gracefully to the current working directory if no root file is found
    return discovered_root or vim.fn.getcwd()
end

--- Run a command asynchronously and pipe errors to the Quickfix list on failure
---@param cmd string The shell command string to execute
---@param title string A descriptive name for the task notification
function M.run_async_build(cmd, title)
    print("🔨 " .. title .. " started in background...")
    
    local log_lines = {}

    -- Helper to collect streaming text output from the job
    local function on_output(_, data)
        if data then
            for _, line in ipairs(data) do
                -- Clean up trailing carriage returns (common on Windows/Gradle outputs)
                local clean = line:gsub("\r", "")
                if clean ~= "" then
                    table.insert(log_lines, clean)
                end
            end
        end
    end

    vim.fn.jobstart(cmd, {
        stdout_buffered = false, -- Stream live or catch chunks
        stderr_buffered = false,
        on_stdout = on_output,
        on_stderr = on_output,
        on_exit = function(_, exit_code, _)
            if exit_code == 0 then
                print("󰄬 " .. title .. " Completed Successfully!")
                -- Optional: Clear the quickfix list if a previous run had failed
                vim.fn.setqflist({}, 'r') 
            else
                print("󰅚 " .. title .. " Failed! (Exit code " .. exit_code .. "). Opening Quickfix...")
                
                -- 1. Load the raw logs into the quickfix engine
                vim.fn.setqflist({}, 'r', {
                    title = title .. " Errors",
                    lines = log_lines,
                })
                
                -- 2. Open the quickfix window at the bottom of the screen
                vim.cmd("copen") 
            end
        end
    })
end

return M
