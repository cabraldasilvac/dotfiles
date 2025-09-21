# docker specific
cleanup_docker_containers() {
  if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado."
    return 1
  fi
  local dangling_containers=$(docker ps -aq -f status=exited -f status=created)
  if [ -z "$dangling_containers" ]; then
    echo "Nenhum contêiner pendente encontrado."
  else
    echo "Removendo contêineres pendentes..."
    docker rm $dangling_containers
    echo "Contêineres pendentes removidos."
  fi
}

cleanup_docker_images() {
  if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado."
    return 1
  fi
  local dangling_images=$(docker images -q -f dangling=true)
  if [ -z "$dangling_images" ]; then
    echo "Nenhuma imagem pendente encontrada."
  else
    echo "Removendo imagens pendentes..."
    docker rmi $dangling_images
    echo "Imagens pendentes removidas."
  fi
}

alias dclean_containers="cleanup_docker_containers"
alias dclean_images="cleanup_docker_images"
