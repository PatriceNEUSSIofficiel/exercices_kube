provider "kubernetes" {
  config_path    = "~/.kube/config"
}

variable "pod_definition" {
  type = list(object({
    pod_name = string
    namespace = string
    image = string
    is_default = bool 
  }))

  default = [ {
    pod_name = "marwaney1"
    namespace = "rashid"
    image = "marwaney/ssh-server"
    is_default = false
  },{
    pod_name = "marwaney2"
    namespace = "rashid"
    image = "marwaney/ssh-server"
    is_default = false
  },{
    pod_name = "marwaney3"
    namespace = "rashid"
    image = "marwaney/ssh-server"
    is_default = false
  }]
  
}

locals {
     name = "patrice" 
     type = "web"
}

resource "kubernetes_deployment" "pat_deployment" {
   count = length(var.pod_definition)
   metadata {
     namespace = var.pod_definition[count.index].namespace
     name = var.pod_definition[count.index].pod_name
     labels = {
       owner = local.name
       type = local.type
     }
   }
  spec {
    template {
      metadata {
        namespace = "rashid"
        name = local.name 
        labels = {
          owner = local.name 
          app  = local.type
        }
      }
      spec {
        container {
          name = var.pod_definition[count.index].pod_name
          image = var.pod_definition[count.index].image
        }
        container {
          name = var.pod_definition[count.index].pod_name
          image = var.pod_definition[count.index].image
        }
        container {
          name = var.pod_definition[count.index].pod_name
          image = var.pod_definition[count.index].image

        }
      }
    }
    strategy {
     type =  "Recreate"
    }
   replicas = 3
   selector {
     match_labels = {
       owner = local.name
       app = local.type
     }
   }
  }
}