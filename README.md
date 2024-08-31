# pc-backup
Simple PowerShell script to backup a list of source folders to a destination.  Meant to be run via Task Scheduler.

## Setup

Change the computer's Advanced Power Settings under the Sleep settings to Allow wake timers.

Create a New Basic Task in Task Scheduler.

Set the Trigger to daily.

Set the Action to Start a program.  The Program/Script is `powershell.exe` and the arguments are `-ExecutionPolicy Bypass -File "C:\Scripts\backup.ps1"`.

Ensure "Wake the computer to run this task" is checked once the task has been created.
