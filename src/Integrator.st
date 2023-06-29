NAMESPACE Simatic.Ax.Dynamics
    CLASS Integrator EXTENDS FirstOrderOutputDynamic

        VAR PUBLIC
            tISeconds : LREAL;
        END_VAR
        
        METHOD PUBLIC GetTISeconds : LREAL
            GetTISeconds := tISeconds;
        END_METHOD
        METHOD PUBLIC SetTISeconds
            VAR_INPUT 
                newTISeconds : LREAL;
            END_VAR
            tISeconds := newTISeconds;
        END_METHOD 
        METHOD PUBLIC SetTISeconds
            VAR_INPUT 
                newTISeconds : LREAL;
                k : LREAL;
            END_VAR
            THIS.SetTISeconds(newTISeconds / k);
        END_METHOD       
    
        METHOD PROTECTED OVERRIDE _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
                output : LREAL;
            END_VAR
            _Next := output + value * elapsedSeconds / tISeconds;
        END_METHOD

    END_CLASS
END_NAMESPACE