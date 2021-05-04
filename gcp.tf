module "gcp_network" {
    source = "git@github.com:FairwindsOps/terraform-gcp-vpc-native.git//default?ref=default-v2.1.0"
    network_name = var.gcp_network_name
    subnetwork_name = var.gcp_subnetwork_name
    region = var.gcp_region
    enable_flow_logs = "false"
    subnetwork_range = var.gcp_subnetwork_range
    subnetwork_pods = var.gcp_subnetwork_pods
    subnetwork_services = var.gcp_subnetwork_services
}

module "gke_cluster" {
    source                           = "git@github.com:FairwindsOps/terraform-gke.git//vpc-native?ref=vpc-native-v1.2.0"
    region                           = var.gcp_region
    name                             = local.gke_cluster
    project                          = var.gcp_project
    network_name                     = var.gcp_network_name
    nodes_subnetwork_name            = module.gcp_network.subnetwork
    kubernetes_version               = var.gcp_kubernetes_version
    pods_secondary_ip_range_name     = module.gcp_network.gke_pods_1
    services_secondary_ip_range_name = module.gcp_network.gke_services_1
}

module "node_pool" {
    source             = "git@github.com:/FairwindsOps/terraform-gke//node_pool?ref=node-pool-v3.0.0"
    name               = var.gcp_workers_name
    region             = module.gke_cluster.region
    gke_cluster_name   = module.gke_cluster.name
    machine_type       = var.gcp_instance_size
    min_node_count     = "3"
    max_node_count     = "3"
    kubernetes_version = module.gke_cluster.kubernetes_version
}
