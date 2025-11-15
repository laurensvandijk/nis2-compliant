#!/bin/bash

# Hostinger FTP Deployment Script using curl

FTP_HOST="77.37.34.63"
FTP_USER="u879389666.nis2-compliant.com"
FTP_DIR="public_html"

echo "==================================="
echo "NIS2-Compliant.com Deployment"
echo "==================================="
echo ""

# Check if password is provided
if [ -z "$FTP_PASSWORD" ]; then
    echo "Please enter your FTP password:"
    read -s FTP_PASSWORD
    echo ""
fi

echo "Uploading index.html..."
curl -T index.html ftp://$FTP_HOST/$FTP_DIR/ --user $FTP_USER:$FTP_PASSWORD

echo ""
echo "Uploading styles.css..."
curl -T styles.css ftp://$FTP_HOST/$FTP_DIR/ --user $FTP_USER:$FTP_PASSWORD

if [ $? -eq 0 ]; then
    echo ""
    echo "==================================="
    echo "✓ Deployment successful!"
    echo "==================================="
    echo "Your website is now live at:"
    echo "https://nis2-compliant.com"
    echo ""
else
    echo ""
    echo "==================================="
    echo "✗ Deployment failed!"
    echo "==================================="
    echo "Please check your FTP credentials."
    echo ""
fi
