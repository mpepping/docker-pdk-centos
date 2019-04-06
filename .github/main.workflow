workflow "BuildTagPush to Docker Hub" {
  on = "push"
  resolves = ["Push"]
}

action "Docker Registry" {
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Docker Registry"]
  args = "build -t mpepping/pdk-centos  ."
}

action "Push" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "push mpepping/pdk-centos"
  needs = ["Build"]
}
