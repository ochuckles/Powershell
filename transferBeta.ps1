###############################################
##########======Transfer Program=====##########
###############################################

#Made by Ian O'Leary - 2/13/186
#Version: Beta
#Goal is to transfer files from DataDrives on the Neuralynx data
#recording machines to the data processing machine.  
#For more information, see ReadMe file

#++++++++ Currently does not interface with processing script. ++++++++

#Start Log

$dateTime = Get-Date
Add-Content C:\Users\cioleary\Documents\powershell_scripts\testCopy_log.txt "`n 
`n 
==============================================================================`n
`n
Transfer Script has started running at $dateTime `n
`n
==============================================================================`n
`n" 

#----Establish Paths and move data to Processing Machine----#

#Rig2 path
$R2 = "\\LAB3-PC\test_LAB3"

#Rig3 path
#$R3 = "insert path here"

#Rig4
#$R4 = "insert path here"

#Rig6
#$R6 = "insert path here"

#Destination path
$Destination = "C:\Users\cioleary\Desktop\test_dest"

#Copy folders
(ROBOCOPY $R2 $Destination /e /SEC /W:30 /R:10 /log+:C:\Users\cioleary\Documents\powershell_scripts\testCopy_log.txt)
#(ROBOCOPY $R3 $Destination /e /SEC /W:30 /R:10 /log+:C:\Users\cioleary\Documents\powershell_scripts\testCopy_log.txt)
#(ROBOCOPY $R4 $Destination /e /SEC /W:30 /R:10 /log+:C:\Users\cioleary\Documents\powershell_scripts\testCopy_log.txt)
#(ROBOCOPY $R6 $Destination /e /SEC /W:30 /R:10 /log+:C:\Users\cioleary\Documents\powershell_scripts\testCopy_log.txt)

#-----------Run signal processing script-----------#

#Use do loop
#$process = do{
#    Start-Process -FilePath "C:\Users\cioleary\Documents\powershell_scripts\tar_test.m" [$Destination]
#}
#Wait until MatLab is done
#until($? = True)


#Copy working data to NAS
$NAS = "S:\test_NAS"
$outputfiles = "C:\Users\cioleary\Desktop\test_dest"

(ROBOCOPY $outputfiles $NAS /e /SEC /W:30 /R:10 /log+:C:\Users\cioleary\Documents\powershell_scripts\testCopy_log.txt)
#include write to log file

#-----------Copy archival data to Lolo-----------#

#Load WinSCP to facilitate sftp transfer
Add-Type -Path "C:\Program Files (x86)\WinSCP\WinSCPnet.dll"

#Set up session options 
$sessionOptions = New-Object WinSCP.SessionOptions -Property @{
    #designate protocol (SFTP)
    Protocol = [WinSCP.Protocol]::Sftp
    #Lolo's location
    HostName = "lolo.washington.edu"
    #general lab username
    UserName = "cioleary"
    #associated password
    Password = "|@/\/013@rY"
    #include a SSH fingerprint. This is created by WinSCP and can be saved 
    #within the program and applied here. Do this for each change to user ID
    SshHostKeyFingerprint = "ssh-rsa 2048 WRc44xc+R6rjPAYmpovoKwnR+Ryd8tTMnsF6trER+/8="
}

#Create an object for easy use
$session = New-Object WinSCP.Session

try
{
    #Connect to Lolo
    $session.Open($sessionOptions)

    #Transfer files
    $session.PutFiles("C:\Users\cioleary\Desktop\test_dest", "/archive/eblab/test_transfer/*").Check()
}
finally
{
    #Close session
    $session.Dispose()
}

#Write to log that transfer script has completed
$dateTime = Get-Date
Add-Content C:\Users\cioleary\Documents\powershell_scripts\testCopy_log.txt "`n 
`n 
==============================================================================`n
`n
Transfer Script has completed running at $dateTime `n
`n
==============================================================================`n
`n" 