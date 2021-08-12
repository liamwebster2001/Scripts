# Make executable with chmod +x <<filename.sh>>

CURRENTDIR=${pwd}

cd

# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
echo "What name do you want to give your remote repo?"
read REPO_NAME

echo "Enter a repo description: "
read DESCRIPTION

echo "Enter a folder name: "
read FOLDER_NAME

PROJ_PATH="/Users/liamwebster/Documents/Projects"
cd "$PROJ_PATH"
mkdir $FOLDER_NAME

PROJECT_PATH="/Users/liamwebster/Documents/Projects/$FOLDER_NAME"
cd "$PROJECT_PATH"

# step 4: initialise the repo locally, create blank README, add and commit
git init
touch README.MD
git add README.MD
git commit -m 'initial commit -setup with .sh script'


curl \
  -X POST \
  -H "Authorization: token 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" \
  https://api.github.com/user/repos \
  -d '{"name":"'"$REPO_NAME"'"}'

# step 5 use github API to log the user in
#curl -u liamwebsterreal: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 -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}" https://api.github.com/user/repos
#curl -H "Authorization: token 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" --data '{"name":'$REPO_NAME'}' https://api.github.com/user/repos


#  step 6 add the remote github repo to local repo and push
git remote add origin git@github.com:liamwebsterreal/${REPO_NAME}.git
git branch -M main
git push -u origin main
#@git remote add origin https://github.com/liamwebsterreal/${REPO_NAME}.git
#git push --set-upstream origin master

# step 7 change to your project's root directory.
cd "$PROJECT_PATH"
code OUTLINE.txt

echo "Done. Go to https://github.com/$USERNAME/$REPO_NAME to see." 
echo " *** You're now in your project root. ***"