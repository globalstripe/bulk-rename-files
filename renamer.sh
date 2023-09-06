# OIFS here is a user defined variable that serves to backup the current
OIFS="$IFS"
# Reset the field seperator to somthign else
IFS=$'\n'
# This only splits workds on newline .. not on space


for i in $( ls *.jpg ); do
     echo "Filename: $i"
     NoSpaces=`echo $i | sed -e 's/ /_/g'`
     TeamFix1=`echo $NoSpaces | sed -e 's/MICH/MIC/g'`
     TeamFix2=`echo $TeamFix1 | sed -e 's/MBFC/MDB/g'`
     TeamFix3=`echo $TeamFix2 | sed -e 's/CFC/CHA/g'`
     NewFileName=$TeamFix3
     echo "NewFileName: $NewFileName"
     #read x
     if [ "$i" == "$NewFileName" ]; then
      echo "No Changes to Filename"
     else
      echo "Renaming File"
      mv $i $TeamFix3
     fi
done
# Restore the field separator you backed up at the beginning
IFS="$OIFS"
