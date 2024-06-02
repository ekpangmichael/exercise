terraform {
  backend "remote" {
   hostname = "app.terraform.io"
   organization = "myclinify"
   workspaces {
     name = "prod-kubernetes"
   }    
  }
}