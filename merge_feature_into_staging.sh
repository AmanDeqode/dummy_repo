feature_branch="feat/2"
staging_branch="staging"

# Sleep for 1 minute
sleep 1m

# Set Git credentials (replace with your actual username and password)
git_username="achoudhary@deqode.com"
git_password="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"

# Set the Git remote URL with embedded credentials
git_remote="https://${achoudhary@deqode.com}:${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}@https://github.com/AmanDeqode/dummy_repo.git"

# Fetch the latest changes from the remote repository
git fetch

# Ensure both branches exist
if git rev-parse --quiet --verify "$feature_branch" && git rev-parse --quiet --verify "$staging_branch"; then
  # Checkout the staging branch
  git checkout "$staging_branch"

  # Merge feature1 into staging
  git merge --no-ff "$feature_branch"

  # Check if the merge was successful
  if [ $? -eq 0 ]; then
    echo "Merged $feature_branch into $staging_branch successfully."
    # Push the changes to the remote repository
    git push origin "$staging_branch"
  else
    echo "Merge failed. Please resolve conflicts and try again."
  fi

else
  echo "One or both branches do not exist. Please check your branch names."
fi


