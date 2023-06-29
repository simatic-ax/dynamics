USING Simatic.Ax.Dynamics;
NAMESPACE MyTest
    CLASS OutputComposedSignal IMPLEMENTS IOutputSignal
        VAR 
            composedSignal : ComposedSignal;
            dynamic : IOutputDynamic;
        END_VAR
        
        METHOD PUBLIC SetInner 
            VAR_INPUT 
                newInner : ISignal;
            END_VAR
            composedSignal.inner := newInner;
        END_METHOD        
        METHOD PUBLIC SetOuter
            VAR_INPUT 
                newOuter : IOutputDynamic;
            END_VAR
            dynamic := newOuter;
            composedSignal.outer := newOuter;
        END_METHOD
    
        METHOD PUBLIC Next : LREAL
            Next := composedSignal.Next();
        END_METHOD

        METHOD PUBLIC GetOutput : LREAL
            GetOutput := dynamic.GetOutput();
        END_METHOD
    END_CLASS
END_NAMESPACE