NAMESPACE Simatic.Ax.Dynamics
    CLASS DynamicController EXTENDS Controller IMPLEMENTS IDynamic, IDynamicController

        VAR PUBLIC 
            openDynamic : IDynamic;
        END_VAR        
        
        METHOD PUBLIC Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            Next := openDynamic.Next(THIS.GetInput() - value);
        END_METHOD

        METHOD PUBLIC Next : LREAL    
            VAR_INPUT
                value : LREAL;
                input : LREAL;
            END_VAR
            THIS.SetInput(input);
            Next := THIS.Next(value);
        END_METHOD

    END_CLASS
END_NAMESPACE