// resource "aws_subnet" "db_subnet" {
//   count = var.az_count

//   vpc_id            = aws_vpc.vpc.id
//   availability_zone = count.index
//   cidr_block        = var.db_subnet_cidrs[count.index]
// }

resource "aws_db_subnet_group" "db_subnet_group" {
#    count = var.az_count
#    subnet_ids  = values(aws_subnet.pub_subnet)[*].id 
    subnet_ids  = aws_subnet.pub_subnet.*.id
}