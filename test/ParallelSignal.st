USING AxUnit;
USING Dynamics;

NAMESPACE MyTest
    CLASS ParallelSignal IMPLEMENTS ISignal

        VAR PUBLIC 
            signal0 : ISignal;
            signal1 : ISignal;
        END_VAR
        
        METHOD PUBLIC Next : LREAL
            Next := signal0.Next() + signal1.Next();
        END_METHOD

    END_CLASS
END_NAMESPACE