terraform {
  backend "remote" {
   hoshostname = "app.terraform.io"
   organization = "interview-org"
   woworkspaces {
     name = "staging-iam"
   }    
  }
}