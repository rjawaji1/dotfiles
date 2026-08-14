-- These should be announced before ANY vim.pack.add() to support
-- plugin loading from lockfile.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		vim.notify(name)
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

			---@diagnostic disable-next-line: undefined-field
			require("blink.cmp").build():pwait()
		end
		if name == "blink.pairs" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("blink.lib")
				vim.cmd.packadd("blink.pairs")
			end

			---@diagnostic disable-next-line: undefined-field
			require("blink.pairs").build():pwait()
		end
		-- LuaSnip Build Hook
		if name == "LuaSnip" and (kind == "install" or kind == "update") then
			-- Safely force-load the plugin if it's currently inactive/lazy
			if not ev.data.active then
				vim.cmd.packadd("LuaSnip")
			end

			-- Run the compilation script asynchronously using vim.system
			vim.notify("LuaSnip: Hook triggered. Compiling jsregexp...", vim.log.levels.INFO)
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }, function(obj)
				vim.schedule(function()
					if obj.code == 0 then
						vim.notify("LuaSnip: jsregexp compiled successfully!", vim.log.levels.INFO)
					else
						vim.notify("LuaSnip: Compilation failed!\n" .. (obj.stderr or ""), vim.log.levels.ERROR)
					end
				end)
			end)
		end
		if name == "fff.nvim" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("fff.nvim")
			end
			require("fff.download").download_or_build_binary()
		end
	end,
})
