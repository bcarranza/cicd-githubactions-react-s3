# Continuous Integration/Continuous Deployment (CI/CD) with GitHub Actions, React, Terraform, and AWS S3

This repository demonstrates a CI/CD pipeline using GitHub Actions to automatically deploy a React application to AWS S3 (Simple Storage Service) whenever changes are pushed to the `develop` branch. It also includes Terraform code in the `infra` folder to provision AWS infrastructure.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Workflow Overview](#workflow-overview)
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
3. Terraform configuration: Before proceeding, make sure you have the following environment variables set up with your AWS access credentials:

```shell
   export AWS_ACCESS_KEY_ID="TU_ACCESS_KEY"
  export AWS_SECRET_ACCESS_KEY="TU_SECRET_KEY"
```

4. Navigate to the infra folder and provision the AWS infrastructure using Terraform:

```shell
   cd infra
  terraform init
  terraform apply
```




## references

- https://medium.com/@sharathvignesh/ci-cd-deploy-react-app-to-aws-s3-using-github-actions-3f6d77783190 
- https://www.alexhyett.com/terraform-s3-static-website-hosting/
