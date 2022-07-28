variable "my_list" {
  type      = list(string)
  default   = ["apple", "banana", "3"]
}

variable "my_set" {
  type      = set(number)
  default   = [1, 2, 3, 4, 5]
}

variable "my_tuple" {
  type      = tuple([string, number, string, number])
  default   = ["1", 2, "3", 5]
}

variable "users" {
  type = map(object({
    role = string
  }))
  default = {
    "chinmay" = {
      role = "user"
    }
    "joseph"={
        role = "admin"
    }
    "Ihsan" = {
      role = "admin"
    }
    "Roman" = {
      role = "user"
    }

  }
}

output "userbyrole" {
 value = { for name, user in var.users : user.role => name...}
}

output "all_users" {
 value = [ for name, user in var.users : name ]
}


output "forlist" {
  value = [for i,v in var.my_list: "${i} is ${v}"]
}

output "fortupple" {
  value = [for i in var.my_tuple: tonumber(i)]
}

output "filteredlist" {
  value = [for i in var.my_tuple: tonumber(i) if tonumber(i) > 2]
}