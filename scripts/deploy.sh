#!/bin/bash

STACK_NAME=Factorio1

aws cloudformation describe-stacks --stack-name $STACK_NAME

if [ $? != 0 ]; then
    aws cloudformation create-stack \
        --stack-name $STACK_NAME \
        --template-body file://cft.yml \
        --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
else
    aws cloudformation update-stack \
        --stack-name $STACK_NAME \
        --template-body file://cft.yml \
        --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
fi

while :; do
    STACK_STATUS=$(aws cloudformation describe-stacks --stack-name $STACK_NAME | jq .Stacks[0].StackStatus)
    echo "Stack Status: $STACK_STATUS"
    if [[ ! "$STACK_STATUS" =~ "_IN_PROGRESS" ]]; then
        break
    fi
    sleep 4
done
