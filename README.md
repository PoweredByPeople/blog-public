# Overview:

This project is a python/flask application running on modern, public cloud infrastructure. The goal of this project was to learn about and experiment with modern software development lifecycle tools. I aimed to use free/open source, industry standard tools across the board. 

## SDLC pipline design:

I've built a pipeline that, on code commit, deploys automatically on to AWS infrastructure and runs at http://poweredbypeople.me/

Write code (Pycharm ide) -> Commit (Github) -> Build (Jenkins) -> Deploy (AWS) 

The above process takes about 90 seconds for the changes to show up on the live site. 

## Technology Implemented:
#### Core Infrastructure/Tools:
- Python/Flask: Language and framework for web development. Standard, effective toolset with plenty of online documentation. 
- AWS:
  - EC2: Provided core infrastrcuture for the service to run on. 
  - ECS/ECR: Part of the build process is to build a docker image. This image was pushed to ECR and deployed into cluster in ECS. The service runs as an HA pair that automatically handles blue/green deployments of changes.  
  - RDS: Persistent database storage. Running a MariaDB instance to help support the application. 
  - Route 53: Providing DNS and domain management. 
  - CloudFormation: Utilized templates for the initial design and implementation of the application and Jenkins server stacks. 
- Jenkins: Created a project to handle the build and deployment of the application. The main functionality is a Docker Build and Publish step with some additional shell scripts to handle the AWS deployment. Jenkins is connected to the main github repo for automatic triggering of the build on commit.

#### Supporting Services:
- Clubhouse: A project management tool that provided a way to organize and prioritize my work. https://clubhouse.io/ 
- Github: Code repository.
- Mailgun and Yandex: The application has user login and password reset functionality. This required some form of email service to work. I implemented Mailgun and Yandex for the email management. https://www.mailgun.com/ https://mail.yandex.com
- Datadog: Monitoring for the infrastructure, application events and performance. Server metrics and code deployments are shown side by side to help correlate potential issues with thier cause. https://www.datadoghq.com/ 

Big thanks to Miguel Grinberg and The Flask Mega-Tutorial. The end result is that I used most of his actual application code in this project but came up with my own solutions to the operations and build/deployment side of the project.  My goal was to familiarize myself with python web development but really focus on the operations side of this project. https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world  
