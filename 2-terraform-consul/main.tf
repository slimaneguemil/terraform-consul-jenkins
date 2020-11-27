//provider "consul" {
//  address = "http://192.168.129.187:32036"
//  datacenter = "minidc"
//}

provider "consul" {
  address = "127.0.0.1:8500"
  datacenter = "dc1"
}


resource "consul_keys" "networking" {

  key {
    path  = "networking/configuration/"
    value = ""
  }

  key {
    path  = "networking/state/"
    value = ""
  }
}

resource "consul_keys" "applications" {

  key {
    path  = "applications/configuration/"
    value = ""
  }

  key {
    path  = "applications/state/"
    value = ""
  }
}

resource "consul_acl_policy" "networking" {
  name = "networking"
  rules = <<-RULE
    key_prefix "networking" {
      policy = "write"
    }

    session_prefix "" {
      policy = "write"
    }
    RULE
}

resource "consul_acl_policy" "applications" {
  name = "applications"
  rules = <<-RULE
    key_prefix "applications" {
      policy = "write"
    }

    key_prefix "networking/state" {
      policy = "read"
    }

    session_prefix "" {
      policy = "write"
    }

    RULE
}

resource "consul_acl_token" "mary" {
  description = "token for Mary Moe"
  policies = [consul_acl_policy.networking.name]
}

resource "consul_acl_token" "sally" {
  description = "token for Sally Sue"
  policies = [consul_acl_policy.applications.name]
}

## OUTPUTS

output "mary_token_accessor_id" {
  value = consul_acl_token.mary.id
}

output "sally_token_accessor_id" {
  value = consul_acl_token.sally.id
}

