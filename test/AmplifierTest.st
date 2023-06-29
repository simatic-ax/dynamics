USING Dynamics;

NAMESPACE MyTest        
    {TestFixture}
    CLASS AmplifierTest EXTENDS GlobalTest

        VAR
            amplifier                   : Amplifier;
            value                       : ConstantSignal;
            expected                    : ConstantSignal;
        END_VAR

        // Amplifier
        {Test(k := 0, valueStepheight := 2.75)}
        {Test(k := 1, valueStepheight := 2.83)}
        {Test(k := 7.2, valueStepheight := 9.329)}
        {Test(k := 0.32, valueStepheight := 25.67)}
        METHOD PUBLIC Test
            VAR_INPUT 
                k : LREAL;
                valueStepheight : LREAL;
            END_VAR
            amplifier.SetK(k);
            value.SetOutput(valueStepheight);
            expected.SetOutput(k * valueStepheight);
            THIS.AssertDynamic(expected, amplifier, value);        
        END_METHOD

    END_CLASS
END_NAMESPACE
