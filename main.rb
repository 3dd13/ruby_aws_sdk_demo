AWS_KEY_ID = ""
AWS_SECRET_KEY = ""
AWS_REGION = "ap-southeast-1"

BUCKET_NAME = ""
FILE_NAME = ""
LOCAL_FILE_NAME = ""

TARGET_BUCKET_NAME = ""
TARGET_FILE_NAME = ""

aws_options = {
  access_key_id: AWS_KEY_ID,
  secret_access_key: AWS_SECRET_KEY,
  region: AWS_REGION
}

AWS.config(aws_options)
s3 = AWS::S3.new
s3.buckets[BUCKET_NAME].objects[FILE_NAME].write(File.open(LOCAL_FILE_NAME))
s3.buckets[BUCKET_NAME].objects[FILE_NAME].copy_to(FILE_COPY_NAME, {:bucket_name => TARGET_BUCKET_NAME, :acl => :public_read})
