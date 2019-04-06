workflow "Build and push to Docker Hub" {
  on = "push"
  resolves = [
    "build-and-push-to-docker-hub",
  ]
}

action "build-and-push-to-docker-hub" {
  uses = "pangzineng/Github-Action-One-Click-Docker@master"
  secrets = [
    "DOCKER_USERNAME",
    "DOCKER_PASSWORD",
  ]
  env = {
    DOCKER_IMAGE_NAME = "mpepping/pdk-validate",
    DOCKER_IMAGE_TAG = "latest"
  }
}
