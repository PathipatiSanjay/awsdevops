#crete s3 bucket
resource "aws_s3_bucket" "mybuckets-21/05" {
  bucket = var.bucketname
}
  

  