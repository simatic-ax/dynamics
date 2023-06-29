USING Dynamics;
USING AxUnit;

NAMESPACE MyTest        
    {TestFixture}
    CLASS BangBangTest EXTENDS GlobalTest
        VAR
            controller : BangBangController;
        END_VAR
        
        // value0, value1, value2 and value3 are inside hysteresis
        {Test(input := 0, hysteresis := 1, output := FALSE, value0 := 0, value1 := 0, value2 := 0, value3 := 0)}
        {Test(input := 0, hysteresis := 1, output :=  TRUE, value0 := 0, value1 := 0, value2 := 0, value3 := 0)}
        {Test(input := 0, hysteresis := 1, output :=  TRUE, value0 := 0, value1 := -1, value2 := 1, value3 := 0.5)}
        {Test(input := 0, hysteresis := 10, output := FALSE, value0 := 2, value1 := -3, value2 := 5.7, value3 := -3.9)}
        {Test(input := 0, hysteresis := 83, output := TRUE, value0 := 20, value1 := -82.9, value2 := -83, value3 := 1.7)}
        METHOD PUBLIC TestWithinHysteresis
            VAR_INPUT
                input : LREAL;
                hysteresis: LREAL;
                output : BOOL;
                value0 : LREAL;
                value1 : LREAL;
                value2 : LREAL;
                value3 : LREAL;
            END_VAR
            controller.SetInput(input);
            controller.hysteresis := hysteresis; 
            controller.SetOutput(output);
            Assert.Equal(controller.Next(value0), output);
            Assert.Equal(controller.Next(value1), output);
            Assert.Equal(controller.Next(value2), output);
            Assert.Equal(controller.Next(value3), output);
        END_METHOD

        
        // value is outside hysteresis
        {Test(input := 0,   hysteresis := 1,    heatingMode :=  TRUE, value := 2, expected := FALSE)}
        {Test(input := 0,   hysteresis := 1,    heatingMode := FALSE, value := 2, expected := TRUE)}
        {Test(input := 0,   hysteresis := 1,    heatingMode :=  TRUE, value := -2, expected := TRUE)}
        {Test(input := 0,   hysteresis := 1,    heatingMode := FALSE, value := -2, expected := FALSE)}
        {Test(input := 45,  hysteresis := 10,   heatingMode := FALSE, value := 34, expected := FALSE)}
        {Test(input := -3,  hysteresis := 0.1,  heatingMode := FALSE, value := -8, expected := FALSE)}
        {Test(input :=-107.59, hysteresis := 0, heatingMode := FALSE, value := -107.591, expected := FALSE)}
        {Test(input := 36.8, hysteresis := 2.5, heatingMode := FALSE, value := 31.8, expected := FALSE)}
        {Test(input := 45,  hysteresis := 10,   heatingMode :=  TRUE, value := 34, expected := TRUE)}
        {Test(input := -3,  hysteresis := 0.1,  heatingMode :=  TRUE, value := -8, expected := TRUE)}
        {Test(input :=-107.59, hysteresis := 0, heatingMode :=  TRUE, value := -107.591, expected := TRUE)}
        {Test(input := 36.8, hysteresis := 2.5, heatingMode :=  TRUE, value := 31.8, expected := TRUE)}
        {Test(input := 45,  hysteresis := 10,   heatingMode :=  TRUE, value := 56, expected := FALSE)}
        {Test(input := -3,  hysteresis := 0.1,  heatingMode :=  TRUE, value := -2, expected := FALSE)}
        {Test(input :=-107.59, hysteresis := 0, heatingMode :=  TRUE, value := -107.58, expected := FALSE)}
        {Test(input := 36.8, hysteresis := 2.5, heatingMode :=  TRUE, value := 41.8, expected := FALSE)}
        {Test(input := 45,  hysteresis := 10,   heatingMode := FALSE, value := 56, expected := TRUE)}
        {Test(input := -3,  hysteresis := 0.1,  heatingMode := FALSE, value := -2, expected := TRUE)}
        {Test(input :=-107.59, hysteresis := 0, heatingMode := FALSE, value := -107.58, expected := TRUE)}
        {Test(input := 36.8, hysteresis := 2.5, heatingMode := FALSE, value := 41.8, expected := TRUE)}
        METHOD PUBLIC TestOutsideHysteresis
            VAR_INPUT
                input : LREAL;
                hysteresis: LREAL;
                heatingMode : BOOL;
                value : LREAL;
                expected : BOOL;
            END_VAR
            controller.hysteresis := hysteresis; 
            IF heatingMode THEN 
                controller.EnableHeatingMode();
            ELSE 
                controller.EnableCoolingMode();
            END_IF;
            Assert.Equal(controller.Next(value, input), expected);
        END_METHOD
    
    END_CLASS
END_NAMESPACE