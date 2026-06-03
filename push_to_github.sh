#!/usr/bin/env bash
# Commit the ATG dashboard + README and push to GitHub.
# Run on your Mac:  bash ~/CISA-Dashboard/push_to_github.sh
set -e
cd "$(dirname "$0")"

# Start clean (removes any partial repo state)
[ -d .git ] && rm -rf .git

git init -b main
git add README.md ATG_US_Nationwide_Dashboard.html
git commit -m "Add nationwide ATG exposure dashboard and README"
git remote add origin https://github.com/jrsherlock/atg-systems.git
git push -u origin main

echo "Pushed to https://github.com/jrsherlock/atg-systems"
