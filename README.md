# Honeytoken Project - analyse potential security theats.

## Overview

The Honeytoken Project is a cybersecurity initiative designed to detect and analyze potential security threats by deploying fake access tokens, known as honeytokens, in strategic locations. By monitoring the use of these honeytokens, you can gain insights into the behavior of potential attackers and enhance your organization's security posture.

## How It Works

### Honeytoken Setup

```bash
# Clone the Repository
git clone https://github.com/ggcarny/honeytoken.git

# AWS Account Setup: Configure AWS credentials and permissions
# Update Configurations in config.json, including Slack webhook URL

# Deploy Honeytoken Lambda Function
cd honeytoken
./deploy.sh

# Set Up API Gateway (Optional for web-based exploitation)
./deploy-api-gateway.sh
```
### Leak the Honeytoken

Strategically leak the honeytoken in places where unauthorized access or usage might occur.

Example: Leaking the honeytoken in a configuration file

```json
// config.json
{
    "api_key": "your_real_api_key",
    "honeytoken": "fake_access_token_123",
    "slack_webhook": "https://hooks.slack.com/services/your/slack/webhook"
}
```
###Moitor the usage of the fake credential through slack channel.
Every time the tokens are accessed, it will send a message to the slack group.
```
Honeytoken Alert!
Unauthorized access detected using honeytoken: `fake_access_token_123`
Source IP: 123.456.789.0
Timestamp: 2022-01-01 12:00:00 UTC
```
## Use Cases

1. **Detect Unauthorized Access**: Identify and track unauthorized access attempts when the honeytoken is used.

2. **Track Compromised Credentials**: Gain insights into potential compromised credentials when the leaked honeytoken is utilized.

3. **Behavior Analysis**: Analyze the behavior of attackers based on the patterns of honeytoken usage.

4. **Web-based Exploitation**: Monitor web-based honeytoken leaks by using API Gateway to expose the Lambda function through HTTP.

    Example: Leaking honeytoken via HTTP

    ```bash
    curl -X POST https://your-api-gateway-url/leak -d '{"token": "fake_access_token_123"}'
    ```

    The Lambda function will process the HTTP request and trigger Slack alerts.

