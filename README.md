Review IAM users, groups, and roles for permissions that can be abused to gain higher privileges, such as:

iam:CreatePolicyVersion

iam:SetDefaultPolicyVersion

iam:AttachUserPolicy

iam:AttachGroupPolicy

iam:AttachRolePolicy

iam:PutUserPolicy

iam:PutGroupPolicy

iam:PutRolePolicy

iam:PassRole

iam:CreateAccessKey

sts:AssumeRole

Remove or tightly restrict these permissions unless explicitly required for an approved admin role. Enforce least privilege and avoid attaching broad administrative permissions, especially wildcard actions like *:*, because they can enable direct or indirect privilege escalation. CIS explicitly recommends ensuring IAM policies with full administrative *:* privileges are not attached
