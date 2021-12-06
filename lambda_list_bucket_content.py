import json
import boto3
import os

client = boto3.client('s3')

def lambda_handler(event, context):
    bucket_name = os.environ.get('BUCKET_NAME')
    response = client.list_objects_v2(Bucket=bucket_name)

    keys = []
    for obj in response['Contents']:
        keys.append(obj['Key'])


    return {
        "statusCode": 200,
        "statusDescription": "200 OK",
        "isBase64Encoded": False,
        "headers": {
            "Content-Type": "text/html"
        },
        
        "body": json.dumps(keys)
    }
    