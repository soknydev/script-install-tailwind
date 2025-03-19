#!/bin/bash

# Prompt user for project name
echo -n "Enter project name: "
read dir_name

# Check if directory already exists
if [ -d "$dir_name" ]; then
    echo "Directory '$dir_name' already exists."
else
    # Create project directory
    mkdir "$dir_name"
    cd "$dir_name"

    # Initialize npm
    npm init -y

    # Install Tailwind CSS and Tailwind CLI
    npm install -D tailwindcss @tailwindcss/cli

    # Create a source directory and input.css file
    mkdir src
    echo '@import "tailwindcss";' > src/input.css

    # Start Tailwind CLI build process in the background
    npx @tailwindcss/cli -i ./src/input.css -o ./src/output.css --watch &
    
    # Capture the Process ID (PID) of Tailwind CLI
    TAILWIND_PID=$!

    # Create the example HTML file
    cd ../
    ls -l
    bash create_html_file.sh "$dir_name"

    # Allow some time for processing
    sleep 5  # Adjust if needed

    # Stop Tailwind CLI process
    # kill $TAILWIND_PID

    echo "Tailwind CLI installation and setup completed successfully."
fi
