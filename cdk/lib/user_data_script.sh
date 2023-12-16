#!/bin/bash

# Enable extra logging
set -x

# Refresh environment variables
source /etc/profile

# Update OS and install Java
echo "----- Updating OS -----"
sudo yum update -y

# Install and Initialize SSM Agent
echo "----- Initializing SSM Agent -----"
sudo yum install -y https://s3.region.amazonaws.com/amazon-ssm-region/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

# Install Instance Connect
echo "----- Initializing EC2 Instance Connect Agent -----"
sudo yum install -y ec2-instance-connect

# Install Amazon CloudWatch Agent
echo "----- Initializing CloudWatch Agent -----"
sudo yum install -y amazon-cloudwatch-agent

# Create the necessary folders and permissions
mkdir /home/config
sudo chmod 775 /home/config

# Copy the necessary S3 files for OpenAI Chatbot execution
echo "----- Downloading source code from S3 bucket -----"
aws s3 cp "s3://${BUCKET_NAME}/config/" /home/config/ --recursive

# Show the downloaded files
echo "----- Source code files are -----"
ls -lrt /home/config/
