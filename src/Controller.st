NAMESPACE Dynamics
    CLASS INTERNAL Controller

        VAR PRIVATE
            _input : LREAL;
        END_VAR

        METHOD PUBLIC GetInput : LREAL 
            GetInput := _input;
        END_METHOD
        METHOD PUBLIC SetInput
            VAR_INPUT
                newInput : LREAL;
            END_VAR
            _input := newInput;
        END_METHOD

    END_CLASS
END_NAMESPACE