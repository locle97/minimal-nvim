
local M = {}

M.is_windows = vim.fn.has "win32" ~= 0

M.shell = "bash"

if M.is_windows then
    M.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "bash"
end

return M
