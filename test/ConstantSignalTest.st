USING AxUnit;
USING Simatic.Ax.Dynamics;

NAMESPACE MyTest        
    {TestFixture}
    CLASS ConstantSignalTest EXTENDS GlobalTest
        VAR 
            testerToTest : ConstantSignal;
        END_VAR
        {Test(output:=0)}
        {Test(output:=1)}
        {Test(output:=56.7)}
        {Test(output:=-23)}
        {Test(output:=-4.784)}
        METHOD PUBLIC Test 
            VAR_INPUT 
                output : LREAL;
            END_VAR
            testerToTest.output := output;
            Assert.Equal(output, testerToTest.Next());
            Assert.Equal(output, testerToTest.Next());
            Assert.Equal(output, testerToTest.Next());
        END_METHOD
    END_CLASS
END_NAMESPACE