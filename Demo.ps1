Import-Module -Name Pester ; if (! (Test-Path -Path Demo:\)) { $Null = New-PSDrive -Name Demo -PSProvider FileSystem -Root "$Env:HOME\Documents\PesteringSysadmins" -Description 'Pester Demo' -Scope Global }; Set-Location -Path Demo:; $Powerpoint = Get-ChildItem -Path 'C:\Program Files\*POWERPNT.exe' -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName

## PowerPoint
Start-Process $Powerpoint -ArgumentList '/S ".\PesteringSysadmins.pptx"' -WindowStyle Maximized

## Commands
# Describe
psedit .\DemoPester\Describe.Tests.ps1
# Context
psedit .\DemoPester\Context.Tests.ps1
# It
psedit .\DemoPester\It.Tests.ps1


## Gotchas
# Showing how braces work
psedit .\DemoPester\Test-Braces.Tests.ps1; 'Invoke-Pester .\DemoPester\test-braces.tests.ps1 -Tag Test1' | Set-Clipboard
# Context blocks being smallest Mocking block
psedit .\DemoPester\Test-ContextMock.Tests.ps1; 'Invoke-Pester .\DemoPester\Test-ContextMock.Tests.ps1 -Tag Test1' | Set-Clipboard
# Fixture is a Scriptblock
psedit .\DemoPester\Test-FixtureBraces.Tests.ps1; 'Invoke-Pester .\DemoPester\Test-FixtureBraces.Tests.ps1 -Tag Test1' | Set-Clipboard
# Arrays
psedit .\DemoPester\Test-Arrays.Tests.ps1; 'Invoke-Pester .\DemoPester\Test-Array.Tests.ps1 -Tag Test1' | Set-Clipboard


## ISESteroids
psedit .\DemoPester\Test-Pester.ps1


## VS Code
psedit .\Code\keybindings.json


## Issues with Eventlogs
psedit .\DemoPester\Test-Eventlog.ps1