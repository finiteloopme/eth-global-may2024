
module "manage-project-apis" {
    source = "github.com/finiteloopme/tf-modules-argolis//modules/manage-gcp-apis"
    project_id = data.google_project.project.project_id
    project_apis = local.project_apis
}
