USING Simatic.Ax.Dynamics;
USING AxUnit;
NAMESPACE MyTest        
    {TestFixture}
    CLASS GetSetTest EXTENDS GlobalTest

        VAR
            amplifier : Amplifier;
            bangBangController : BangBangController;
            boundedDynamic : BoundedDynamic;
            boundedOutputDynamic : BoundedOutputDynamic;
            constantSignal : ConstantSignal;
            controller : DynamicController;
            differentiator : Differentiator;
            integrator : Integrator;
            pd_dynamic : PD_Dynamic;
            pi_dynamic : PI_Dynamic;
            pid_dynamic : PID_Dynamic;
            pt1_dynamic : PT1_Dynamic;
            pt1_deadbeatController : PT1_DeadbeatController;
            rampSignal : RampSignal;
        END_Var

        {Test(value := 0)} 
        {Test(value := 1)} 
        {Test(value := 2.7)} 
        {Test(value := 83.9)} 
        {Test(value := 475)} 
        METHOD PUBLIC LRealTest 
            VAR_INPUT 
                value : LREAL;
            END_VAR

            amplifier.SetK(value);
            Assert.Equal(value, amplifier.GetK());

            bangBangController.SetInput(value);
            Assert.Equal(value, bangBangController.GetInput());

            boundedDynamic.SetMinOutput(value);
            Assert.Equal(value, boundedDynamic.GetMinOutput());
            boundedDynamic.SetMaxOutput(value);
            Assert.Equal(value, boundedDynamic.GetMaxOutput());

            boundedOutputDynamic.SetMinOutput(value);
            Assert.Equal(value, boundedOutputDynamic.GetMinOutput());
            boundedOutputDynamic.SetMaxOutput(value);
            Assert.Equal(value, boundedOutputDynamic.GetMaxOutput());

            constantSignal.SetOutput(value);
            Assert.Equal(value, constantSignal.GetOutput());

            controller.SetInput(value);
            Assert.Equal(value, controller.GetInput());

            differentiator.SetTDSeconds(value);
            Assert.Equal(value, differentiator.GetTDSeconds());

            integrator.SetTISeconds(value);
            Assert.Equal(value, integrator.GetTISeconds());
            integrator.SetOutput(value);
            Assert.Equal(value, integrator.GetOutput());

            pd_dynamic.SetK(value);
            Assert.Equal(value, pd_dynamic.GetK());
            pd_dynamic.SetTDSeconds(value);
            Assert.Equal(value, pd_dynamic.GetTDSeconds());

            pi_dynamic.SetK(value);
            Assert.Equal(value, pi_dynamic.GetK());
            pi_dynamic.SetTISeconds(value);
            Assert.Equal(value, pi_dynamic.GetTISeconds());

            pid_dynamic.SetK(value);
            Assert.Equal(value, pid_dynamic.GetK());
            pid_dynamic.SetTISeconds(value);
            Assert.Equal(value, pid_dynamic.GetTISeconds());
            pid_dynamic.SetTDSeconds(value);
            Assert.Equal(value, pid_dynamic.GetTDSeconds());
            pid_dynamic.SetIntegratorMinOutput(value);
            Assert.Equal(value, pid_dynamic.GetIntegratorMinOutput());
            pid_dynamic.SetIntegratorMaxOutput(value);
            Assert.Equal(value, pid_dynamic.GetIntegratorMaxOutput());

            pt1_dynamic.SetK(value);
            Assert.Equal(value, pt1_dynamic.GetK());
            pt1_dynamic.SetT0Seconds(value);
            Assert.Equal(value, pt1_dynamic.GetT0Seconds());

            pt1_deadbeatController.SetK(value);
            Assert.Equal(value, pt1_deadbeatController.GetK());

            rampSignal.SetTISeconds(value);
            Assert.Equal(value, rampSignal.GetTISeconds());
            rampSignal.SetOutput(value);
            Assert.Equal(value, rampSignal.GetOutput());
        END_METHOD 

        {Test(value0 := 1, value1 := 1)}
        {Test(value0 := 2.8, value1 := 29.5)}
        {Test(value0 := 6.54, value1 := 0.3)}
        METHOD PUBLIC LRealsTest
            VAR_INPUT 
                value0 : LREAL;
                value1 : LREAL;
            END_VAR

            differentiator.SetTDSeconds(value0, value1);
            Assert.Equal(value0 * value1, differentiator.GetTDSeconds());

            integrator.SetTISeconds(value0, value1);
            Assert.Equal(value0 / value1, integrator.GetTISeconds());
        END_METHOD
     

        {Test(value := FALSE)}
        {Test(value := TRUE)}
        METHOD PUBLIC BooleanTest
            VAR_INPUT 
                value : BOOL;
            END_VAR

            IF value THEN
                bangBangController.EnableHeatingMode();
            ELSE
                bangBangController.EnableCoolingMode(); 
            END_IF;
            Assert.Equal(    value, bangBangController.IsHeatingModeEnabled());
            Assert.Equal(NOT value, bangBangController.IsCoolingModeEnabled());

            bangBangController.SetOutput(value);
            Assert.Equal(value, bangBangController.GetOutput());
        END_METHOD
    END_CLASS
END_NAMESPACE