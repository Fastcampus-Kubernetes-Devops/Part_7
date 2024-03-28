NAMESPACES=$(kubectl get ns -oyaml |yq '.items[].metadata.name')

for namespace in $NAMESPACES; do
  echo $namespace
  kubectl rollout restart deployment -n $namespace
  kubectl rollout restart sts -n $namespace
  echo
done
