![kubernetes](https://user-images.githubusercontent.com/42310282/113719641-36ad1000-96c4-11eb-9c46-1e65962dd6b0.png)



```
$ cd eks-cluster
$ terraform init
$ terraform apply -auto-approve

Adding new context
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

$ cd monitoring
$ terraform init
$ terraform apply -auto-approve

```
