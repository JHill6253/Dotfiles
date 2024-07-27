--local function extend_config(base, config)
  --return vim.tbl_extend("force", base, config)
--end


local pytest_file = {
  name = "Pytest: Current File",
  type = "python",
  request = "launch",
  module = "pytest",
  args = {
    "${file}",
    "-sv",
    "--log-cli-level=INFO",
  },
  console = "integratedTerminal",
}


return {
  pytest_file = pytest_file,
}
