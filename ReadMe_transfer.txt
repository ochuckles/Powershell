Buffalo Lab Transfer Program ReadMe File
Created on 2/23/18 by Ian O'Leary

Our Goal: to have a fully automated file trasnfer system that backups and processes neural data on a nightly basis. Program should
notify key personnel in the even of an unsuccessful transfer. 

Necessary Tools:
Powershell - microsoft based shell program capable of network transfers, initiating and running programs, and using a number
of windows based plugins. (included with windows OS)
PuTTY - plugin for windows that allows for interface with SSH protocol servers (such as Lolo, it may need to download)
Robocopy - plugin for windows that works as a robust file transfer command (can withstand loss of connection and generally slow networks,
it may need to be downloaded)
Windows Task Scheduler - program that can easily schedule tasks to be initiated at a specific time (included with windows OS)

Signal Processing Tool:
Python 
MatLab 

Suggested Tools:
Bitvise SSH Client - A GUI for SSH transfers. Has point and click interface.
WinSCP - A GUI for SFTP transfers. More powerful than Bitvise when used in controller mode. Can generate powershell script that
handles the SFTP transfer to Lolo.
Microsoft Robocopy GUI - GUI for using robocopy.

After programs like PuTTY or Python are downloaded, you may need to create environmental variables for windows OS to recognize the 
program when starting a new command line or powershell session. This is unnecessary but will alleviate the need to specify a path 
for each instance of powershell.

All transfers should write to a designated log file for recording state of transfer and any errors.