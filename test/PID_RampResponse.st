USING Dynamics;

NAMESPACE MyTest 
    CLASS PID_RampResponse EXTENDS ExplicitSignal

        VAR PUBLIC 
            k : LREAL;
            tISeconds : LREAL;
            tDSeconds : LREAL;
        END_VAR

        METHOD PROTECTED OVERRIDE _GetOutput : LREAL
            VAR_INPUT
                cycle : UINT;
            END_VAR
            _GetOutput := k * (
                cycle + 
                cycle * (cycle + 1.0) / 2.0 / tISeconds + 
                tDSeconds
            );
        END_METHOD

    END_CLASS
END_NAMESPACE