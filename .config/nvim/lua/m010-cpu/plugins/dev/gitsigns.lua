return {
    "lewis6991/gitsigns.nvim", -- git signs

    config = function()
        local status, gitsigns = pcall(require, "gitsigns")
        if (not status) then return end

        gitsigns.setup {}
    end,
}
