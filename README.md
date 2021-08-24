![kubernetes](https://user-images.githubusercontent.com/42310282/113719641-36ad1000-96c4-11eb-9c46-1e65962dd6b0.png)



```
$ terraform apply \
-target=module.controlplane \
-target=module.network \
-target=module.nodes && \
terraform apply \
-target=module.kubernetes \
-target=module.kube-prometheus-stack \
-target=module.blackbox \
-target=module.grafana
```
