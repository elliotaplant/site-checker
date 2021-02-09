# Set up the working environment
FILECACHE=filecache
CLEAN_SITE=$(echo $1 | sed 's/[^A-Za-z0-9]//g');
CMP_DIR=$FILECACHE/$CLEAN_SITE;
OLD_FILE=old
NEW_FILE=new

mkdir -p $FILECACHE;
mkdir -p $CMP_DIR;
touch $CMP_DIR/$OLD_FILE;

# Copy contents of site to local cache
curl $1 > $CMP_DIR/$NEW_FILE;

# Compare the new and old files and email if necessary
cmp $CMP_DIR/$NEW_FILE $CMP_DIR/$OLD_FILE || (node index.js $1 $2 && mv $CMP_DIR/$NEW_FILE $CMP_DIR/$OLD_FILE);
