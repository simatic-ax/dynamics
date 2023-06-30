NAMESPACE Simatic.Ax.Dynamics
    CLASS PID_Dynamic EXTENDS ParallelFirstOrderDynamic

        VAR PRIVATE
            _pi_dynamic : PI_Dynamic;
            _d_dynamic : Differentiator;
        END_VAR

        // Get TI
        METHOD PUBLIC GetTISeconds : LREAL 
            GetTISeconds := _pi_dynamic.GetTISeconds();
        END_METHOD
        //Set TI
        METHOD PUBLIC SetTISeconds : LREAL
            VAR_INPUT
                seconds : LREAL;
            END_VAR
            _pi_dynamic.SetTISeconds(seconds);
            _pi_dynamic.elapsedTimeProvider := _pseudoTimeProvider;
        END_METHOD
        
        // Get TD
        METHOD PUBLIC GetTDSeconds : LREAL
            GetTDSeconds := _d_dynamic.GetTDSeconds();
        END_METHOD
        // Set TD
        METHOD PUBLIC SetTDSeconds
            VAR_INPUT 
                newTDSeconds : LREAL;
            END_VAR
            _d_dynamic.SetTDSeconds(newTDSeconds);
            _d_dynamic.elapsedTimeProvider := _pseudoTimeProvider;
        END_METHOD 

        METHOD PUBLIC GetIntegratorMinOutput : LREAL 
            GetIntegratorMinOutput := _pi_dynamic.GetIntegratorMinOutput();
        END_METHOD
        METHOD PUBLIC SetIntegratorMinOutput : LREAL
            VAR_INPUT
                newMinOutput : LREAL;
            END_VAR
            _pi_dynamic.SetIntegratorMinOutput(newMinOutput);
        END_METHOD
        METHOD PUBLIC GetIntegratorMaxOutput : LREAL 
            GetIntegratorMaxOutput := _pi_dynamic.GetIntegratorMaxOutput();
        END_METHOD
        METHOD PUBLIC SetIntegratorMaxOutput : LREAL
            VAR_INPUT
                newMaxOutput : LREAL;
            END_VAR
            _pi_dynamic.SetIntegratorMaxOutput(newMaxOutput);
        END_METHOD
    
        // PI
        METHOD PROTECTED OVERRIDE _Next0 : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            _Next0 := _pi_dynamic.Next(value);
        END_METHOD

        // D
        METHOD PROTECTED OVERRIDE _Next1 : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            _Next1 := _d_dynamic.Next(value);
        END_METHOD
    END_CLASS
END_NAMESPACE