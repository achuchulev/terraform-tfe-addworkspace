output "tfe_repo_workspace_id" {
  description = "Workspace ID for Repo-based workspace"
  value = "${element(concat(tfe_workspace.repo.*.id, list("")), 0)}"
  depends_on = "${tfe_workspace.repo}"
}

output "tfe_cli_workspace_id" {
  description = "Workspace ID for CLI-based workspace"
  value = "${element(concat(tfe_workspace.cli.*.id, list("")), 0)}"
  depends_on = "${tfe_workspace.cli}"
}
