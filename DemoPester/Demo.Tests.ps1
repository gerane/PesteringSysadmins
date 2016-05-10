Describe 'PesterDemo' {
    
    Context 'Context of the Test' {
        
        It 'What the test should do' {
            
            $Results = PesterDemo
            $Results | Should Be $true
        }
        
        It 'Should Mock a Command' {
            
            Mock SomeCommand { }
            Assert-MockCalled SomeCommand -times 1
        }
    }
}