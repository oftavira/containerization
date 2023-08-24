#!/bin/bash

# 1. Create necessary directories and files
mkdir my_web_app
cd my_web_app
mkdir public

echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Web App</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Welcome to My Web App</h1>
        <button id="clickMe">Click Me!</button>
    </div>
    <script src="script.js"></script>
</body>
</html>' > public/index.html

echo '.container {
    font-family: Arial, sans-serif;
    text-align: center;
    margin-top: 50px;
}' > public/styles.css

echo 'document.getElementById("clickMe").addEventListener("click", function() {
    alert("Button was clicked!");
});' > public/script.js

# 2. Initialize Node.js app and install express
npm init -y
npm install express

echo 'const express = require("express");
const path = require("path");
const app = express();
const PORT = 3000;

app.use(express.static(path.join(__dirname, "public")));

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});' > server.js

# 3. Run the application
node server.js
