terraform {
  backend "remote" {
   hostname = "app.terraform.io"
   organization = "interview-org"
   workspaces {
     name = "staging-kubernetes"
   }    
  }
}