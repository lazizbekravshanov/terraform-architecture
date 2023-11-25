# pulls info from another workspace
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "lazizbekravshanov"
    workspaces = {
      name = "vpc"
    }
  }
}

# Creates subnet group with private subnets
# Creates subnet group with private subnets
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets
}