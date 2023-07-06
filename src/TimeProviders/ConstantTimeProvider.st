NAMESPACE Simatic.Ax.Dynamics
    /// Constantly returns `seconds` whenever `GetElapsedSeconds` is called
    CLASS ConstantTimeProvider IMPLEMENTS IElapsedSecondsProvider

        VAR PUBLIC
            /// This value is retured by `GetElapsedSeconds`
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