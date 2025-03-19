#!/bin/bash

# Get the directory name from the argument
dir_name=$1

# change directory to project
cd "$dir_name" || exit

# Create index.html
cat <<EOF > src/index.html
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TailwindCSS Example</title>
<link href="./output.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
    <h1 class="text-3xl font-bold underline text-blue-600">
        Hello, TailwindCSS!
    </h1>
</body>
</html>
EOF
