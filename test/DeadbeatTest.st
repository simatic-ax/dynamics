USING Simatic.Ax.Dynamics;
USING AxUnit;
USING System.Math;
NAMESPACE MyTest 

    FUNCTION PT1 : LREAL 
        VAR_INPUT
            t : LREAL;
            value : LREAL;
            output : LREAL;
            k : LREAL;
            t0 : LREAL;
        END_VAR
        PT1 := k * value + (output - k * value) * Exp(-1.0 * t / t0);
    END_FUNCTION

    {TestFixture}
    CLASS DeadbeatTest EXTENDS GlobalTest
        VAR 
            controller : PT1_DeadbeatController;
        END_VAR 

        {Test(k := 1, t0 := 1, output := 0, input := 0)}
        {Test(k := 1, t0 := 1, output := 0, input := 1)}
        {Test(k := 1, t0 := 1, output := 1, input := 0)}
        {Test(k := 1, t0 := 1, output := -78.5, input := 2.3)}
        {Test(k := 3.7, t0 := 5.8, output := -78.5, input := 2.3)}
        {Test(k := 107, t0 := 0.23, output := 10, input := 11)}
        METHOD PUBLIC Test 
            VAR_INPUT 
                k : LREAL;
                t0 : LREAL;
                output : LREAL;
                input : LREAL;
            END_VAR
            controller.SetK(k);
            controller.SetPeriods(oneSecondProvider.seconds, t0);
            Assert.Tolerated(input, PT1(oneSecondProvider.seconds, controller.Next(output, input), output, k, t0), TOLERANCE);
        END_METHOD 
    END_CLASS
END_NAMESPACE
