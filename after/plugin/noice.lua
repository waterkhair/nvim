require("noice").setup({
    background_color = '#ffffff',
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    status = {
        mode = { },
    },
})
require('telescope').load_extension('noice')

vim.keymap.set({ "n", "i", "s" }, "<C-f>", function()
    if not require("noice.lsp").scroll(4) then
        return "<C-f>"
    end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<C-b>", function()
    if not require("noice.lsp").scroll(-4) then
        return "<C-b>"
    end
end, { silent = true, expr = true })

