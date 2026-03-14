# Server Health Monitoring Automation with CI/CD

This project demonstrates a basic DevOps workflow by automating a server health monitoring script using GitHub Actions.

## Project Overview

The project includes a Bash script that checks the health of a Linux server by monitoring:

- Disk usage
- Memory usage
- CPU usage
- Running processes

The script is integrated with a CI pipeline using GitHub Actions, which automatically runs the script whenever code is pushed to the repository.

## Tech Stack

- AWS EC2 (RHEL)
- Git
- GitHub
- GitHub Actions
- Bash scripting

## CI/CD Workflow

1. Code is pushed to the GitHub repository
2. GitHub Actions workflow is triggered
3. A GitHub runner (Ubuntu) starts automatically
4. The repository is cloned
5. The health_check.sh script is executed
6. Output logs are generated in the GitHub Actions pipeline

## Project Structure
server-health-monitor
│
├── health_check.sh
└── .github
└── workflows
└── ci.yml


## Script Output Example
===== Server Health Report =====

Disk Usage
Memory Usage
CPU Usage
Top Processes

## How to Run the Script

Clone the repository:
git clone https://github.com/prateek-11/server-health-monitor.git

Navigate to the project folder:
cd server-health-monitor

Make the script executable:
chmod +x health_check.sh

Run the script:
./health_check.sh


## What I Learned

- Git version control and repository management
- Creating CI/CD pipelines using GitHub Actions
- Automating tasks with Bash scripting
- Integrating Linux scripts with DevOps workflows
