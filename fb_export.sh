firebase emulators:export --force ./.firebase-data
DATE=`date +"%Y-%m-%d"`
zip -r "db-$DATE.zip" "./.firebase-data"