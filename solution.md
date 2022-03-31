## Steps to install
1. Build image
```shell
dockber build -t XXXXXXXXX.dkr.ecr.us-east-2.amazonaws.com/quest-web:latest 
```
2. Push image
```shell
dockber build -t XXXXXXXXX.dkr.ecr.us-east-2.amazonaws.com/quest-web:latest 
```
3. Update deployment deploy/quest.yaml to appropriate image url
4. Deploy the service
```shell
kubectl apply -f deploy/quest
```

## Reasons behind architectural decisions
- EKS
    - I decided deploy on an eks cluster as I was most familiar with it. There is an easy [terraform tutorial](https://learn.hashicorp.com/tutorials/terraform/eks)
    that helps with setup which was what I used
- ECR
  - This felt like the logical choice for a docker repo in AWS
    
- Terraform
    - This was chosen for infrastructure provisioning. If I was running the docker repo in an EC2 instance I would
    use Terraform to provision and perhaps chef (for reinstalling the image)
      

## Areas for improvement
- Ideally a pipeline for deploying the application would be used. It could be a simple Jenkins pipeline that runs a helm chart
- Managing of kubeconfig files needs to be improved. A possible solution would be to save it in secret manager after the cluster is created/updated. 
  Any service that requires it would make reference from the ssm
- A solution with letsencrypt would have be appropriate with more time. A separate repo could have been created to manage the installation of this by installing cert manager, cluster issue etc
- A service mesh like istio would also make it easier for service discovery with sidecar injection