vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = -1

local ok, jdtls = pcall(require, "jdtls")
if not ok then return end

local root_markers = {
  "pom.xml", "mvnw",
  "build.gradle", "build.gradle.kts", "settings.gradle", "gradlew",
  ".git",
}
local root_dir = vim.fs.root(0, root_markers) or vim.fn.expand("%:p:h")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

jdtls.start_or_attach({
  cmd = { "jdtls", "-data", workspace_dir },
  root_dir = root_dir,
})
