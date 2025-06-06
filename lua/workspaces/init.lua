local hostname = vim.uv.os_gethostname()
local isWindows = vim.fn.has("windows") > 0
local isLinux = vim.fn.has("linux") > 0

local workspace = {
    ["lsp-enabled"] = true,
}
if (hostname == "UK05CG2089J5Y") then -- Work laptop
    -- vim.g.proxy_required = false
    -- vim.g.proxy = "proxy-zs3.global.lmco.com:80"
    local repoDir = "C:\\Users\\e314680\\repo\\james"
    
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
   -- workspace["locations"] = {
    --     "Timer App" = {key = "t", location = "C:\\Users\\nickb\\Development\\Github\\TimerApp"},
    -- }
else
end

return workspace
    
