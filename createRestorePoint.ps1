$currentDate = Get-Date -Format s
$restorePointName = "Scheduled Restore Point $currentDate"
$result = CheckPoint-Computer $restorePointName
$logName = "RestorePoint-Script"
$logFileExists = [System.Diagnostics.EventLog]::SourceExists($logName);
if (! $logFileExists) {
    Write-Host "Log $logNam do not exist, it will be created"
    New-EventLog -LogName Application -Source $logName
}
Write-EventLog -LogName Application -Source $logName -EntryType Information -EventID 1 -Message "RestorePoint-Script has been run"
