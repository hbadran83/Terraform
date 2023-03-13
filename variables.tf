variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
  default = {
    archuuid = "b30a9bdb-4d19-41ca-a134-dce4d726dd57"
    env      = "Development"
  }
}

