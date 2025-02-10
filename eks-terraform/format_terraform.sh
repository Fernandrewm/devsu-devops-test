#!/bin/bash

if ! command -v terraform &> /dev/null; then
    echo "❌ Error: terraform not installed"
    echo "Please install terraform first: https://developer.hashicorp.com/terraform/install"
    exit 1
fi

echo "🔍 Checking Terraform files..."

echo "🔄 Formatting files..."
terraform fmt -recursive

if [ $? -eq 0 ]; then
    echo "✅ Formatting completed successfully!"
else
    echo "❌ Error during formatting"
    exit 1
fi

echo "🔍 Validating configuration..."
terraform validate

if [ $? -eq 0 ]; then
    echo "✅ Validation completed successfully!"
else
    echo "❌ Error during validation"
    exit 1
fi 