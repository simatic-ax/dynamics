USING Simatic.Ax.Dynamics;
USING AxUnit.Assert;

NAMESPACE MyTest        
    {TestFixture}
    CLASS PI_Test EXTENDS GlobalTest
        VAR
            value                       : ConstantSignal;
            step                        : ConstantSignal;
            ramp                        : RampSignal;
            expected                    : ParallelSignal;
            dynamic                     : PI_Dynamic;
        END_VAR

        {Test(valueStepheight :=  1.0, k :=   1   , t := 1)}
        {Test(valueStepheight :=  5.7, k :=   0.23, t := 1.56)}
        {Test(valueStepheight := -3.8, k :=   9.74, t := 2.37)}
        {Test(valueStepheight :=  104, k := -34.81, t := 43.1)}
        METHOD PUBLIC Test
            VAR_INPUT
                valueStepheight : LREAL;
                k : LREAL;
                t : LREAL;
            END_VAR

            // Init value 
            value.output := valueStepheight;

            // Init step
            step.output := k * valueStepheight;

            // Init ramp
            ramp.elapsedTimeProvider := oneSecondProvider;
            ramp.slope := k * valueStepheight / t;

            // Init expected
            expected.signal0 := step;
            expected.signal1 := ramp;

            // Init dynamic
            dynamic.elapsedTimeProvider := oneSecondProvider;
            dynamic.SetK(k);
            dynamic.SetTISeconds(t);

            // Assert
            THIS.AssertDynamic(expected, dynamic, value);
        END_METHOD
    
    END_CLASS
END_NAMESPACE