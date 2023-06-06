-- Java related configuration goes here
local pluginInstallationDirectory = vim.fn.stdpath('data') .. '/mason/packages/jdtls';
print(pluginInstallationDirectory);
local config = {
    cmd = {pluginInstallationDirectory .. '/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
