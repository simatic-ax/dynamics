NAMESPACE Simatic.Ax.Dynamics
    CLASS PI_Dynamic EXTENDS ParallelFirstOrderDynamic

        VAR PRIVATE
            _boundedIntegrator : BoundedOutputDynamic;
            _unboundedIntegrator : Integrator;
        END_VAR

        METHOD PUBLIC GetTISeconds : LREAL 
            GetTISeconds := _unboundedIntegrator.GetTISeconds();
        END_METHOD
        METHOD PUBLIC SetTISeconds : LREAL
            VAR_INPUT
                seconds : LREAL;
            END_VAR
            _boundedIntegrator.SetUnboundedDynamic(_unboundedIntegrator);
            _unboundedIntegrator.elapsedTimeProvider := _pseudoTimeProvider;
            _unboundedIntegrator.SetTISeconds(seconds);
        END_METHOD

        METHOD PUBLIC GetIntegratorMinOutput : LREAL 
            GetIntegratorMinOutput := _boundedIntegrator.GetMinOutput();
        END_METHOD
        METHOD PUBLIC SetIntegratorMinOutput : LREAL
            VAR_INPUT
                newMinOutput : LREAL;
            END_VAR
            _boundedIntegrator.SetMinOutput(newMinOutput);
        END_METHOD
        METHOD PUBLIC DisableIntegratorMin 
            _boundedIntegrator.DisableMin();
        END_METHOD
        METHOD PUBLIC GetIntegratorMaxOutput : LREAL 
            GetIntegratorMaxOutput := _boundedIntegrator.GetMaxOutput();
        END_METHOD
        METHOD PUBLIC SetIntegratorMaxOutput : LREAL
            VAR_INPUT
                newMaxOutput : LREAL;
            END_VAR
            _boundedIntegrator.SetMaxOutput(newMaxOutput);
        END_METHOD
        METHOD PUBLIC DisableIntegratorMax 
            _boundedIntegrator.DisableMax();
        END_METHOD

        // P
        METHOD PROTECTED OVERRIDE _Next0 : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            _Next0 := value;
        END_METHOD

        // I
        METHOD PROTECTED OVERRIDE _Next1 : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            _Next1 := _boundedIntegrator.Next(value);
        END_METHOD
    END_CLASS
END_NAMESPACE

        