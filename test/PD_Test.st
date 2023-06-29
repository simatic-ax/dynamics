USING Simatic.Ax.Dynamics;
USING AxUnit.Assert;

NAMESPACE MyTest        
    {TestFixture}
    CLASS PD_Test EXTENDS GlobalTest
        VAR
            value                       : RampSignal;
            step                        : ConstantSignal;
            ramp                        : RampSignal;
            expected                    : ParallelSignal;
            dynamic                     : PD_Dynamic;
        END_VAR

        {Test(slope :=  1.0, k :=   1   , t := 1)}
        {Test(slope :=  2.0, k :=   1   , t := 1)}
        {Test(slope :=  1.0, k :=   2   , t := 1)}
        {Test(slope :=  1.0, k :=   1   , t := 2)}
        {Test(slope :=  5.7, k :=   0.23, t := 1.56)}
        {Test(slope := -3.8, k :=   9.74, t := 2.37)}
        {Test(slope :=  104, k := -34.81, t := 43.1)}
        METHOD PUBLIC Test
            VAR_INPUT
                slope : LREAL;
                k : LREAL;
                t : LREAL;
            END_VAR

            // Init value
            value.elapsedTimeProvider := oneSecondProvider;
            value.slope := slope;

            // Init step
            step.output := k * slope * t;

            // Init ramp
            ramp.elapsedTimeProvider := oneSecondProvider;
            ramp.slope := k * slope;

            // Init expected
            expected.signal0 := step;
            expected.signal1 := ramp;

            // Init dynamic
            dynamic.elapsedTimeProvider := oneSecondProvider;
            dynamic.SetK(k);
            dynamic.SetTDSeconds(t);

            // Assert
            THIS.AssertDynamic(expected, dynamic, value);
        END_METHOD
    
    END_CLASS
END_NAMESPACE