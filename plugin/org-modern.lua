local map = {
	key = "OrgModernKey",
	separator = "OrgModernSeparator",
	desc = "OrgModernDesc",
	title = "OrgModernTitle",
}

local links = {
	desc = { "WhichKeyDesc", "Identifier" },
	separator = { "WhichKeySeparator", "Comment" },
	key = { "WhichKey", "Function" },
	title = { "WhichKeyTitle", "FloatTitle" },
}

local function hl_exists(name)
	return not vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = name }))
end

local function create_highlights()
	for name, hl in pairs(map) do
		if not hl_exists(hl) then
			if hl_exists(links[name][1]) then
				vim.api.nvim_set_hl(0, hl, { link = links[name][1] })
			else
				vim.api.nvim_set_hl(0, hl, { link = links[name][2] })
			end
		end
	end
end
create_highlights()
