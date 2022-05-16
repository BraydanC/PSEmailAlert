# I used this when I started to see last logon date of computer
# to confirm if it's being used still, or was likely retired.

$computers=import-csv C:\Users\user\filepath\location\for\pclist.csv
foreach($computer in $computers){
get-adcomputer $($computer.name) -properties "LastLogonDate" | Select Name, LastLogonDate 

}