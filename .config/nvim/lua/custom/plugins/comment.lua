return {
    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        opts = {
            extra = {
                ---Add comment at the end of line
                eol = '<leader>C',
            },
        },
        lazy = false,
    },
}
