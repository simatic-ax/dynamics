USING AxUnit;
USING Simatic.Ax.Dynamics;

NAMESPACE MyTest
    {TestFixture}
    CLASS RampTest EXTENDS GlobalTest

        VAR 
            actual : RampSignal;
        END_VAR

        {Test(slope := 1)}
        {Test(slope := -2.7)}
        {Test(slope := 1.3)}
        METHOD PUBLIC SlopeTest
            VAR_INPUT 
                slope : LREAL;
            END_VAR
            actual.slope := slope;
            actual.elapsedTimeProvider := oneSecondProvider;
            Assert.Equal(slope, actual.Next());
            Assert.Tolerated(2*slope, actual.Next(), TOLERANCE);
            Assert.Tolerated(3*slope, actual.Next(), TOLERANCE);
            Assert.Tolerated(4*slope, actual.Next(), TOLERANCE);
        END_METHOD

        {Test(tI := 1)}
        {Test(tI := -2.7)}
        {Test(tI := 1.3)}
        METHOD PUBLIC TITest 
            VAR_INPUT 
                tI : LREAL;
            END_VAR 
            actual.SetTISeconds(tI);
            actual.elapsedTimeProvider := oneSecondProvider;
            Assert.Tolerated(1/tI, actual.Next());
            Assert.Tolerated(2/tI, actual.Next(), TOLERANCE);
            Assert.Tolerated(3/tI, actual.Next(), TOLERANCE);
            Assert.Tolerated(4/tI, actual.Next(), TOLERANCE);
        END_METHOD

    END_CLASS
END_NAMESPACE