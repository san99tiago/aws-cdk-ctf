#!/bin/bash
set -x

# Deploy CDK Stack
cd ./cdk
npm install .
cdk deploy --require-approval never
