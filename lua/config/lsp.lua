local lspconfig = require('lspconfig')

-- Example configuration for Python using pyright
lspconfig.pyright.setup{}

-- Example configuration for JavaScript/TypeScript using tsserver
lspconfig.tsserver.setup{}

-- Example configuration for Go using gopls
lspconfig.gopls.setup{}

-- Example configuration for Rust using rust_analyzer
lspconfig.rust_analyzer.setup{}
