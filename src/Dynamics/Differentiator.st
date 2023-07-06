NAMESPACE Simatic.Ax.Dynamics
    CLASS Differentiator EXTENDS FirstOrderDynamic

        VAR PUBLIC 
            /// Lead time in seconds
            tDSeconds : LREAL;
        END_VAR

        VAR PRIVATE 
            _value : LREAL;
        END_VAR
        
        /// Get lead time in seconds
        METHOD PUBLIC GetTDSeconds : LREAL
            GetTDSeconds := tDSeconds;
        END_METHOD
        /// Set lead time in seconds
        METHOD PUBLIC SetTDSeconds
            VAR_INPUT 
                newTDSeconds : LREAL;
            END_VAR
            tDSeconds := newTDSeconds;
        END_METHOD  
        /// Set lead time in seconds and amplification
        /// SetTDSeconds(newTDSeconds, k) is equivalent to SetTDSeconds(newTDSeconds * k)
        METHOD PUBLIC SetTDSeconds
            VAR_INPUT 
                newTDSeconds : LREAL;
                k : LREAL;
            END_VAR
            THIS.SetTDSeconds(newTDSeconds * k);
        END_METHOD   

        /// Get last process value
        METHOD INTERNAL GetValue : LREAL
            GetValue := _value;
        END_METHOD
    
        METHOD PROTECTED OVERRIDE _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
            END_VAR
            _Next := (value - _value) / elapsedSeconds * tDSeconds;
            _value := value;
        END_METHOD

    END_CLASS
END_NAMESPACE

