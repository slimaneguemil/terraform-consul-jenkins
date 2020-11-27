## Move this backend file to m3 when migrating state
//terraform {
//  backend "consul" {
//    address = "http://192.168.129.187:31593"
//    scheme = "http"
//  }
//}

## Move this backend file to m3 when migrating state
terraform {
  backend "consul" {
    address = "127.0.0.1:8500"
    scheme = "http"
  }
}