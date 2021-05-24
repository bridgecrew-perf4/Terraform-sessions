module "s3_module" {
    # remote module
    source = "github.com/solongocyber/Terraform-sessions/modules/s3"
    env = "dev"
    
}
