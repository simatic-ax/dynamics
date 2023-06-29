USING AxUnit;
USING Dynamics;
USING AxUnit;

NAMESPACE MyTest
    {TestFixture}
    CLASS PT1_Test EXTENDS GlobalTest

        VAR 
            dynamic : PT1_Dynamic;
        END_VAR 


        {Test(valueStepheight :=  1.0, k :=   1   , t0 := 1)}
        {Test(valueStepheight :=  2.0, k :=   1   , t0 := 1)}
        {Test(valueStepheight :=  1.0, k :=   2   , t0 := 1)}
        {Test(valueStepheight :=  1.0, k :=   1   , t0 := 2)}
        {Test(valueStepheight :=  5.7, k :=   0.23, t0 := 100)}
        {Test(valueStepheight := -3.8, k :=   9.74, t0 := 12)}
        {Test(valueStepheight :=  104, k := -34.81, t0 := 60)}
        METHOD PUBLIC Test 
            VAR_INPUT
                k : LREAL; 
                t0 : LREAL;
                valueStepheight : LREAL;
            END_VAR 

            // Init dynamic
            dynamic.elapsedTimeProvider := oneSecondProvider;
            dynamic.SetK(k);
            dynamic.SetT0Seconds(t0);

            Assert.Tolerated(k * valueStepheight / t0, dynamic.Next(valueStepheight), TOLERANCE);
        END_METHOD

    END_CLASS
END_NAMESPACE