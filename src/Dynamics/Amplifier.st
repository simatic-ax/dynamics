NAMESPACE Simatic.Ax.Dynamics
    CLASS Amplifier IMPLEMENTS IDynamic

        /// Amplification
        VAR PUBLIC
            k : LREAL := 1.0;
        END_VAR

        /// Get amplification
        METHOD PUBLIC GetK : LREAL
            GetK := k;
        END_METHOD
        /// Set ampflification
        METHOD PUBLIC SetK 
            VAR_INPUT 
                newK : LREAL;
            END_VAR
            k := newK;
        END_METHOD

        METHOD PUBLIC Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            Next := k * value;
        END_METHOD
 
    END_CLASS
END_NAMESPACE
        