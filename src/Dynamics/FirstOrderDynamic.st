USING TimeProviders;
NAMESPACE Simatic.Ax.Dynamics
    CLASS INTERNAL ABSTRACT FirstOrderDynamic IMPLEMENTS IDynamic

        VAR PUBLIC 
            elapsedTimeProvider : IElapsedSecondsProvider;
        END_VAR
    
        METHOD PROTECTED ABSTRACT _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
            END_VAR
        END_METHOD
        METHOD PUBLIC FINAL Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            Next := this._Next(value, elapsedTimeProvider.GetElapsedSeconds());
            elapsedTimeProvider.Start();
        END_METHOD

    END_CLASS
END_NAMESPACE