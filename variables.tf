variable "token" {}
variable "oauth" {}
variable "tfe_organization" {
    default = "atanasc"
}
#variable "aws_account" {
#  description = "AWS Account Name"
#}
variable "tfe_team" {}
variable "tfe_team_access" {
  default = "admin"
}

variable "tfe_version" {
  default = "0.11.11"
}
variable "workspace_name" {}
variable "vcs_repo_ident" {}
variable "repo_working_dir" {}
variable "workspace_type" {
  description = "Valid types are 'repo' and 'cli'"
}
