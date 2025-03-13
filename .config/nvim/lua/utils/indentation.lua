local M = {}

function M.spaces_to_tabs()
	local original = vim.o.tabstop
	local count = (vim.v.count ~= 0) and vim.v.count or original

	vim.o.tabstop = count

	require('utils.range_or_buffer').vim_cmd('retab!')

	vim.o.tabstop = original
end

function M.tabs_to_spaces()
	local original_tabstop = vim.o.tabstop
	local original_shiftwidth = vim.o.shiftwidth
	local original_expandtab = vim.o.expandtab
	local count = (vim.v.count ~= 0) and vim.v.count or original_shiftwidth

	vim.o.tabstop = count
	vim.o.shiftwidth = count
	vim.o.expandtab = true

	require('utils.range_or_buffer').vim_cmd('retab!')

	vim.o.tabstop = original_tabstop
	vim.o.shiftwidth = original_shiftwidth
	vim.o.expandtab = original_expandtab
end

return M
