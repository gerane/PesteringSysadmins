# Create initial EventLog
New-EventLog -LogName PesterFail -Source PesterFailSource
Write-EventLog -LogName PesterFail -Source PesterFailSource -EntryType Information -EventId 1 -Message 'Creating a Failure'
Get-EventLog -LogName PesterFail -Source PesterFailSource

# Source is Registered to a different LogName
Write-EventLog -LogName PesterFailed -Source PesterFailSource -EntryType Information -EventId 1 -Message 'Creating a Failure'






