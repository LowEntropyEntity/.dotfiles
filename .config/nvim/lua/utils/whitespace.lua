local M = {}

function M.remove_only_whitespace()
	require('utils.range_or_buffer').vim_cmd('s/^\\s\\+$//')
end

function M.remove_trailing_whitespace()
	require('utils.range_or_buffer').vim_cmd('s/\\s\\+$//')
end

return M
