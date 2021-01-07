## Hello world in AWS
This repo contains code to allow for the deployment of the hello world application written in Ruby onto AWS infrastructure.

### Prerequisites
- ```docker``` and ```docker-compose``` are installed
- copy of your AWS ```access_key_id``` and ```secret_access_key``` stored in aws.env

### How to run

Serve app locally

1. Run the command
```
./execute.sh serve
```

2. Open your favourite web browser (i.e. Google Chrome), and head to ```http://localhost/```

Deploy app onto AWS

1. Setup AWS environment variables
```
set -a
source aws.env
set +a
```

2. Run the command
```
./execute.sh deploy
```

3. Open the link outputted by the application using your favourite web browser

Destroy AWS cloudformation stack

1. Setup AWS environment variables (if not already done)
```
set -a
source aws.env
set +a
```

2. Run the command
```
./execute.sh destroy
```

### Assumptions
- I have created this script (```execute.sh```) to make execution of this project simple. The user is not required to remember any lengthy docker commands unless desired
- Cloud development kit (CDK) has used responsible defaults in terms of both performance and security
- At the end of each docker image, the user has been set to nobody. This will help prevent any malicious code from being executed in the event of a system compromise
- Fargate was used in preference over standard ECS to allow for a simpler yet scalable solution
- Containerised using Docker to avoid poluting the system with project dependencies
- Whilst Linux was a heavy focus in the design, this project could be run in Windows (Pro, Enterprise or Education edition)
- Region by default is set to ```ap-southeast-2``` (Sydney, Australia) in-case of any strict compliance requirements
- A docker-compose build is always run before actual execution of commands to ensure the latest changes are present in the docker image
- As ```aws.env``` contains sensitive information (your AWS keys), you may choose to encrypt this file using openssl and decrypt only when required. Alternatively you can manually set the environment variables
