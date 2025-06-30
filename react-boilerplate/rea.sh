#!/bin/bash

# npm create vite@latest my-react-app -- --template react-ts

echo "Enter the name for your React TypeScript project:"
read project_name

# Check if project_name is empty
if [ -z "$project_name" ]; then
  echo "Error: Project name cannot be empty."
  exit 1
fi

# Create root project dir by the provided name and move inside
mkdir $project_name 
cd $project_name

# create frontend and backend directories
npm create vite@latest "$project_name-frontend" -- --template react-ts

mkdir "$project_name-backend" 
cd "$project_name-backend" 
touch BACKEND.md

cd ..

# Create DB folder
mkdir "$project_name-db" 
cd "$project_name-db" 
touch DB.md

cd ..
cd ..

sqlite3 "$project_name/$project_name-db/$project_name.db" < dbschema.sql