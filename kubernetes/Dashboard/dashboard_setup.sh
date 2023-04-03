#!/bin/bash
kubectl apply -f https://raw.githubusercontent.com/jaintpharsha/Devops-January-2023/main/kubernetes/Dashboard/kubernete-dashboard.yml

kubectl --namespace kubernetes-dashboard patch svc kubernetes-dashboard -p '{"spec": {"type": "NodePort"}}'

cat > nodeport_dashboard_patch.yaml <<EOF
spec:
  ports:
  - nodePort: 32000
    port: 443
    protocol: TCP
    targetPort: 8443
EOF

kubectl -n kubernetes-dashboard patch svc kubernetes-dashboard --patch "$(cat nodeport_dashboard_patch.yaml)"

rm nodeport_dashboard_patch.yaml

echo -e "\n   DASHBOARD_ENDPOINT: Shttps://<any_worker_node_ip>:32000"
echo -e "\n   USE BELLOW TOKEN TO LOGIN K8S_DASHBOARD\n"
kubectl describe secret -n kubernetes-dashboard kubernetes-dashboard-token | grep -i 'token:      ' | awk -F 'token:      ' '{print $NF}'


kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/tigera-operator.yaml