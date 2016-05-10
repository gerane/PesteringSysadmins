

Describe -Name 'Describes group of Tests' -Fixture {

    Context -Name 'Groups sets of tests together' -Fixture {
        
        Mock -CommandName Bad-Command -MockWith { Throw }
        
        It -Name 'Should run Test 1' -test {
            
            $Results = 2 + 2
            $Results | Should Be 4
        }
        
        It -Name 'Should run Test 2' -test {
            
            $Results = 3 - 2
            $Results | Should Be 1
        }
        
        It -Name 'Should run Test 3' -test {
        
            $Results = { Bad-Command } 
            $Results | Should Throw
        }
    }
}

Describe 'Describes group of Tests'  {
    
    Context 'Groups sets of tests together' {
    
        Mock Bad-Command { Throw }
    
        It 'Should run Test 1' {
            
            $Results = 2 + 2
            $Results | Should Be 4
        }
        
        It 'Should run Test 2' {
        
            $Results = 3 - 2
            $Results | Should Be 1
        }
        
        It 'Should run Test 3' {
        
            $Results = { Bad-Command } 
            $Results | Should Throw
        }          
    } 
}


