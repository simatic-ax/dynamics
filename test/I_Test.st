USING Dynamics;

NAMESPACE MyTest        
    {TestFixture}
    CLASS I_Test EXTENDS GlobalTest
        VAR
            value                       : ConstantSignal;
            expected                    : RampSignal;
            integrator                  : Integrator;
        END_VAR

        {Test(valueStepheight :=  1.0, t := 1)}
        {Test(valueStepheight :=  5.7, t := 1.56)}
        {Test(valueStepheight := -3.8, t := 2.37)}
        {Test(valueStepheight :=  104, t := 43.1)}
        METHOD PUBLIC Test
            VAR_INPUT
                valueStepheight : LREAL;
                t : LREAL;
            END_VAR

            // Init value
            value.output := valueStepheight;

            // Init expected
            expected.elapsedTimeProvider := oneSecondProvider;
            expected.SetTISeconds(t / valueStepheight);

            // Init integrator
            integrator.elapsedTimeProvider := oneSecondProvider;
            integrator.SetTISeconds(t);

            // Assert
            THIS.AssertDynamic(expected, integrator, value);
        END_METHOD
    
    END_CLASS
END_NAMESPACE