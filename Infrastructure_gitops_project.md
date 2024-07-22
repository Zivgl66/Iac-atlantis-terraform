# Infrastructure GitOps Project

## Overview

This project contains the Terraform code and configuration for deploying and managing infrastructure using Google Cloud Platform (GCP). The project uses Atlantis for GitOps automation and integrates with GitLab CI/CD for continuous integration and deployment.

## Architecture Design Document

### Infrastructure Setup and Components

1. **Virtual Private Cloud (VPC)**:

   - **VPC**: A custom VPC named `my-vpc-network` to provide network isolation.
   - **Subnets**:
     - **Public Subnet**: `public_subnet` with CIDR `10.0.1.0/24` for resources that need direct internet access.
     - **Private Subnet**: `private_subnet` with CIDR `10.0.2.0/24` for resources that should not be exposed directly to the internet.

2. **Compute Instances**:

   - Instances deployed in the private subnet to host the application, ensuring isolation from direct internet exposure.

3. **Load Balancer**:

   - An HTTP load balancer to distribute incoming traffic across instances. It listens on port 80 and forwards traffic to instances on port 5000.

4. **NAT Gateway**:

   - A NAT gateway to allow instances in the private subnet to access the internet for updates and other outbound connections.

5. **Firewall Rules**:

   - **SSH**: Allow SSH traffic on port 22 from the source ip.
   - **HTTP/HTTPS**: Allow HTTP and HTTPS traffic on ports 80 and 443.
   - **Application Port**: Allow traffic on port 5000 for internal communication between the load balancer and instances.

6. **Database and Datastore for Terraform State Management**:
   - **Google Cloud Datastore**: Used to manage the Terraform state lock mechanism, ensuring that only one Terraform process can run at a time. This prevents concurrent modifications to the infrastructure state.

### Security Measures Implemented

1. **Network Isolation**:

   - Private subnet for application instances to prevent direct internet access.
   - NAT gateway for outbound internet access from the private subnet.

2. **Firewall Rules**:

   - Restrictive firewall rules to allow only necessary traffic (SSH, HTTP, HTTPS, and internal application traffic).

3. **IAM and Service Accounts**:

   - Least privilege principle applied for IAM roles and service accounts.
   - Service account keys managed securely with environment variables and not hardcoded in scripts.

4. **Secret Management with HashiCorp Vault**:
   - Used HashiCorp Vault to securely store and manage secrets.
   - Environment variables are dynamically injected into the Terraform and application runtime, ensuring sensitive information is not exposed in the codebase.

### Monitoring Setup and Chosen Metrics

1. **Google Cloud Monitoring**:

   - Integrated with Google Cloud's operations suite to monitor the health and performance of instances, load balancers, and other resources.

2. **Key Metrics**:
   - **VM Instances**:
     - **CPU Utilization**: Monitor CPU usage to ensure instances are not over or underutilized.
     - **Memory Utilization**: Track memory usage for potential memory leaks or resource shortages.
   - **Load Balancer**:
     - **Utilization**: Monitor the load balancer's utilization to ensure it is handling traffic efficiently.
     - **Backend Request Count**: Track the number of requests handled by backend instances.
     - **Backend Latency**: Monitor the response time of backend instances to detect latency issues.
   - **Global External Application Load Balancer Rule**:
     - **Response Bytes**: Measure the amount of response data sent to clients to monitor bandwidth usage.

### Justification for Key Design Decisions

1. **Use of VPC and Subnets**:

   - Provides network isolation and control over IP addressing.
   - Ensures that internal components are not exposed directly to the internet.

2. **Load Balancer**:

   - Distributes traffic evenly across instances, improving availability and fault tolerance.

3. **Firewall Rules**:

   - Restrictive rules enhance security by limiting access to only necessary ports and protocols.

4. **IAM and Service Accounts**:

   - Ensures secure and controlled access to Google Cloud resources, adhering to the principle of least privilege.

5. **Monitoring and Metrics**:

   - Selected metrics provide comprehensive visibility into the performance and health of the infrastructure.
   - Helps in proactive identification and resolution of issues.

6. **Secret Management with HashiCorp Vault**:

   - Ensures that sensitive information such as passwords and credentials are securely stored and managed.
   - Integrates with Terraform and application code to inject secrets at runtime, reducing the risk of exposure.

7. **Database and Datastore for Terraform State Management**:
   - Using Google Cloud Datastore to manage Terraform state locks prevents concurrent modifications, ensuring state consistency and integrity.

## Challenges Faced and Solutions

### Challenge: Planning the Topology of the Cloud VPC and Using a Private Subnet to Secure the Instance and App

- **Solution**: Designed a VPC with both public and private subnets. Instances hosting the application are placed in a private subnet to ensure they are not directly exposed to the internet. A NAT gateway is used for outbound internet access from the private subnet, ensuring security and control over traffic.

### Challenge: Using the Application Load Balancer to Provide Access

- **Solution**: Implemented an HTTP load balancer to distribute traffic across instances. The load balancer forwards requests to instances in the private subnet. This setup ensures that the application is accessible while keeping the backend instances secure.

## Monitoring and Logging

### Key Metrics to Track

- **Compute Instances**:
  - CPU utilization, memory usage, disk I/O, network traffic
- **Load Balancer**:
  - Request count, latency, HTTP error rates, backend instance health
- **Firewall Logs**:
  - Allowed traffic, denied traffic
- **Application Logs**:
  - Error logs, performance logs, access logs

### Example Alerts

- High CPU usage: Alert if CPU usage > 80% for 5 minutes.
- High memory usage: Alert if memory usage > 80% for 5 minutes.
- HTTP 5xx error rate: Alert if HTTP 5xx error rate > 5% for 5 minutes.
- Disk I/O: Alert if disk read/write operations exceed a threshold.

## Conclusion

This project demonstrates the use of Terraform and GitOps practices to manage infrastructure on Google Cloud Platform. By integrating Atlantis and GitLab CI/CD, we ensure a robust and automated workflow for infrastructure changes. Monitoring and logging are set up to provide insights and alerts on the infrastructure's health and performance.
