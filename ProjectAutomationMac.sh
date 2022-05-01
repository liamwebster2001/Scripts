# Make executable with chmod +x <<filename.sh>>

CURRENTDIR=${pwd}

cd

# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
echo "What name do you want to give your remote repo?"
read REPO_NAME

PROJ_PATH="/Users/liamwebster/Documents/Projects"
cd "$PROJ_PATH"
mkdir $REPO_NAME

PROJECT_PATH="/Users/liamwebster/Documents/Projects/$REPO_NAME"
cd "$PROJECT_PATH"

# step 4: initialise the repo locally, create blank README, add and commit
git init
touch README.MD
touch .gitignore
git add README.MD
git add .gitignore
git commit -m 'Initial Commit: add README.MD and .gitignore'

curl -H 'Authorization: token [TOKEN_HERE]' https://api.github.com/user/repos -d '{"name":"'$REPO_NAME'"}'

#  step 6 add the remote github repo to local repo and push
git remote add origin git@github.com:liamwebsterreal/$REPO_NAME.git
git branch -M main
git push -u origin main

echo "Done. Go to https://github.com/liamwebsterreal/$REPO_NAME to see." 

