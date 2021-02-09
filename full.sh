# Set up the working environment
FILECACHE=filecache
CLEAN_SITE=$(echo $1 | sed 's/[^A-Za-z0-9]//g');
CMP_DIR=$FILECACHE/$CLEAN_SITE;
OLD_FILE=$CMP_DIR/old
NEW_FILE=$CMP_DIR/new

mkdir -p $FILECACHE;
mkdir -p $CMP_DIR;
touch $OLD_FILE;

# Copy contents of site to local cache
curl $1 > $NEW_FILE;

# Compare the new and old files and email if necessary
if [ -s $OLD_FILE ]
then
  echo "Comapring versions of $1"
  # if [ -n "$(cmp $NEW_FILE $OLD_FILE)" ]
  if ! cmp $OLD_FILE $NEW_FILE > /dev/null 2>&1
  then
    echo "Versions were different";
    node index.js $1 $2;
  else
    echo "Versions were the same";
  fi
else
  echo "No old version found for $1"
fi

mv $NEW_FILE $OLD_FILE;
