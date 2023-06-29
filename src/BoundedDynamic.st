NAMESPACE Simatic.Ax.Dynamics
    CLASS BoundedDynamic IMPLEMENTS IDynamic

        VAR PUBLIC 
            unboundedDynamic : IDynamic;
            minOutput : LREAL;
            maxOutput : LREAL;
            observeMin : BOOL;
            observeMax : BOOL;
        END_VAR

        METHOD PUBLIC GetMinOutput : LREAL 
            GetMinOutput := minOutput;
        END_METHOD
        METHOD PUBLIC SetMinOutput 
            VAR_INPUT
                newMinOutput : LREAL;
            END_VAR
            observeMin := TRUE;
            minOutput := newMinOutput;
        END_METHOD
        METHOD PUBLIC DisableMin
            observeMin := FALSE;
        END_METHOD
        METHOD PUBLIC GetMaxOutput : LREAL 
            GetMaxOutput := maxOutput;
        END_METHOD
        METHOD PUBLIC SetMaxOutput 
            VAR_INPUT
                newMaxOutput : LREAL;
            END_VAR
            observeMax := TRUE;
            maxOutput := newMaxOutput;
        END_METHOD
        METHOD PUBLIC DisableMax 
            observeMax := FALSE;
        END_METHOD
        
        METHOD PUBLIC Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            VAR_TEMP
                output : LREAL;
            END_VAR
            output := unboundedDynamic.Next(value);
            IF    observeMin AND output < minOutput THEN
                Next := minOutput;
            ELSIF observeMax AND output > maxOutput THEN
                Next := maxOutput;
            ELSE 
                Next := output;
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE