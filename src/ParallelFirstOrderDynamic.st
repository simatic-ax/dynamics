USING TimeProviders;
USING TimeProviders;
NAMESPACE Dynamics
    CLASS INTERNAL ABSTRACT ParallelFirstOrderDynamic EXTENDS FirstOrderDynamic

        VAR PUBLIC
            k : LREAL := 1.0;
        END_VAR

        VAR PROTECTED
            _pseudoTimeProvider : ConstantTimeProvider;
        END_VAR

        METHOD PUBLIC GetK : LREAL
            GetK := k;
        END_METHOD
        METHOD PUBLIC SetK 
            VAR_INPUT 
                newK : LREAL;
            END_VAR
            k := newK;
        END_METHOD
        
        METHOD PROTECTED ABSTRACT _Next0 : LREAL
            VAR_INPUT 
                value : LREAL;
            END_VAR
        END_METHOD
        METHOD PROTECTED ABSTRACT _Next1 : LREAL
            VAR_INPUT 
                value : LREAL;
            END_VAR
        END_METHOD

        METHOD PROTECTED FINAL OVERRIDE _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
            END_VAR
            _pseudoTimeProvider.seconds := elapsedSeconds;
            _Next := k * (this._Next0(value) + this._Next1(value));
        END_METHOD

    END_CLASS
END_NAMESPACE