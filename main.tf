terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Create a Docker image (pull from Docker Hub)
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

# Create a container from the image
resource "docker_container" "nginx_container" {
  name  = "nginx-demo"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
}

