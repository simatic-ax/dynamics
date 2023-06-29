USING TimeProviders;
USING Dynamics;
USING AxUnit;

NAMESPACE MyTest
    CLASS GlobalTest

        VAR CONSTANT 
            TOLERANCE                   : LREAL := 1.0e-5;
            DURATION                    : UINT := UINT#12;
        END_VAR
        VAR PROTECTED
            oneSecondProvider           : ConstantTimeProvider := (seconds := 1.0);
        END_VAR
        VAR PRIVATE
            _actual                      : ComposedSignal;
        END_VAR

        METHOD AssertSignal
            VAR_INPUT 
                expected : ISignal;
                actual : ISignal;
            END_VAR
            VAR_TEMP
                cycle : UINT;
            END_VAR
            FOR cycle := UINT#1 TO DURATION DO 
                Assert.Tolerated(expected.Next(), actual.Next(), TOLERANCE);
            END_FOR;
        END_METHOD

        METHOD AssertDynamic
            VAR_INPUT 
                expected : ISignal;
                dynamic : IDynamic;
                value : ISignal;
            END_VAR
            _actual.inner := value;
            _actual.outer := dynamic;
            THIS.AssertSignal(expected, _actual);
        END_METHOD

    END_CLASS
END_NAMESPACE