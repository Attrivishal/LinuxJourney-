#!/bin/bash

###############################################################################
# Author: Abhishek Veeramalla
# Version: v0.0.2
# 
# Script to automate the process of listing all the resources in an AWS account
#
# Below are the services that are supported by this script:
# 1. EC2      2. RDS       3. S3        4. CloudFront
# 5. VPC      6. IAM       7. Route53   8. CloudWatch
# 9. CloudFormation 10. Lambda 11. SNS  12. SQS
# 13. DynamoDB 14. EBS
#
# Usage: ./aws_resource_list.sh <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-1 ec2
#
# Note: Some services (IAM, Route53, S3 list-buckets) are global
#       Region parameter will be ignored for these services
#############################################################################

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_color() {
    echo -e "${2}${1}${NC}"
}

# Function to handle AWS command errors
handle_aws_error() {
    if [ $? -ne 0 ]; then
        print_color "ERROR: AWS command failed. Please check:" "$RED"
        print_color "1. AWS credentials are configured" "$YELLOW"
        print_color "2. You have necessary permissions" "$YELLOW"
        print_color "3. Region is correct for the service" "$YELLOW"
        exit 1
    fi
}

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    print_color "Usage: ./aws_resource_list.sh <aws_region> <aws_service>" "$RED"
    print_color "Example: ./aws_resource_list.sh ap-south-1 ec2" "$YELLOW"
    print_color "\nAvailable services:" "$BLUE"
    print_color "ec2, rds, s3, cloudfront, vpc, iam, route53," "$BLUE"
    print_color "cloudwatch, cloudformation, lambda, sns, sqs," "$BLUE"
    print_color "dynamodb, ebs" "$BLUE"
    exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

print_color "===========================================" "$GREEN"
print_color "AWS Resource Lister v0.0.2" "$GREEN"
print_color "Service: $aws_service" "$BLUE"
print_color "Region: $aws_region" "$BLUE"
print_color "===========================================\n" "$GREEN"

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    print_color "ERROR: AWS CLI is not installed." "$RED"
    print_color "Install: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html" "$YELLOW"
    exit 1
fi

# Check if the AWS CLI is configured
if [ ! -f ~/.aws/credentials ] && [ ! -f ~/.aws/config ]; then
    print_color "WARNING: AWS CLI not configured. Using default profile." "$YELLOW"
    print_color "Run: aws configure" "$YELLOW"
fi

# List the resources based on the service
case $aws_service in
    ec2)
        print_color "Listing EC2 Instances in $aws_region..." "$BLUE"
        aws ec2 describe-instances --region "$aws_region" \
            --query "Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,PrivateIpAddress,PublicIpAddress,Tags[?Key=='Name'].Value|[0]]" \
            --output table
        handle_aws_error
        ;;
        
    rds)
        print_color "Listing RDS Instances in $aws_region..." "$BLUE"
        aws rds describe-db-instances --region "$aws_region" \
            --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,DBInstanceStatus,Endpoint.Address]" \
            --output table
        handle_aws_error
        ;;
        
    s3)
        print_color "Listing S3 Buckets (global)..." "$BLUE"
        print_color "Note: S3 list-buckets is global, region parameter ignored" "$YELLOW"
        aws s3api list-buckets \
            --query "Buckets[*].[Name,CreationDate]" \
            --output table
        handle_aws_error
        ;;
        
    cloudfront)
        print_color "Listing CloudFront Distributions (global)..." "$BLUE"
        aws cloudfront list-distributions \
            --query "DistributionList.Items[*].[Id,DomainName,Status,Comment]" \
            --output table
        handle_aws_error
        ;;
        
    vpc)
        print_color "Listing VPCs in $aws_region..." "$BLUE"
        aws ec2 describe-vpcs --region "$aws_region" \
            --query "Vpcs[*].[VpcId,CidrBlock,IsDefault,State,Tags[?Key=='Name'].Value|[0]]" \
            --output table
        handle_aws_error
        ;;
        
    iam)
        print_color "Listing IAM Users (global)..." "$BLUE"
        print_color "Note: IAM is global, region parameter ignored" "$YELLOW"
        aws iam list-users \
            --query "Users[*].[UserName,UserId,CreateDate,Arn]" \
            --output table
        handle_aws_error
        ;;
        
    route53)
        print_color "Listing Route53 Hosted Zones (global)..." "$BLUE"
        print_color "Note: Route53 is global, region parameter ignored" "$YELLOW"
        aws route53 list-hosted-zones \
            --query "HostedZones[*].[Id,Name,ResourceRecordSetCount]" \
            --output table
        handle_aws_error
        ;;
        
    cloudwatch)
        print_color "Listing CloudWatch Alarms in $aws_region..." "$BLUE"
        aws cloudwatch describe-alarms --region "$aws_region" \
            --query "MetricAlarms[*].[AlarmName,StateValue,MetricName,Namespace]" \
            --output table
        handle_aws_error
        ;;
        
    cloudformation)
        print_color "Listing CloudFormation Stacks in $aws_region..." "$BLUE"
        aws cloudformation describe-stacks --region "$aws_region" \
            --query "Stacks[*].[StackName,StackStatus,CreationTime]" \
            --output table
        handle_aws_error
        ;;
        
    lambda)
        print_color "Listing Lambda Functions in $aws_region..." "$BLUE"
        aws lambda list-functions --region "$aws_region" \
            --query "Functions[*].[FunctionName,Runtime,LastModified]" \
            --output table
        handle_aws_error
        ;;
        
    sns)
        print_color "Listing SNS Topics in $aws_region..." "$BLUE"
        aws sns list-topics --region "$aws_region" \
            --query "Topics[*].[TopicArn]" \
            --output table
        handle_aws_error
        ;;
        
    sqs)
        print_color "Listing SQS Queues in $aws_region..." "$BLUE"
        aws sqs list-queues --region "$aws_region" \
            --query "QueueUrls[]" \
            --output table
        handle_aws_error
        ;;
        
    dynamodb)
        print_color "Listing DynamoDB Tables in $aws_region..." "$BLUE"
        aws dynamodb list-tables --region "$aws_region" \
            --query "TableNames[]" \
            --output table
        handle_aws_error
        ;;
        
    ebs)
        print_color "Listing EBS Volumes in $aws_region..." "$BLUE"
        aws ec2 describe-volumes --region "$aws_region" \
            --query "Volumes[*].[VolumeId,Size,VolumeType,State,Attachments[0].InstanceId]" \
            --output table
        handle_aws_error
        ;;
        
    *)
        print_color "ERROR: Invalid service: $aws_service" "$RED"
        print_color "\nAvailable services:" "$BLUE"
        print_color "ec2, rds, s3, cloudfront, vpc, iam, route53," "$BLUE"
        print_color "cloudwatch, cloudformation, lambda, sns, sqs," "$BLUE"
        print_color "dynamodb, ebs" "$BLUE"
        exit 1
        ;;
esac

print_color "\n===========================================" "$GREEN"
print_color "Operation completed for $aws_service" "$GREEN"
print_color "===========================================" "$GREEN"