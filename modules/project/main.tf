# create project
resource "azuredevops_project" "project" {
  name        = var.prj_name
  description = var.prj_description
}


# Read group and team information
data "azuredevops_group" "project-administrators" {
  project_id = azuredevops_project.project.id
  name = "Project Administrators"
  depends_on = [ azuredevops_project.project ]
}

data "azuredevops_group" "project-contributors" {
  project_id = azuredevops_project.project.id
  name = "Contributors"
  depends_on = [ azuredevops_project.project ]
}

data "azuredevops_team" "project-team" {
  project_id = azuredevops_project.project.id
  name       = "${azuredevops_project.project.name} Team"
  depends_on = [ azuredevops_project.project ]
}


# create admin team
resource "azuredevops_team" "admin_team" {
  project_id = azuredevops_project.project.id
  name       = "${azuredevops_project.project.name} Administrator Team"
}


# add admin team to project admin group
resource "azuredevops_group_membership" "admins" {
  group = data.azuredevops_group.project-administrators.descriptor
  mode = "add"
  members = [
    azuredevops_team.admin_team.descriptor
  ]
}


# add project team to contributor group
resource "azuredevops_group_membership" "contributors" {
  group = data.azuredevops_group.project-contributors.descriptor
  mode = "add"
  members = [
    data.azuredevops_team.project-team.descriptor,

  ]
}
