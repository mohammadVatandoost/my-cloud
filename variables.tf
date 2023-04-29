variable "image_pull_secret" {
     type= string 
     default = ""
} 

variable "cluster_name" {
     type= string 
     default = ""
} 

output printimage_pull_secret {
        value = "Hello, ${var.image_pull_secret}"
}

output printcluster_name{
        value = "Hello, ${var.cluster_name}"
}
