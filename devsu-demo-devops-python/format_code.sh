#!/bin/bash

echo "Installing tools..."
pip install black isort

echo "Sorting imports..."
isort api/ demo/ --profile black --line-length 120

echo "Formatting code..."
black --line-length 120 api/ demo/

echo "Formatting completed!" 