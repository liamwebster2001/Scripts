
CURRENTDIR=${pwd}

# step 1: Get name of file and location
echo "What is the filename?"
read FILE_NAME

echo "Where is the file?"
read FILE_LOCATION

echo "Convert to what?"
read CONVERT_FILE

FILE_PATH="/Users/liamwebster/$FILE_LOCATION"
cd "$FILE_PATH"

magick convert $FILE_NAME $CONVERT_FILE