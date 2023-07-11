provider "kubernetes" {
  config_path    = "~/.kube/config"
}


locals {
     name = "neussi" 
     type = "web"
}

resource "kubernetes_deployment" "image_deployment" {
   metadata {
     namespace = "rashid"
     name = local.name
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
          name = "patrice"
          image = "patricehub/my_image"
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
