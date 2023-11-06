variable "projects" {
  type = list(object({
    name        = string
    description = string
  }))
}
