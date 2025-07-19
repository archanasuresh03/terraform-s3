# 🌐 Static Website Deployment on AWS using Terraform and CI/CD

This project shows how to host a static website on AWS S3 using Terraform.  
It also sets up a CI/CD pipeline using AWS CodePipeline and CodeBuild.

---

## 🔧 What This Project Does

- Creates an S3 bucket to host HTML files as a static website.
- Sets public access permissions to make the site viewable.
- Uses IAM roles to allow CodePipeline and CodeBuild to work.
- Sets up a pipeline to deploy the site whenever changes are pushed.

---

## 🛠 Tools Used

- **Terraform – to create AWS resources automatically.
- AWS S3 – to host the static website.
- AWS CodePipeline – for automating deployments.
- AWS CodeBuild – to zip HTML files and push them to S3.**

---

## 📂 Project Structure

- `main.tf` – S3 bucket and bucket policy.
- `iam.tf` – IAM roles and policies.
- `variables.tf` – all variable definitions.
- `terraform.tfvars` – variable values.
- `buildspec.yml` – build steps for CodeBuild.

---
**How to Run** 

   -->terraform init
   -->terraform plan
   -->terraform apply

✅ What You Get
After applying, Terraform will give you the S3 website URL.
You can open it in your browser to see your website live.

📌 Notes:

This project is for learning DevOps with Terraform and AWS.

No EC2 or manual setup used — everything is automated.













