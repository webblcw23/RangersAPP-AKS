📝 Rangers App – AKS with Automated Deployment Pipeline
⚙️ Overview
Building upon my previous Rangers App using a multi environment Web App project, this project automates the end-to-end deployment of the Rangers App using Azure DevOps, Docker, Terraform, and now... AKS. It scrapes match results, builds a containerized app, pushes it to Azure Container Registry, and deploys it to a production-grade AKS cluster.


🚀 Tech Stack
Azure DevOps Pipelines – CI/CD orchestration

Terraform – Infrastructure provisioning

Docker – Containerization

Azure Container Registry (ACR) – Image hosting

Azure Kubernetes Service (AKS) – App hosting

Python – Data scraping

Kubernetes Manifests – Declarative deployment

📦 Pipeline Stages
Build & Scrape

Sets up Python environment

Scrapes latest match results

Publishes results as build artifact

Docker Build & Push

Downloads scraped data

Builds Docker image with multiple tags

Pushes to ACR

AKS Deployment

Applies Terraform to provision infrastructure

Uses Azure CLI to apply Kubernetes manifests

Fetches external IP for live access

🔐 Secrets & Security
Uses secure ARM service connection for Terraform and AKS

Secrets injected via environment variables

No hardcoded credentials

📈 Lessons Learned
YAML path sensitivity in Azure Pipelines

Kubernetes task quirks and CLI fallback

Importance of debug steps for agent visibility

Platform ownership means knowing when to drop the abstraction

🎯 Next Steps

Monitor service health and autoscaling

Note: No current need for Key Vault but a mock secret could be created to demonstrate know-how