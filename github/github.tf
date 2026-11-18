data "github_repository" "example" {
  name = "terraform-provider-github"
}

resource "github_repository" "repositorio-github" {
  name        = "terraform-test"
  description = "My awesome codebase"

  visibility = "public"
}