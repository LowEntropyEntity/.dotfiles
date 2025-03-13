local M = {}

function M.vim_cmd(command)
	local startPosition = vim.fn.getpos("v")
	local endPosition = vim.fn.getpos(".")
	local startLine, startColumn = startPosition[2], startPosition[3]
	local endLine, endColumn = endPosition[2], endPosition[3]

	if (startLine == endLine) and (startColumn == endColumn) then -- no selection
		vim.cmd('%' .. command)
	else
		vim.cmd(startLine .. ',' .. endLine .. command)
	end
end

return M
