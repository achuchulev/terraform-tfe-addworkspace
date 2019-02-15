output "tfe_repo_workspace_id" {
  description = "Workspace ID for Repo-based workspace"
  value = "${tfe_workspace.repo.id}"
  depends_on = "${tfe_workspace.repo}"
}

output "tfe_cli_workspace_id" {
  description = "Workspace ID for CLI-based workspace"
  value = "${tfe_workspace.cli.id}"
  depends_on = "${tfe_workspace.cli}"
}
