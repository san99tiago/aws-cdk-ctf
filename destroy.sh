#!/bin/bash
set -x

# Deploy CDK Stack
cd ./cdk
npm install .
cdk destroy --require-approval never
