provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "case-study-22"
  region      = "europe-west3"
}
