provider "google" {
  project = "my-project"
  region  = "europe-west2"
}

resource "google_compute_network" "my-vpc" {
  name = "my-vpc"
  ip_cidr_range = "10.0.0.0/24"
}

resource "google_compute_subnetwork" "web-subnet" {
  name          = "web-subnet"
  ip_cidr_range = "10.0.0.0/28"
  region        = "europe-west2"
  network       = google_compute_network.my-vpc.self_link
}

resource "google_compute_subnetwork" "app-subnet" {
  name          = "app-subnet"
  ip_cidr_range = "10.0.0.16/28"
  region        = "europe-west2"
  network       = google_compute_network.my-vpc.self_link
}

resource "google_compute_subnetwork" "db-subnet" {
  name          = "db-subnet"
  ip_cidr_range = "10.0.0.32/28"
  region        = "europe-west2"
  network       = google_compute_network.my-vpc.self_link
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.my-vpc.self_link


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }


  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.my-vpc.self_link


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }


  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "web-server" {
  name         = "web-server"
  machine_type = "n1-standard-1"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.web-subnet.self_link
  }
}

resource "google_compute_instance" "app-server" {
  name         = "app-server"
  machine_type = "n1-standard-2"
  zone         = "europe-west2-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.app-subnet.self_link
  }
}

resource "google_compute_instance" "db-server" {
  name         = "db-server"
  machine_type = "db-f1-micro"
  zone         = "europe-west2-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.db-subnet.self_link
  }
}