NAMESPACE Simatic.Ax.Dynamics
    /// Signal defined by a function of the cycle number
    CLASS ABSTRACT ExplicitSignal IMPLEMENTS IOutputSignal

        VAR PRIVATE 
            _cycle : UINT;
        END_VAR

        /// Reset the cycle number to zero
        METHOD PUBLIC Reset
            _cycle := UINT#0;
        END_METHOD

        /// Maps the cycle number to the output
        METHOD PROTECTED ABSTRACT _GetOutput : LREAL
            VAR_INPUT 
                /// The cycle number 
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