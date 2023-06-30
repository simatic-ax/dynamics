NAMESPACE Simatic.Ax.Dynamics
    CLASS PT1_Dynamic EXTENDS FirstOrderOutputDynamic

        VAR PUBLIC 
            k : LREAL;
            t0Seconds : LREAL;
        END_VAR

        METHOD PUBLIC GetK : LREAL
            GetK := k;
        END_METHOD
        METHOD PUBLIC SetK 
            VAR_INPUT 
                newK : LREAL;
            END_VAR
            k := newK;
        END_METHOD        

        METHOD PUBLIC GetT0Seconds : LREAL
            GetT0Seconds := t0Seconds;
        END_METHOD
        METHOD PUBLIC SetT0Seconds 
            VAR_INPUT 
                newT0Seconds : LREAL;
            END_VAR
            t0Seconds := newT0Seconds;
        END_METHOD
        
        METHOD PROTECTED OVERRIDE _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
                output : LREAL;
            END_VAR
            _Next := output + (k * value - output) * elapsedSeconds / t0Seconds;
        END_METHOD

    END_CLASS
END_NAMESPACE