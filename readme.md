This project illustrates the concept of configuration management automation in multiple environments.
It uses a CI/CD to deploy a networking/application solution on AWS.
It leverage Consul to store terraform state and configuration.


Follow steps in sequencial ordre to setup the solution.

1- setup a consule server locally
2- setup consul policies,token with terraform
3- add application configurations in consul
4- install jenkins
   run 2 pipelines using terraform for deployment 
