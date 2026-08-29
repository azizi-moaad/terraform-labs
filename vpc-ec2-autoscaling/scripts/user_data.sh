#!/bin/bash
yum update -y
yum install -y httpd

# Fetch instance metadata (IMDSv2)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Auto Scaling Web Server</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #0f172a; color: #f8fafc; text-align: center; padding-top: 100px; }
        .card { background: #1e293b; display: inline-block; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.5); }
        h1 { color: #38bdf8; }
        p { font-size: 1.2rem; }
        .highlight { color: #4ade80; font-weight: bold; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Automated Compute Engine</h1>
        <p>Served from Instance: <span class="highlight">$INSTANCE_ID</span></p>
        <p>Availability Zone: <span class="highlight">$AZ</span></p>
    </div>
</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd