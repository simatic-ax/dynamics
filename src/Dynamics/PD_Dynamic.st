NAMESPACE Simatic.Ax.Dynamics
    CLASS PD_Dynamic EXTENDS ParallelFirstOrderDynamic

        VAR PRIVATE 
            _differentiator : Differentiator;
        END_VAR
        
        METHOD PUBLIC GetTDSeconds : LREAL
            GetTDSeconds := _differentiator.GetTDSeconds();
        END_METHOD
        METHOD PUBLIC SetTDSeconds
            VAR_INPUT 
                newTDSeconds : LREAL;
            END_VAR
            _differentiator.SetTDSeconds(newTDSeconds);
            _differentiator.elapsedTimeProvider := _pseudoTimeProvider;
        END_METHOD  
    
        // P 
        METHOD PROTECTED OVERRIDE _Next0 : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            _Next0 := value;
        END_METHOD

        // D
        METHOD PROTECTED OVERRIDE _Next1 : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            _Next1 := _differentiator.Next(value);
        END_METHOD

    END_CLASS
END_NAMESPACE