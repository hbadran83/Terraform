variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
  default = {
    archuuid = "1c84e587-6b90-427d-be87-60f31d8ecb78"
    env      = "Development"
  }
}

