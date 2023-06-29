USING AxUnit;
USING Simatic.Ax.Dynamics;

NAMESPACE MyTest
    CLASS DependentParallelSignal IMPLEMENTS ISignal

        VAR PUBLIC 
            independent : IOutputSignal;
            dependent : ISignal;
        END_VAR
        
        METHOD PUBLIC Next : LREAL
            Next := dependent.Next() + independent.GetOutput();
        END_METHOD

    END_CLASS
END_NAMESPACE