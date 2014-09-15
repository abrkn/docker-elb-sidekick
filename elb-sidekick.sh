#!/usr/bin/env bash
INSTANCE_ID=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`
if [ $? -ne 0 ]; then echo "Failed to lookup instance id."; exit 1; fi

echo Registering instance $INSTANCE_ID to ELB $ELB_NAME...

aws elb register-instances-with-load-balancer \
    --load-balancer-name $ELB_NAME \
    --instances $INSTANCE_ID \
    || exit $?

echo Instance registered to ELB.

function cleanup() {
    echo Deregistering instance $INSTANCE_ID from ELB $ELB_NAME...
    aws elb deregister-instances-from-load-balancer \
        --load-balancer-name $ELB_NAME \
        --instances $INSTANCE_ID
    echo Instance deregistered from ELB.
    exit
}

trap cleanup SIGTERM SIGINT SIGKILL SIGHUP

sleep infinity

