local M = {}
local version = vim.version().minor

M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.lsp_msg = function()
  if version < 10 then
    return ""
  end

  local msg = vim.lsp.status()

  if #msg == 0 or vim.o.columns < 120 then
    return ""
  end

  local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
  local ms = vim.uv.hrtime() / 1e6
  local frame = math.floor(ms / 100) % #spinners

  return spinners[frame + 1] .. " " .. msg
end

M.lsp = function()
  if rawget(vim, "lsp") and version >= 10 then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.attached_buffers[M.stbufnr()] then
        return "%#St_Lsp#" .. ((vim.o.columns > 100 and "   LSP ~ " .. client.name .. " ") or "   LSP ")
      end
    end
  end

  return ""
end

return M
