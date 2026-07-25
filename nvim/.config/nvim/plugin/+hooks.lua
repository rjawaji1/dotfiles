-- These should be announced before ANY vim.pack.add() to support
-- plugin loading from lockfile.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("blink.lib")
				vim.cmd.packadd("blink.cmp")
			end
			require("blink.cmp").build():pwait()
		end
		if name == "blink.pairs" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("blink.lib")
				vim.cmd.packadd("blink.pairs")
			end
			require("blink.pairs").build():pwait()
		end
	end,
})
