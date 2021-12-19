#!/bin/bash
#check our hostname 
     targetHostName=$(hostname) 
     if [[ "$targetHostName" == "server1" ]]; then
        targetHostName="server2"
     else
         targetHostName="server1"
      fi	
      echo $targetHostName
for i in "$@"
do
:
done
folderName=$i
bytes=0;
for fileName in "$@"  
do
   if [[  "$fileName"  != "$folderName" ]] ; then
#check copied file size
       myPi=$(du -csb $fileName | grep total | sed 's/ *\stotal* *\(.*\)/\1/')
#copy
       rcp $fileName $targetHostName:$folderName
#if rcp return 0 then it went OK       
       if [ $? -eq 0 ];
         then
         bytes=$(( $bytes+myPi ))	
       fi
fi
done
echo $bytes