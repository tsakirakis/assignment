module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  availability_zone   = "${var.region}a"
  tags                = { Environment = "dev", Project = "infra" }
}

module "mongodb" {
  source              = "./modules/mongodb"
  ami_id              = "ami-0416cbe3c21834f41"
  instance_type       = "t2.micro"
  subnet_id           = module.vpc.subnet_id
  security_group_id   = module.vpc.security_group_id
  tags                = { Environment = "dev", Project = "infra" }
  vpc_id              = module.vpc.vpc_id
}

module "postgresql" {
  source              = "./modules/postgresql"
  ami_id              = "ami-0416cbe3c21834f41"
  instance_type       = "t2.micro"
  subnet_id           = module.vpc.subnet_id
  security_group_id   = module.vpc.security_group_id
  tags                = { Environment = "dev", Project = "infra" }
  vpc_id              = module.vpc.vpc_id
}

module "elk" {
  source              = "./modules/elk"
  ami_id              = "ami-0416cbe3c21834f41"
  instance_type       = "t2.medium"
  subnet_id           = module.vpc.subnet_id
  security_group_id   = module.vpc.security_group_id
  tags                = { Environment = "dev", Project = "infra" }
  vpc_id              = module.vpc.vpc_id
}
