#!/bin/bash

# Hostinger FTP Deployment Script for NIS2-Compliant.com

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

# Upload files using lftp
echo "Uploading files to Hostinger..."
echo ""

lftp -e "
set ftp:ssl-allow no
open -u $FTP_USER,$FTP_PASSWORD $FTP_HOST
cd $FTP_DIR
put index.html
put styles.css
bye
"

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
    echo "Please check your FTP credentials and try again."
    echo ""
fi
