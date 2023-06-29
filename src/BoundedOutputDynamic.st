NAMESPACE Dynamics
    CLASS BoundedOutputDynamic EXTENDS BoundedDynamic IMPLEMENTS IOutputDynamic

        VAR PRIVATE
            _storingDynamic : IOutputDynamic;
        END_VAR

        METHOD PUBLIC SetUnboundedDynamic
            VAR_INPUT 
                newDynamic : IOutputDynamic;
            END_VAR 
            _storingDynamic := newDynamic;
            unboundedDynamic := _storingDynamic;
        END_METHOD
      
        METHOD PUBLIC GetOutput : LREAL
            GetOutput := _storingDynamic.GetOutput();
        END_METHOD
        METHOD PUBLIC SetOutput : LREAL
            VAR_INPUT
                output : LREAL;
            END_VAR
            SetOutput := _storingDynamic.SetOutput(output);
        END_METHOD

        METHOD PUBLIC OVERRIDE Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            Next := _storingDynamic.SetOutput(SUPER.Next(value));
        END_METHOD

        METHOD PUBLIC IsMin : BOOL 
            IsMin := _storingDynamic.GetOutput() = THIS.GetMinOutput();
        END_METHOD
        METHOD PUBLIC IsMax : BOOL 
            IsMax := _storingDynamic.GetOutput() = THIS.GetMaxOutput();
        END_METHOD
    
    END_CLASS
END_NAMESPACE