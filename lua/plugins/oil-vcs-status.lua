return {
    'SirZenith/oil-vcs-status',
    opts = {},
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
        local oil_vcs_status = require('oil-vcs-status')

        oil_vcs_status.setup({})
    end,
}
