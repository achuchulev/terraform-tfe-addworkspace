provider "tfe" {
  hostname = "app.terraform.io"
  token    = "${var.token}"
}

resource "tfe_workspace" "repo" {
  count               = "${var.workspace_type == "repo" ? 1 : 0}"
  name                = "${var.workspace_name}"
  organization        = "${var.tfe_organization}"
  working_directory   = "${var.repo_working_dir}"
  terraform_version   = "${var.tfe_version}"
  queue_all_runs      = false
  vcs_repo {
      identifier      = "${var.vcs_repo_ident}"
      oauth_token_id  = "${var.oauth}"
  }
}

resource "tfe_workspace" "cli" {
  count               = "${var.workspace_type == "cli" ? 1 : 0}"
  name                = "${var.workspace_name}"
  organization        = "${var.tfe_organization}"
  working_directory   = "${var.repo_working_dir}"
  terraform_version   = "${var.tfe_version}"
  queue_all_runs      = false
}

resource "tfe_team_access" "workspace" {
  access              = "${var.tfe_team_access}"
  team_id             = "${var.tfe_team}"
  workspace_id        = "${var.workspace_type == "repo" ? "${tfe_workspace.repo.*.id}" : "${tfe_workspace.cli.*.id}"}"
}

resource "tfe_variable" "info_deploy" {
  key           = "info_deploy"
  value         = "TFE"
  category      = "terraform"
  workspace_id  = "${var.workspace_type == "repo" ? "${tfe_workspace.repo.*.id}" : "${tfe_workspace.cli.*.id}"}"
}
