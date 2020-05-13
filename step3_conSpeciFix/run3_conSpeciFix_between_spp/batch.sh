cat folder.list | while read i
do
 echo $i
 cd $i
 sh cmd.sh

 cd ./simulation/_conspecifix/scripts/database/
 python child_runner.py
 cd ../../../../
done
