variable "bucket_name" {
    type = string
    description = "The name of the bucket"
    default = "lab4-bucket-mt"
}

variable "common_tags" {
    type = map(string)
    description = "Common tags you can applied to all components"
    default = {
        Project = "Lab 4 submission"
    }
}