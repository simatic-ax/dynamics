USING Dynamics;
USING AxUnit;
NAMESPACE MyTest
    {TestFixture}
    CLASS DynamicCntrollerTest 
        VAR 
            amplifier : Amplifier;
            controller : DynamicController;
        END_VAR

        {Test(k := 1, input := 0, value := 0)}
        {Test(k := 1, input := 0, value := 1)}
        {Test(k := 1, input := 0, value := -1)}
        {Test(k := 1, input := 1, value := 0)}
        {Test(k := 1, input := -1, value := 0)}
        {Test(k := 5.7, input := 33.8, value := -3.4)}
        {Test(k := 3.7, input := -3.5, value := 83.4)}
        {Test(k := 310, input := 15.8, value := -0.1)}
        METHOD PUBLIC TestWithAmplifier
            VAR_INPUT 
                k : LREAL;
                input : LREAL;
                value : LREAL;
            END_VAR
            amplifier.SetK(k);
            controller.openDynamic := amplifier;
            Assert.Equal(k * (input - value), controller.Next(value, input));
        END_METHOD
    END_CLASS
END_NAMESPACE