#!/bin/bash

STACK_NAME=Factorio1

aws cloudformation delete-stack --stack-name $STACK_NAME

while :; do
    STACK_STATUS=$(aws cloudformation describe-stacks --stack-name $STACK_NAME | jq .Stacks[0].StackStatus)
    echo "Stack Status: $STACK_STATUS"
    if [[ ! "$STACK_STATUS" =~ "_IN_PROGRESS" ]]; then
        break
    fi
    sleep 4
done
