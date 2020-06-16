// variables



variable "bucket_name"{
default="raghav1674"
}

//s3 bucket


resource "aws_s3_bucket" "b" {
depends_on=[aws_instance.my_instance]
bucket = var.bucket_name
acl    = "private"

tags = {
Name        = "My bucket"
Environment = "Dev"
}
}

//aws_s3_bucket_object

resource "aws_s3_bucket_object" "object" {
depends_on=[aws_s3_bucket.b]
bucket = var.bucket_name
key    = "workflow.PNG"
source="C:/Users/Raghav Gupta/Desktop/FUTURE READY KNOWLEDGE/Cloud/TERRAFORM/teraws/tera-test/newone/workspace/s3-bucket/Vimal.png"












content_type ="image/png"
//  etag = filemd5("C:/Users/Raghav Gupta/Desktop/FUTURE READY KNOWLEDGE/MLOPsProject/mlops/mlops great/train.PNG")
}
//blocking_access
resource "aws_s3_account_public_access_block" "access" {
depends_on=[aws_s3_bucket_object.object]
block_public_acls   = true
block_public_policy = true
}







//cloudfront_OAI

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {



depends_on=[aws_s3_bucket_object.object]



comment = "comments"



}



// Updating the policy




data "aws_iam_policy_document" "s3_policy" {
statement {
actions   = ["s3:GetObject"]
resources = ["${aws_s3_bucket.b.arn}/*"]
principals {
type        = "AWS"
identifiers = [  aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn ]
}
}

/*  statement {
actions   = ["s3:ListBucket"]
resources = [aws_s3_bucket.b.arn]
principals {

type        = "AWS"
identifiers = [ aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
}



}

*/

}

resource "aws_s3_bucket_policy" "policy" {
depends_on=[aws_s3_bucket_object.object]
bucket = aws_s3_bucket.b.id
policy = data.aws_iam_policy_document.s3_policy.json
}
//cloudfront_distribution

locals {
s3_origin_id = "myS3Origin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
depends_on=[aws_s3_bucket_object.object]
origin {
domain_name = aws_s3_bucket.b.bucket_regional_domain_name
origin_id   = local.s3_origin_id
s3_origin_config {
origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
}
}


enabled             = true
is_ipv6_enabled     = true
comment             = "Some comment"
default_cache_behavior {
allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
cached_methods   = ["GET", "HEAD"]
target_origin_id = local.s3_origin_id
forwarded_values {
query_string = false
cookies {
forward = "none"
}
}

viewer_protocol_policy = "redirect-to-https"
min_ttl                = 0
default_ttl            = 200
max_ttl                = 36000
}

price_class = "PriceClass_All"
restrictions {
geo_restriction {
restriction_type = "none"
}
}
tags = {
Environment = "production"
}
viewer_certificate {
cloudfront_default_certificate = true
}
}


output "cloud_domain"{
value=aws_cloudfront_distribution.s3_distribution.domain_name
}





//adding_the_url

//finally_deployed

resource "null_resource" "give_url"{
depends_on=[aws_cloudfront_distribution.s3_distribution,null_resource.mount_copy]
provisioner "local-exec" {
command= "python   main_file.py  https://${aws_cloudfront_distribution.s3_distribution.domain_name}/${aws_s3_bucket_object.object.key}"
}
}



