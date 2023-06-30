NAMESPACE TimeProviders
    CLASS ConstantTimeProvider IMPLEMENTS IElapsedSecondsProvider

        VAR PUBLIC
            seconds : LREAL;
        END_VAR
    
        METHOD PUBLIC GetElapsedSeconds : LREAL
            GetElapsedSeconds := seconds;
        END_METHOD        
    
        METHOD PUBLIC Start
            ; // Nothing happens -- that's why it's called constant
        END_METHOD

END_CLASS
END_NAMESPACE