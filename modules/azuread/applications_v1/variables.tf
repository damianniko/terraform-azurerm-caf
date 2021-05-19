variable "global_settings" {
  default = {}
}
variable "settings" {
  default = {}
}
variable "client_config" {
  description = "Client configuration object (see module README.md)."
}
variable "azuread_api_permissions" {
  default = {}
}
variable "user_type" {}

variable "keyvaults" {
  default = {}
}

variable "password_policy" {
  description = "Default password policy applies when not set in tfvars."
  default = {
    # Length of the password
    length  = 250
    special = false
    upper   = true
    number  = true

    description = "Default password policy."

    type = "password"

    # Define the number of days the password is valid. It must be more than the rotation frequency
    expire_in_days = 180
      rotation_key0 = {
        # Odd number
        #
        # Set how often the password must be rotated. When passed the renewal time, running the terraform plan / apply will change to a new password
        # Only set one of the value
        # Note - once set cannot switch between mins/days/months. Only the value can be adjusted.
        #

        # mins = 10 # only recommended for CI and demo
        # days = 7
        months = 1
      }
      rotation_key1 = {
        # Even number
        #
        # Set how often the password must be rotated. When passed the renewal time, running the terraform plan / apply will change to a new password
        # Only set one of the value
        # Note - once set cannot switch between mins/days/months. Only the value can be adjusted.
        #

        # mins = 10 # only recommended for CI and demo
        # days = 8
        months = 2
      }
  }
}