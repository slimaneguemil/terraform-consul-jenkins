This project illustrates the concept of configuration management automation in multiple environments.
It uses a CI/CD to deploy a networking/application solution on AWS.
It leverage Consul to store terraform state and configuration.


Follow steps in sequencialy in order to setup the solution.

1- setup a consul server locally
2- setup consul policies,token with terraform for 2 users dev and op
3- add application configurations in consul for dev/uat/prod 
4- install jenkins
   run 2 pipelines using terraform for deployment 
