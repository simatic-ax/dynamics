USING Dynamics;

NAMESPACE MyTest        
    {TestFixture}
    CLASS D_Test EXTENDS GlobalTest
        VAR
            value                       : RampSignal;
            expected                    : ConstantSignal;
            differentiator              : Differentiator;
        END_VAR

        {Test(valueSlope :=  1  , tD := 1)}
        // {Test(valueSlope :=  5.7, tD := 1.56)}
        // {Test(valueSlope := -3.8, tD := 2.37)}
        // {Test(valueSlope :=  104, tD := 43.1)}
        METHOD PUBLIC Test
            VAR_INPUT
                valueSlope : LREAL;
                tD : LREAL;
            END_VAR

            // Init value
            value.elapsedTimeProvider := oneSecondProvider;
            value.slope := valueSlope;

            // Init expected
            expected.output := valueSlope * tD;

            // Init differentiator
            differentiator.elapsedTimeProvider := oneSecondProvider;
            differentiator.SetTDSeconds(tD);

            // Assert
            THIS.AssertDynamic(expected, differentiator, value);
        END_METHOD
    
    END_CLASS
END_NAMESPACE