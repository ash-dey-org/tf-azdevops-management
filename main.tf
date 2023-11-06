module "azdo-project" {
  source = "./modules/project"

  for_each = {
    for index, proj in var.projects :
    proj.name => proj
  }

  # org_name = var.org_name
  prj_name        = each.value.name
  prj_description = each.value.description
}