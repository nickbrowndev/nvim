local os_name = vim.uv.os_uname().sysname
local is_windows = os_name:find("Windows") ~= nil
-- TODO vim.g.os = "Windows"

-- Root detection using 0.11 native API
local root_markers = { 'gradlew', 'mvnw', 'pom.xml', 'build.gradle', '.git' }
local root_dir = vim.fs.root(0, root_markers) or vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Mason paths - using stdpath is safer across different OS installs
local mason_path = vim.fn.stdpath("data") .. '/mason/packages/jdtls'
local jdtls_path = mason_path .. 'jdtls'

local config_dir = is_windows and '/config_win' or '/config_linux'
-- ~/.config/nvim/lsp/jdtls.lua

-- Find the launcher jar
-- We use glob to find the specific versioned jar mason installs
local launcher_jar = vim.fn.glob(mason_path .. '/plugins/org.eclipse.equinox.launcher_*.jar', true)

-- Workspace data directory
-- Separating this by project avoids index corruption
local workspace_dir = vim.fn.stdpath("data") .. "/site/java-workspace/" .. project_name

local lombok_jar = jdtls_path .. '/lombok.jar'

return {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. lombok_jar,
    '-jar', launcher_jar,
    '-configuration', mason_path .. config_dir,
    '-data', workspace_dir,
  },
  root_dir = root_dir,
  init_options = {
    bundles = {}, -- To be filled by the launcher
    extendedClientCapabilities = require('jdtls').extendedClientCapabilities,
  },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      -- Add this to help with modern Java features (Loom, etc.)
      configuration = {
        runtimes = {
          -- If you have multiple JDKs, you can define them here
          -- { name = "JavaSE-21", path = "/path/to/jdk-21" },
        }
      },
      completion = {
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "org.mockito.Mockito.*",
        },
      },
    },
  },
}
