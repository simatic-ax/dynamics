NAMESPACE Simatic.Ax.Dynamics
    /// Constantly provides `output`
    CLASS ConstantSignal IMPLEMENTS IOutputSignal

        VAR PUBLIC 
            /// The output value
            output : LREAL;
        END_VAR

        METHOD PUBLIC GetOutput : LREAL
            GetOutput := output;
        END_METHOD  

        /// Set the output value
        METHOD PUBLIC SetOutput : LREAL
            VAR_INPUT 
                newOutput : LREAL;
            END_VAR 
            output := newOutput;
            SetOutput := output;
        END_METHOD      
    
        METHOD PUBLIC Next : LREAL
            Next := THIS.GetOutput();
        END_METHOD

    END_CLASS
END_NAMESPACE
