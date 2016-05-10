Import-Module -Name Pester ; if (! (Test-Path -Path Demo:\)) { New-PSDrive -Name Demo -PSProvider FileSystem -Root (Get-GithubRepoDir -Name Demo) -Description 'Pester Demo' -Scope Global }; Set-Location -Path Demo:

## Commands
# Describe
psedit .\DemoPester\Context.Tests.ps1
# Context
psedit .\DemoPester\Demo.Tests.ps1
# It
psedit .\DemoPester\It.Tests.ps1

## Gotchas
# Showing how braces work
psedit .\DemoPester\Test-Braces.Tests.ps1; 'Invoke-Pester .\DemoPester\test-braces.tests.ps1 -Tag Test1' | Out-Clipboard
# Context blocks being smallest Mocking block
psedit .\DemoPester\Test-ContextMock.Tests.ps1; 'Invoke-Pester .\DemoPester\Test-ContextMock.Tests.ps1 -Tag Test1' | Out-Clipboard
# Issues with Eventlogs
psedit .\DemoPester\Test-Eventlog.ps1

## ISESteroids
psedit .\DemoPester\Test-Pester.ps1