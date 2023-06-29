USING Simatic.Ax.Dynamics;
USING AxUnit;

NAMESPACE MyTest        
    {TestFixture}
    CLASS BoundedTest EXTENDS GlobalTest
        VAR
            unboundedDynamic : IdentityDynamic;
            boundedDynamic   : BoundedDynamic;
        END_VAR

        {Test(value :=  0, observeMin := FALSE, minOutput := -1, observeMax := FALSE, maxOutput := 1, expected := 0)}
        {Test(value :=  0, observeMin :=  TRUE, minOutput := -1, observeMax := FALSE, maxOutput := 1, expected := 0)}
        {Test(value :=  0, observeMin := FALSE, minOutput := -1, observeMax :=  TRUE, maxOutput := 1, expected := 0)}
        {Test(value :=  0, observeMin :=  TRUE, minOutput := -1, observeMax :=  TRUE, maxOutput := 1, expected := 0)}
        {Test(value :=  2, observeMin := FALSE, minOutput := -1, observeMax := FALSE, maxOutput := 1, expected := 2)}
        {Test(value :=  2, observeMin :=  TRUE, minOutput := -1, observeMax := FALSE, maxOutput := 1, expected := 2)}
        {Test(value :=  2, observeMin := FALSE, minOutput := -1, observeMax :=  TRUE, maxOutput := 1, expected := 1)}
        {Test(value :=  2, observeMin :=  TRUE, minOutput := -1, observeMax :=  TRUE, maxOutput := 1, expected := 1)}
        {Test(value := -2, observeMin := FALSE, minOutput := -1, observeMax := FALSE, maxOutput := 1, expected := -2)}
        {Test(value := -2, observeMin :=  TRUE, minOutput := -1, observeMax := FALSE, maxOutput := 1, expected := -1)}
        {Test(value := -2, observeMin := FALSE, minOutput := -1, observeMax :=  TRUE, maxOutput := 1, expected := -2)}
        {Test(value := -2, observeMin :=  TRUE, minOutput := -1, observeMax :=  TRUE, maxOutput := 1, expected := -1)}
        {Test(value := -20.35, observeMin :=  TRUE, minOutput := -15.84, observeMax :=  TRUE, maxOutput := 1, expected := -15.84)}
        {Test(value := -20.35, observeMin :=  TRUE, minOutput := -65.84, observeMax :=  TRUE, maxOutput := -40, expected := -40)}
        METHOD PUBLIC Test
            VAR_INPUT
                value : LREAL;
                observeMin : BOOL;
                minOutput : LREAL;
                observeMax : BOOl;
                maxOutput  : LREAL;
                expected : LREAL;
            END_VAR
            boundedDynamic.unboundedDynamic := unboundedDynamic;
            boundedDynamic.observeMin := observeMin;
            boundedDynamic.minOutput := minOutput;
            boundedDynamic.observeMax := observeMax;
            boundedDynamic.maxOutput := maxOutput;
            Assert.Equal(expected, boundedDynamic.Next(value));
        END_METHOD
    
    END_CLASS
END_NAMESPACE