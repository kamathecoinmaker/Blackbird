# REPO_URL https://github.com/kamathecoinmaker/Blackbird

# Step 1 - Create/verify React application
npx create-react-app my-app
npm start

# Step 2 - Initialize Git, commit, and create GitHub repository
git init
git status
git add .
git commit -m "Initial commit"
gh auth status
gh repo create Blackbird --public --source=. --remote=origin --push
gh repo view --web

# Rename main branch to master
git branch -m main master
git push -u origin master
gh repo edit --default-branch master

# Step 3 - Create and switch to update_logo branch
git switch -c update_logo
git branch
git status

# Step 4 - Replace the logo
code src\App.js

# Step 5 - Replace the link
code src\App.js
npm start

# Step 6 - Commit and push changes
git status
git diff
git add src/App.js
git diff --cached
git commit -m "Update logo and link"
git status
git log --oneline --decorate -5
git push -u origin update_logo
git branch -a
git status

# Step 7 - Create Pull Request
git diff master...update_logo
gh pr create --base master --head update_logo --title "Update logo and link" --body "Replaced the default React logo with the Propeller Aero logo and updated the link to the DirtMate page."
gh pr view
gh pr view --json number,title,baseRefName,headRefName,state,url
gh pr status

# Step 8 - Merge Pull Request
gh pr merge --merge
gh pr view
gh pr status