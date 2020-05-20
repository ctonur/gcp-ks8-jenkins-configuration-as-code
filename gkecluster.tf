resource "google_container_cluster" "gke-cluster" {
  name               = "case-study"
  network            = "default"
  location           = "europe-west3-c"
  initial_node_count = 3
}
resource "google_container_node_pool" "gke-cluster-nodes" {
  name       = "cluster-node-pool"
  location   = "europe-west3-c"
  cluster    = google_container_cluster.gke-cluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "n1-standard-4"
    }
}
