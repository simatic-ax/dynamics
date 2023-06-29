USING Simatic.Ax.Dynamics;
NAMESPACE MyTest
    CLASS ComposedSignal IMPLEMENTS ISignal

        VAR PUBLIC 
            inner : ISignal;
            outer : IDynamic;
        END_VAR
        
        METHOD PUBLIC Next : LREAL
            Next := outer.next(inner.Next());
        END_METHOD

    END_CLASS
END_NAMESPACE