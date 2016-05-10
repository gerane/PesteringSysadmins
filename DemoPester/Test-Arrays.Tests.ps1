Describe 'v3 Array' -Tags Test1 {
    
    Context 'Array using v3.4.0 Pester' {
        
        It 'Should Match' {
            $Expected = @(1,2,3,4,5,6,7,8)
            $Actual = @(1,2,3,4,5,6,7,8)
            
            $Actual | Should Be $Expected
        }
    }
}

Describe 'v3 Array' -Tags Test2 {
    
    Context 'Array using v3.4.0 Pester' {
        
        It 'Should Match' {
            $Expected = @(1,2,3,4,5,6,7,8,9)
            $Actual = @(1,2,3,4,5,6,7,8)
            
            $Actual | Should Not Be $Expected
        }
    }
}


