local M = {}

function M.get_project_root()
  local project_marker = { "yarn.lock", "package-lock.json", "pnpm-lock.yaml" }
  local project_root = vim.fs.root(0, project_marker)

  if project_root ~= nil then
    return project_root
  else
    return vim.fn.getcwd()
  end
end

function M.file_exists(path, file)
  local stat = vim.uv.fs_stat(vim.fs.joinpath(path, file))

  return stat ~= nil
end

return M
