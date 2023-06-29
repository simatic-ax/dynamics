USING Dynamics;

NAMESPACE MyTest
    {TestFixture}
    CLASS PID_Test EXTENDS GlobalTest

        VAR 
            expected : PID_RampResponse;
            dynamic : PID_Dynamic;
            value : RampSignal;
        END_VAR 

        {Test(k := 1, td := 1, ti := 1)}
        // {Test(k := 2, td := 1, ti := 1)}
        // {Test(k := 1, td := 2, ti := 1)}
        // {Test(k := 1, td := 1, ti := 2)}
        // {Test(k := 3.7, td := 5.3, ti := 0.28)}
        // {Test(k := -1.7, td := 0.39, ti := 5.6)}
        METHOD PUBLIC Test_d_pi
            VAR_INPUT 
                k: LREAL;
                tD: LREAL;
                tI: LREAL;
            END_VAR

            // Init expected 
            expected.k := k;
            expected.tDSeconds := tD;
            expected.tISeconds := tI;

            // Init dynamic
            dynamic.elapsedTimeProvider := oneSecondProvider;
            dynamic.setK(k);
            dynamic.SetTDSeconds(tD);
            dynamic.SetTISeconds(tI);

            // Init value 
            value.elapsedTimeProvider := oneSecondProvider;
            value.slope := 1.0;

            // Assert
            THIS.AssertDynamic(expected, dynamic, value);
        END_METHOD
    
    END_CLASS
END_NAMESPACE