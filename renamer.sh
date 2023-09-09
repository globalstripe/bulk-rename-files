clear
#echo "Current IFS: $IFS"
# OIFS here is a user defined variable that serves to backup the current $IFS Field separator value
OIFS="$IFS"
# Reset the field seperator to somethinh else - in this case \n only
IFS=$'\n'
# This only splits words on newline .. not on space


for i in $( ls *.jpg ); do
     echo -n "Checking Filename: $i"
     NoSpaces=`echo $i | sed -e 's/ /_/g'`
     TeamFix1=`echo $NoSpaces | sed -e 's/MICH/MIC/g'`
     TeamFix2=`echo $TeamFix1 | sed -e 's/MBFC/MDB/g'`
     TeamFix3=`echo $TeamFix2 | sed -e 's/CFC/CHA/g'`
     NewFileName=$TeamFix3
     #read x
     if [ "$i" == "$NewFileName" ]; then
      echo " OK"
     else
      echo " KO"
      echo -e "Renaming Filename: $NewFileName"
      mv $i $TeamFix3
     fi
done
# Restore the field separator you backed up at the beginning
IFS="$OIFS"
