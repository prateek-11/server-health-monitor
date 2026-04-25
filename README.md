# 🚀 Server Health Monitoring System (DevOps Project)

This project demonstrates a **CI/CD-driven server monitoring and alerting system** built using GitHub Actions and AWS services.

It automatically monitors CPU utilization on an EC2 instance and sends alerts when a defined threshold is exceeded.

---

## 📌 Features

* ⏱️ Automated execution using GitHub Actions (cron-based scheduling)
* 🔐 Secure SSH connection to EC2 instance
* 📊 Real-time CPU monitoring using Bash
* 🚨 Alerting using AWS SNS (email notifications)
* 🧠 Smart cooldown logic to prevent alert flooding
* 📝 Logging for every execution cycle
* 🌐 Includes server metadata (hostname, IP, timestamp) in alerts

---

## 🏗️ Architecture

GitHub Actions (Scheduler)
↓
SSH into EC2
↓
Execute Bash Script
↓
Check CPU Utilization
↓
AWS SNS → Email Alert 🚨

---

## 🧰 Tech Stack

* GitHub Actions (CI/CD)
* AWS EC2
* AWS SNS (Simple Notification Service)
* Bash Scripting
* Linux

---

## ⚙️ How It Works

1. GitHub Actions triggers the workflow every 5 minutes.
2. It connects to the EC2 instance via SSH.
3. The script (`health_check.sh`) runs on EC2.
4. CPU usage is calculated.
5. If CPU exceeds threshold:

   * Alert is sent via AWS SNS
   * Cooldown logic prevents repeated alerts
6. Logs are stored locally on the server.

---

## 📂 Project Structure

```
.
├── .github/workflows/ci.yml   # GitHub Actions workflow
├── health_check.sh            # Monitoring script
├── README.md
```

---

## 🔔 Sample Alert

```
🚨 High CPU Alert

Server: ip-172-31-10-45
IP: 172.31.10.45
CPU Usage: 78%
Time: Tue Apr 21 21:10:00 IST 2026
```

---

## 🧠 Cooldown Logic

To prevent alert spam:

* Alerts are sent only once during a high CPU spike
* A cooldown timer ensures alerts are not repeatedly triggered
* Alerts resume if CPU remains high after cooldown period

---

## 🔐 Security

* Uses IAM Role attached to EC2 (no hardcoded credentials)
* SSH authentication via GitHub Secrets
* Principle of least privilege can be applied for SNS access

---

## 🚀 Future Enhancements

* 📈 Monitor additional metrics (Memory, Disk, Load)
* 📦 Dockerize the monitoring script
* 💬 Integrate Slack/Teams alerts
* 📊 Add dashboard (Prometheus + Grafana)
* ⏲️ Dynamic threshold configuration

---

## 📎 GitHub Actions Workflow

The workflow uses:

* `schedule` trigger (cron)
* SSH execution on EC2
* Automated script execution

---

## 🎯 Key Learnings

* Implemented CI/CD as a scheduler instead of traditional cron
* Integrated AWS services for real-time alerting
* Designed alert cooldown mechanism to avoid noise
* Managed IAM roles for secure service communication

---

## 👨‍💻 Author

Prateek Sahu

---

## ⭐ If you like this project, feel free to star the repo!
