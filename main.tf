provider "aws" {
              access_key = "${var.accesskey}"
              secret_key = "${var.secretkey}"
              region = "${var.region}"
}

module "vm_module"{
             source = "../../../modules/services/vm"
             ami = "${var.ami}"
             instance_type = "${var.instancetype}"
}
 
resource "aws_instance" "examplevm" {
              ami = "${var.ami}"
             instance_type = "${var.instancetype}"
             tags =  {
                   Name = "${var.vmname}"
