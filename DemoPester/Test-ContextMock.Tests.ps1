function Test-Pester ($Number) 
{
    Get-Date -Day $Number -Format dd-yyyy
}


Describe 'Test-ContextMock' -Tags Test1 {
    Mock Get-Date { Return '03-2016' }
    
    It 'Mock in Describe' {
        
        $Results = Test-Pester -Number '1'
        $Results | Should Be '03-2016'
    }
    
    It 'Mock in Describe 2' {
        
        $Results = Test-Pester -Number '1'
        $Results | Should Be '03-2016'
    }
}


Describe 'Test-ContextMock' -Tags Test2 {
    
    Context 'Mock in Context' {
        Mock Get-Date { Return '13-2016' }
        
        It 'Mock in Context Block ' {
            
        
            $Results = Test-Pester -Number '1'
            $Results | Should Be '13-2016'
        }

        It 'Mock in Context 2' {
        
            $Results = Test-Pester -Number '1'
            $Results | Should Be '13-2016'
        }
    }
}


Describe 'Test-ContextMock' -Tags Test3 {
    
    It 'Mock in It Block - Return 01-2016' {
        Mock Get-Date { Return '03-2016' }
        
        $Results = Test-Pester -Number '1'
        $Results | Should Be '03-2016'
    }

    It 'Mock in previous It Block' {
        
        $Results = Test-Pester -Number '12'
        $Results | Should Be '12-2016'
    }
}

