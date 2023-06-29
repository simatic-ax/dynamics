NAMESPACE Simatic.Ax.Dynamics
    CLASS ABSTRACT ExplicitSignal IMPLEMENTS IOutputSignal

        VAR PRIVATE 
            _cycle : UINT;
        END_VAR

        METHOD PUBLIC Reset
            _cycle := UINT#0;
        END_METHOD

        METHOD PROTECTED ABSTRACT _GetOutput : LREAL
            VAR_INPUT 
                cycle : UINT;
            END_VAR
        END_METHOD
    
        METHOD PUBLIC FINAL GetOutput : LREAL
            GetOutput := THIS._GetOutput(_cycle);
        END_METHOD

        METHOD PUBLIC FINAL Next : LREAL
            _cycle := _cycle + UINT#1;
            Next := THIS.GetOutput();
        END_METHOD

    END_CLASS
END_NAMESPACE