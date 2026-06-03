#!/usr/bin/env bash
# Publish the ATG dashboard to GitHub Pages.
# Run on your Mac:  bash ~/CISA-Dashboard/publish_pages.sh
set -e
cd "$(dirname "$0")"
REPO="jrsherlock/atg-systems"

echo "==> Committing and pushing index.html"
git add index.html ATG_US_Nationwide_Dashboard.html README.md
if ! git diff --cached --quiet; then
  git commit -m "Add index redirect for GitHub Pages"
else
  echo "    (nothing new to commit)"
fi
git push

echo "==> Enabling GitHub Pages (main / root)"
BODY='{"source":{"branch":"main","path":"/"}}'
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  if echo "$BODY" | gh api --method POST "repos/$REPO/pages" --input - >/dev/null 2>&1; then
    echo "    Pages enabled."
  elif echo "$BODY" | gh api --method PUT "repos/$REPO/pages" --input - >/dev/null 2>&1; then
    echo "    Pages source updated (was already enabled)."
  else
    echo "    Could not enable via API. Do it once in the web UI:"
    echo "      Settings -> Pages -> Source: Deploy from a branch -> main / (root) -> Save"
  fi
else
  echo "    GitHub CLI not signed in. Enable Pages once in the web UI:"
  echo "      Settings -> Pages -> Source: Deploy from a branch -> main / (root) -> Save"
fi

echo
echo "==> Done. After the build finishes (~1 min), the dashboard is live at:"
echo "      https://jrsherlock.github.io/atg-systems/"
