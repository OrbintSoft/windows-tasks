$result =  w32tm.exe /resync | out-string
$logName = “SyncTime-Script”
$logFileExists = [System.Diagnostics.EventLog]::SourceExists($logName)
if (! $logFileExists) {
    New-EventLog –LogName Application –Source $logName
}
Write-EventLog –LogName Application –Source $logName –EntryType Information –EventID 1 –Message $result