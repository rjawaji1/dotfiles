local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("user-story", {
		t({ "As a <role>,", "I want <feature>,", "So that <benefit>" }),
		i(0),
	}),
}
