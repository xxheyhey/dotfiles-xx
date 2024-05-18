return {
    {
        'tamton-aquib/duck.nvim',
        opts = {},
        config = function()
            local animals = { "🦆", "🐧", "🐆", "🐫", "🦩", "🐓", "🐈", "🦀", "🐀", }
            vim.keymap.set('n', '<leader>;',
                function() require("duck").hatch(animals[math.random(#animals)], math.random(2, 5)) end, {})
            vim.keymap.set('n', '<leader>;;', function() require("duck").cook() end, {})
        end,
    },
}
