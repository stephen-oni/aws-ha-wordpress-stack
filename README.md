# AWS High-Availability WordPress

Automated deployment of a scalable WordPress stack on AWS.

## Architecture
![Architecture Diagram](docs/architecture.png)

## Quick Start
1. `chmod +x scripts/*.sh`
2. `./scripts/deploy.sh <YourDBPassword>`

## Structure
- `/infrastructure`: CloudFormation Template.
- `/scripts`: Deployment & Cleanup automation.
