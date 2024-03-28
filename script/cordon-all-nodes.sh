VERSION="v1.28"
NODES=$(kubectl get nodes -oyaml | yq '.items[]|select(.status.nodeInfo.kubeletVersion=="'"${VERSION}"'*")|.metadata.name')

kubectl cordon $NODES