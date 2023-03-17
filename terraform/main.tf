module "create_dynamodb" {
    source = "./modules/create_dynamodb"
    table_name = var.root_table_name
    partition_key = var.root_partition_key
}

module "create_seq_grp" {
    source = "./modules/create_seq_grp"
    seq_grp_name = var.root_seq_grp_name
}

module "create_pem" {
    source = "./modules/create_pem"
    key_name = var.root_key_name
    key_path = var.root_key_path
}

module "create_ec2" {
    source = "./modules/create_ec2"
    ami_id = var.root_ami_id
    ec2_type = var.root_ec2_type
    ec2_pem = module.create_pem.ec2_pem
    seq_grp_id = module.create_seq_grp.seq_grp_id
}

module "create_s3" {
    source = "./modules/create_s3"
    s3_bucket_name = var.root_s3_bucket_name
}