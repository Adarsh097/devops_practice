## Terraform Part-2

1. count = 2 -> is a meta argument used to define the number of instances that should be provisioned.

2. SPOT (Bidding based instances) | ON DEMAND (fixed price)

3. for_each (meta argument)
```
for_each = tomap({
    "TWS-Junoon-automate-micro" = "t3.micro",
    "TWS-Junoon-automate-small" = "t3.small"
})

each.key | each.value


output "ec2_public_ip" {
  value = [
    for instance in aws_instance.ec2-myInstance-1 : instance.public_ip
  ]
}

```

4. depends_on -> tells the dependency of one resource on the another

```
depends_on      = [aws_security_group.my_security_group]

```

# Conditional Statement
5. Let if the environment is productino then, storage volume should be 20GB and if it is development then, storeage volume should be 10GB.

```
variable "env" {
    default = "prod"
    type = string
}

  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.aws_root_storage_size_default
    volume_type = "gp3"
  }


```

# Terraform State Management & Backend
1. terraform refresh -> to refresh the state file as per the infrastructure provisioned.
2. terraform apply -> default refreshing.

```
terraform state -h -> help

terraform state list -> list the provisioned resources.

terraform state show <particular resource>

terraform state rm <particular resource> -> we don't want to manage the state | resource will be present in cloud but removed from state-file


terraform import aws_key_pair.my_key key-name -> to pull the state from cloud to state file -> terraform apply




```

3. automating the manually created ec2 from terraform
```
resource "aws_instance" "my_new_instance" {
    ami = "unknown"
    instance_type = "unknown"


}

terraform import aws_instance.my_new_instance <instance_id of manully created node>


```

4. .tfstate file -> should not be commited to github -> problem-1
5. .tfstate file if gets deleted -> protect it
6. We need to avoid the <state-conflict> if multiple persons are managing the infra. -> problem-2
7. SOLUTION -> Make a common state-file and store it in a remote secured location like S3-bucket on AWS.(Remote Backend)

![alt text](image.png)

8. State Locking -> to avoid multiple person to change the state file -> Lock and Release Mechanism (If one person is accessing the state -> lock-id is generated and get stored in Dyanamo DB(key-value) -> other person will be able to use the state if the lock is removed).

![alt text](image-1.png)

9. billing_mode = PAY_PER_REQUEST | PROVISIONED -> PAY_PER_REQUEST is better for cost optimisation.

- BACKUP OF STATE FILE
10. If the state file gets deleted then, rename the backup-state-file as state-file

11. If we also delete the .tfstate.backup -> solution-> remote backend

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.30.0"
    }
  }

  # to manage remote state in s3
  backend "s3" {
    bucket = "my-unique-remote-terraform-state-bucket-5559-ad"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    # state locking with dynamodb
    dynamodb_table = "state-lock-table-5559-ad"
  }
}

```
12. terraform init -> after changing the terraform block
13. Now, if you delete the .tfstate and .tfstate.backup -> then, also state is saved -> terraform state list
14. If now multiple user try to change the state and apply the state in terraform will be restricted due to state locking.

15. If the lock is deleted then, only the second user can access the state file.

- REMOTE BACKEND IS IMPORTANT CONCEPT


## TERRAFORM WORKSPACE | MANAGING THE ENVIRONMENTS
Terraform **workspaces** are one of those things that sound simple but get misused a lot. I’ll explain **what they are, how they work internally, when to use them, and when NOT to**—DevOps-style, no marketing fluff.

---

## 🧠 What is a Terraform workspace?

A **workspace** is a way to maintain **multiple state files** for the **same Terraform configuration**.

Think of it as:

> Same code 🧾
> Different state files 📦
> Different environments (sometimes) 🌍

By default, Terraform has one workspace:

```text
default
```

When you create more workspaces, Terraform keeps **separate state** for each one.

---

## 🔍 What actually changes with a workspace?

Only **the state file** changes.

Your:

* `.tf` files → SAME
* provider config → SAME
* resources → SAME definitions

But Terraform tracks them separately.

Internally:

```text
terraform.tfstate.d/
├── dev/
│   └── terraform.tfstate
├── staging/
│   └── terraform.tfstate
└── prod/
    └── terraform.tfstate
```

Each workspace = **isolated state**

---

## ⚙️ Common workspace commands

```bash
terraform workspace list
terraform workspace show
terraform workspace new dev
terraform workspace select prod
terraform workspace delete staging
```

Check current workspace:

```bash
terraform workspace show
```

---

## 🎯 How workspaces are actually used

You usually pair workspaces with:

```hcl
terraform.workspace
```

Example:

```hcl
resource "aws_instance" "ec2" {
  instance_type = terraform.workspace == "prod" ? "t3.medium" : "t2.micro"
}
```

Or naming resources:

```hcl
tags = {
  Name = "app-${terraform.workspace}"
}
```

So:

* `dev` → app-dev
* `prod` → app-prod

---

## 📦 Example workflow

```bash
terraform init

terraform workspace new dev
terraform apply   # creates DEV infra

terraform workspace new prod
terraform apply   # creates PROD infra
```

Same code. Two separate infrastructures.

---

## ✅ When workspaces are a GOOD idea

✔ Small projects
✔ Learning Terraform
✔ Same infra shape, minor differences
✔ Feature testing
✔ Temporary environments

Example:

* dev
* test
* qa

---

## ❌ When NOT to use workspaces (very important)

❌ Large production systems
❌ Teams with multiple AWS accounts
❌ Different regions / VPCs
❌ Strong environment isolation required
❌ Separate CI/CD pipelines

Why?

* Easy to apply in **wrong workspace**
* Hard to review diffs
* Risky for production

💥 One wrong `terraform apply` in `prod` = outage

---

## 🏗️ Better alternative (industry standard)

**Directory-based environments**

```text
terraform/
├── modules/
│   └── ec2/
├── dev/
│   └── main.tf
├── staging/
│   └── main.tf
└── prod/
    └── main.tf
```

Each environment:

* Has its own backend
* Own state
* Own variables
* Own CI pipeline

🔥 This is what companies actually use.

---

## 🔐 Workspaces + remote backend (S3)

If you use S3 backend:

```hcl
terraform {
  backend "s3" {
    bucket = "tf-state-bucket"
    key    = "ec2/terraform.tfstate"
    region = "ap-south-1"
  }
}
```

Terraform automatically does:

```text
s3://bucket/ec2/dev/terraform.tfstate
s3://bucket/ec2/prod/terraform.tfstate
```

(one per workspace)

---

## 🧠 Mental model (remember this)

> **Workspaces ≠ environments**
> Workspaces = **state isolation only**

Environments = accounts + networking + IAM + pipelines
Workspaces don’t give you that.

---

## 📝 Interview one-liner (gold)

> “Terraform workspaces allow multiple state files for the same configuration, but for production-grade environments, directory-based separation with remote backends is safer and more maintainable.”

---

1. terraform workspace list
2. terraform workspace new dev -> state will be empty as workspaces are isolated in nature.
3. terraform workspace select default
