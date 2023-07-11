-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- Set up mirror instead of using GitHub
-- https://github.com/nvim-treesitter/nvim-treesitter#i-want-to-use-a-mirror-instead-of-httpsgithubcom


-- Favour 'clang' over GCC due to library incompatibility on Windows
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting
--require'nvim-treesitter.install'.compilers = { "clang", "gcc" }

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "java", "html", "css", "javascript", "dockerfile", "yaml", "json", "lua", "vim", "vimdoc", "query" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { },

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  -- },
-- }

vim.filetype.add({
  extension = {
    --jsp = 'html',
    --jspf = 'html',
    --tag = 'html',
    --tagf = 'html',
  },
  filename = {
    -- ['.foorc'] = 'toml',
    -- ['/etc/foo/config'] = 'toml',
  },
  pattern = {
    -- ['.*/etc/foo/.*'] = 'fooscript',
    -- -- Using an optional priority
    -- ['.*/etc/foo/.*%.conf'] = { 'dosini', { priority = 10 } },
    -- -- A pattern containing an environment variable
    -- ['${XDG_CONFIG_HOME}/foo/git'] = 'git',
    -- ['README.(a+)$'] = function(path, bufnr, ext)
      -- if ext == 'md' then
        -- return 'markdown'
      -- elseif ext == 'rst' then
        -- return 'rst'
      -- end
    -- end,
  },
})
