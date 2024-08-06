return {
    "echasnovski/mini.indentscope",

    config = function()
        local status, indentscope = pcall(require, "mini.indentscope")
        if (not status) then return end

        indentscope.setup({
            symbol = "▏",
        })
    end,
}
