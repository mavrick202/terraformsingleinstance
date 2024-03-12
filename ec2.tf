#Master Node 1
resource "aws_instance" "master01" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.medium"
    key_name = "LaptopKey"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "master01"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}

#Master Node 2
resource "aws_instance" "master02" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.medium"
    key_name = "LaptopKey"
    subnet_id = "${aws_subnet.subnet2-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "master02"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}

#Master Node 3
resource "aws_instance" "master03" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.medium"
    key_name = "LaptopKey"
    subnet_id = "${aws_subnet.subnet3-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "master03"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}

#Worker Node 1
resource "aws_instance" "worker01" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.medium"
    key_name = "LaptopKey"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "worker01"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}

#Worker Node 2
resource "aws_instance" "worker02" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.medium"
    key_name = "LaptopKey"
    subnet_id = "${aws_subnet.subnet2-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "worker02"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}

#Worker Node 3
resource "aws_instance" "worker03" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t3.medium"
    key_name = "LaptopKey"
    subnet_id = "${aws_subnet.subnet3-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "worker03"
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}




