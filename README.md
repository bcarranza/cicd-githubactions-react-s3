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

1.3 Create your own variables in a file: terraform.tfvars
```shell
   bucket_name = "value"
   
   common_tags = {
       Project = "Game App"
   }
```

2. Navigate to the infra folder and provision the AWS infrastructure using Terraform:

```shell
  cd infra
  terraform init
  terraform apply
```
# Explanation of Pipeline YAML
Name: CI

Summary: This pipeline is triggered on push or pull request events to the main branch. It runs a single job called build which builds and deploys the code to the S3 server.

On:

    push: Triggers the workflow on push events to the main branch.
    pull_request: Triggers the workflow on pull request events to the main branch.
    workflow_dispatch: Allows you to run the workflow manually from the Actions tab.

Jobs:

    build:

This job runs on the ubuntu-latest runner and uses the node-version matrix strategy to run the build on different versions of Node.js. The steps in this job are:

    Use Node.js ${{ matrix.node-version }}: Sets the Node.js version to the value specified in the matrix.
    Git checkout: Checks out the repository under $GITHUB_WORKSPACE.
    Install packages: Installs the required packages using npm.
    Production build: Builds an optimized production build using npm.
    Deploy to S3: Deploys the build to the S3 server using the jakejarvis/s3-sync-action.

Environments:

    `AWS_S3_BUCKET:** The name of the S3 bucket to deploy to.
    `AWS_ACCESS_KEY_ID:** The AWS access key ID.
    `AWS_SECRET_ACCESS_KEY:** The AWS secret access key.
    `AWS_REGION:** The AWS region.
    `SOURCE_DIR:** The directory containing the build artifacts.

How to use the pipeline:

To use the pipeline, simply push or pull request your code changes to the main branch. The pipeline will be triggered automatically and will build and deploy your code to the S3 server. You can also run the pipeline manually from the Actions tab.

Summary for DevOps engineers:

This pipeline is a basic example of a CI/CD pipeline that can be used to build and deploy code to the S3 server. It can be customized to meet the specific needs of your project. For example, you may want to add additional jobs to test your code or to deploy it to different environments.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## references

- https://medium.com/@sharathvignesh/ci-cd-deploy-react-app-to-aws-s3-using-github-actions-3f6d77783190 
- https://www.alexhyett.com/terraform-s3-static-website-hosting/


testing revert