```markdown
# AWS High-Availability WordPress Infrastructure

## 📖 Overview
This repository provides a production-grade, highly available WordPress environment deployed on AWS. By leveraging **Infrastructure as Code (IaC)** via CloudFormation, the stack ensures consistency, scalability, and security across the deployment lifecycle.

## 🏗️ Architecture
![Architecture Diagram](docs/architecture.png)

This architecture is designed for resilience:
* **Network Layer:** A custom VPC spanning two Availability Zones (AZs) to ensure zero downtime during zonal failures.
* **Compute Layer:** An Auto Scaling Group (ASG) that dynamically adjusts the number of EC2 instances based on traffic, ensuring efficient load distribution.
* **Data Layer:** A Multi-AZ RDS instance, ensuring database redundancy and automated failover.
* **Security:** Isolated subnets (Public for Web, Private for Data) with security group ingress rules restricted to internal traffic only.

## 🚀 End-to-End Operational Lifecycle

### 1. Initialization
Clone the repository to your local machine and prepare the environment:
```bash
git clone [https://github.com/stephen-oni/VPC-EC2-ASG-RDS.git](https://github.com/stephen-oni/VPC-EC2-ASG-RDS.git)
cd VPC-EC2-ASG-RDS
chmod +x scripts/*.sh
```

### 2. Deployment
Execute the launch script to provision the entire cloud stack using your local AWS CLI:
```bash
./scripts/deploy.sh <YourStrongDatabasePassword>
```
* **Process:** This command triggers AWS CloudFormation to build the networking, database, and web server infrastructure.
* **Wait time:** Allow 3–5 minutes for the AWS Systems Manager (SSM) automation to fully install and configure the LAMP stack and WordPress.

### 3. Access & Verification
Once the stack shows `CREATE_COMPLETE` in your AWS CloudFormation console:
1. Go to the **EC2 Dashboard**.
2. Select an instance launched by your Auto Scaling Group.
3. Copy the **Public IPv4 address**.
4. Paste `http://<YOUR_PUBLIC_IP>` into your browser to initiate the WordPress "5-Minute Install" wizard.

### 4. Maintenance (Scaling)
Your infrastructure is self-managing:
* **Auto-Scaling:** If traffic spikes, the ASG automatically adds instances (up to 4).
* **High Availability:** If an instance or an Availability Zone fails, the ASG will automatically replace the instance in the healthy zone.

### 5. Termination (Decommissioning)
To remove all resources and stop AWS billing, run the cleanup script:
```bash
./scripts/cleanup.sh
```
* **Important:** This is a destructive action. It wipes the RDS database and terminates all EC2 instances permanently. Ensure you have exported any database data or media uploads before running this.
````</YourStrongDatabasePassword>

```
