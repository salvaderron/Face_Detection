provider "aws"{	
	region="ap-south-1"
	profile="user1"
}

resource "aws_instance" "task6"{
	ami="ami_id"
	instance_type="t2.micro"
	tags={
		Name="Task 6"
	     }
}
resource "aws_ebs_volume" "storage1" {
  availability_zone = aws_instance.task6.availability_zone 
  size              = 5
  tags = {
    Name = "Task 6 permanent HD"
  }
} 
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.storage1.id
  instance_id = aws_instance.task6.id
  force_detach = true
}
