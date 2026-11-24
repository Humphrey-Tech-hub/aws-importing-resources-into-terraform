variable "aws_region" {
  description = "The region where the bucket is deployed in."
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "My CLI configured profile."
  type        = string
  default     = "import1"
}