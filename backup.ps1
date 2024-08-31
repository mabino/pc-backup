# Define source folders
$downloads = "$env:USERPROFILE\Downloads"
$minecraft = "$env:APPDATA\.minecraft"

# Define destination folders
$dailyBackup = "D:\Daily"
$weeklyBackup = "D:\Weekly"
$monthlyBackup = "D:\Monthly"

# Function to copy data
function Backup-Folder {
    param (
        [string]$source,
        [string]$destination
    )
    # Use RoboCopy to perform the backup
    robocopy $source $destination /MIR /R:3 /W:5
}

# Perform Daily Backup
Backup-Folder $downloads $dailyBackup\Downloads
Backup-Folder $minecraft $dailyBackup\Minecraft

# Perform Weekly Backup on Mondays
if ((Get-Date).DayOfWeek -eq 'Monday') {
    Backup-Folder $downloads $weeklyBackup\Downloads
    Backup-Folder $minecraft $weeklyBackup\Minecraft
}

# Perform Monthly Backup on the 1st day of the month
if ((Get-Date).Day -eq 1) {
    Backup-Folder $downloads $monthlyBackup\Downloads
    Backup-Folder $minecraft $monthlyBackup\Minecraft
}
