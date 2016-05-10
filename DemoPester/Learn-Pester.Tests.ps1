Import-Module Pester

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace('.Tests.', '.')
. "$here\$sut"

Describe 'Test-Pester' {
    
    Context 'EventLog Exists' {
        
        It 'does something useful' {
            
            $Results = Test-Pester -LogName Application -Source MsiInstaller
            $Results | Should Be $true
        }
        
        It 'Should not throw' {
            
            $Results = { Test-Pester -LogName Application -Source MsiInstaller }
            $Results | Should Not Throw
        }
        
    }
    
    Context 'EventLog does not exist' {
    
        It 'Should throw' {
            
            $Results = { Test-Pester -LogName DoesNotExist -Source MsiInstaller }
            $Results | Should Throw
        }
    }
    
    Context 'EventLog Source Exists' {
        
        It 'Should Fail' {
            $Results = { Test-Pester -LogName DoesNotExist -Source MsiInstaller }
            $Results | Should Not Throw
        }
        
    }
}
