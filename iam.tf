# IAM Role for CodePipeline Assume Role
resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-role-for-s3-deployment"
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "codepipeline.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
 
# Inline Policy for CodePipeline Role
resource "aws_iam_role_policy" "codepipeline_s3_policy" {
  name = "codepipeline-s3-access-policy"
  role = aws_iam_role.codepipeline_role.id
 
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        Resource = [
          "${aws_s3_bucket.static_website_bucket.arn}",
          "${aws_s3_bucket.static_website_bucket.arn}/*"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "codedeploy:CreateDeployment",
          "codedeploy:GetApplication",
          "codedeploy:GetDeployment",
          "codedeploy:GetDeploymentConfig",
          "codedeploy:RegisterApplicationRevision",
          "codedeploy:ListApplications",
          "codedeploy:ListDeploymentConfigs",
          "codedeploy:ListDeployments",
          "codedeploy:ListApplicationRevisions"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "codebuild:StartBuild",
          "codebuild:BatchGetBuilds",
          "codebuild:StopBuild"
        ],
        Resource = "*"
      }
    ]
  })
}
 
# Attach Admin Access to CodePipeline Role
resource "aws_iam_role_policy_attachment" "codepipeline_admin_access" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
 
# IAM Role for CodeBuild Assume Role
resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-role-for-static-website"
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "codebuild.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
 
# Inline Policy for CodeBuild Role
resource "aws_iam_role_policy" "codebuild_s3_policy" {
  name = "codebuild-s3-access-policy"
  role = aws_iam_role.codebuild_role.id
 
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        Resource = [
          "${aws_s3_bucket.static_website_bucket.arn}",
          "${aws_s3_bucket.static_website_bucket.arn}/*"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}
 
# Attach Admin Access to CodeBuild Role
resource "aws_iam_role_policy_attachment" "codebuild_admin_access" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
