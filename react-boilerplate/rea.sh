#!/bin/bash

# npm create vite@latest my-react-app -- --template react-ts

echo "Enter the name for your React TypeScript project:"
read project_name

# Check if project_name is empty
if [ -z "$project_name" ]; then
  echo "Error: Project name cannot be empty."
  exit 1
fi
