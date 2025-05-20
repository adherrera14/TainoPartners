#!/bin/bash

# Create a backup of current root files that might get overwritten
mkdir -p .github_pages_backup
cp README.md .github_pages_backup/ 2>/dev/null || :
cp index.html .github_pages_backup/ 2>/dev/null || :

# Copy all files from app/ to root
cp -r app/* .

# Rename ht.access to .htaccess if it exists
if [ -f ht.access ]; then
  mv ht.access .htaccess
fi

# Add a note to the README about the structure
echo -e "\n\n## Note\n\nThis repository is structured for GitHub Pages. The development files are in the \`app/\` directory, but for deployment, the files are copied to the repository root." >> README.md

echo "Files have been prepared for GitHub Pages!"
echo "You can now commit and push these changes to your repository."
echo "After pushing, enable GitHub Pages in your repository settings to deploy from the main branch root folder."
