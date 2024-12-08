variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "key pair"
  type        = string
  default     = "demo"

}

variable "private_instance_count" {
  description = "AWS EC2 Private Instances Count"
  type        = number
  default     = 1
}