#!/bin/bash

# Nom des remotes
REMOTE_GITHUB="github"
REMOTE_GITLAB="gitlab"

# Branche courante (récupérée automatiquement)
BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Pushing branch '$BRANCH' to GitHub ($REMOTE_GITHUB)..."
git push $REMOTE_GITHUB $BRANCH
if [ $? -ne 0 ]; then
  echo "Erreur lors du push vers GitHub."
  exit 1
fi

echo "Pushing branch '$BRANCH' to GitLab ($REMOTE_GITLAB)..."
git push $REMOTE_GITLAB $BRANCH
if [ $? -ne 0 ]; then
  echo "Erreur lors du push vers GitLab."
  exit 1
fi

echo "Push effectué avec succès sur GitHub et GitLab !"
