# 📝 Rangers App – AKS with Automated Deployment Pipeline
⚙️ Overview
Building upon my previous Rangers App using a multi environment Web App project, this project automates the end-to-end deployment of the Rangers App using Azure DevOps, Docker, Terraform, and now... AKS. It scrapes match results, builds a containerized app, pushes it to Azure Container Registry, and deploys it to a production-grade AKS cluster.

I created this AKS-based version of RangersApp to deepen my understanding of container orchestration, Terraform lifecycle management, and secure CI/CD deployment on Kubernetes. It builds on my Web App project by introducing production-grade AKS infrastructure and declarative manifest application.

<img width="843" height="526" alt="Rangers-AKS drawio" src="https://github.com/user-attachments/assets/426bc55f-258a-4c50-b7a7-2ad41f7fd62f" />


Python Scraper → Docker Image → ACR → AKS (via Terraform + Manifests)
Azure DevOps → CI/CD Pipeline → AKS Deployment


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

📈 Platform Insights

Kubernetes task quirks and CLI fallback


🎯 Next Steps

Addition of Secure HTTPS to AKS cluster

Monitor service health and autoscaling

Note: No current need for Key Vault but a mock secret could be created to demonstrate know-how
