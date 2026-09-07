#!/usr/bin/env bash
set -e

echo "====================================================="
echo "  🚀 Flutter Exp 2 (Responsive UI) - Push & Deploy   "
echo "====================================================="

if [ ! -d ".git" ]; then
    echo "📌 Initializing Git repository..."
    git init
    git branch -M main
fi

echo "📌 Staging files..."
git add .

commit_msg=${1:-"Initial commit: Flutter Experiment 2 Responsive UI Application"}
echo "📌 Creating commit: '$commit_msg'..."
git commit -m "$commit_msg" || echo "No changes to commit."

if git remote | grep -q "^origin$"; then
    echo "📌 Current remote origin:"
    git remote get-url origin
else
    echo ""
    echo "====================================================="
    echo "Enter your GitHub repository URL for Experiment 2:"
    echo "Example: https://github.com/your-username/flutter_exp_2.git"
    echo "====================================================="
    read -p "Repository URL: " repo_url
    if [ -n "$repo_url" ]; then
        git remote add origin "$repo_url"
        echo "✅ Remote origin added: $repo_url"
    else
        echo "⚠️ No repository URL provided."
        exit 0
    fi
fi

echo ""
echo "🚀 Pushing main branch..."
git push -u origin main

echo ""
echo "🚀 Creating and pushing gh-pages branch directly..."
git checkout --orphan gh-pages-temp 2>/dev/null || git checkout -b gh-pages-temp
cp web/preview.html index.html
cp web/preview.html 404.html
cp web/preview.html preview.html
cp web/manifest.json manifest.json
git rm -rf --cached . 2>/dev/null || true
git add index.html 404.html preview.html manifest.json
git commit -m "Deploy live web app to gh-pages branch" || true
git push -f origin gh-pages-temp:gh-pages
git checkout -f main
git branch -D gh-pages-temp 2>/dev/null || true

echo ""
echo "====================================================="
echo "🎉 Code & gh-pages pushed successfully to GitHub!"
echo "Enable GitHub Pages under Settings -> Pages (Select gh-pages branch)."
echo "====================================================="
