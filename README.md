# Continuous Integration/Continuous Deployment (CI/CD) with GitHub Actions, React, Terraform, and AWS S3

This repository demonstrates a CI/CD pipeline using GitHub Actions to automatically deploy a React application to AWS S3 (Simple Storage Service) whenever changes are pushed to the `develop` branch. It also includes Terraform code in the `infra` folder to provision AWS infrastructure.
This is launched a pokedex app. 

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Explanation of Pipeline YAML](#explanation-of-pipeline-yaml)
- [License](#license)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have a GitHub account.
- You have an AWS account with an S3 bucket set up to host your static website.
- You have the AWS CLI (Command Line Interface) installed and configured with appropriate credentials.
- You have Terraform installed locally.

## Getting Started

To get this CI/CD pipeline up and running, follow these steps:

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/bcarranza/cicd-githubactions-react-s3.git
   ```

2. Change into the project directory:

```shell
   cd cicd-githubactions-react-s3
```

## Configuration
1. Terraform configuration: Before proceeding, make sure you have the following environment variables set up with your AWS access credentials:

```shell
  export AWS_ACCESS_KEY_ID="TU_ACCESS_KEY"
  export AWS_SECRET_ACCESS_KEY="TU_SECRET_KEY"
```

1.2 Also Before proceeding you need to create those secrets at github secrets level. 
```shell
   AWS_S3_BUCKET: ${{ secrets.AWS_PRODUCTION_BUCKET_NAME }}
   AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
   AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY}}
```

2. Navigate to the infra folder and provision the AWS infrastructure using Terraform:

```shell
  cd infra
  terraform init
  terraform apply
```
## Explanation of Pipeline YAML


## License
This project is licensed under the MIT License - see the LICENSE file for details.

In this updated README, I've added instructions for running the Terraform code in the `infra` folder and provided an explanation of the key sections of the `deploy.yml` GitHub Actions workflow file. Please adapt the instructions and configuration details to match your specific project setup and requirements.


## references

- https://medium.com/@sharathvignesh/ci-cd-deploy-react-app-to-aws-s3-using-github-actions-3f6d77783190 
- https://www.alexhyett.com/terraform-s3-static-website-hosting/
