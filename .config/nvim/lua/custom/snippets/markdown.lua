require("luasnip.session.snippet_collection").clear_snippets("haskell")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
	s("has", fmt("```haskell\n{}\n```{}", { i(1), i(0) })),
	s("oca", fmt("```ocaml\n{}\n```{}", { i(1), i(0) })),
	s("R", fmt("```R\n{}\n```{}", { i(1), i(0) })),
	s("py", fmt("```python\n{}\n```{}", { i(1), i(0) })),
})

