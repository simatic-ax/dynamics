NAMESPACE Simatic.Ax.Dynamics
    INTERFACE IDynamicController

        /// Pass process value and input
        /// Get next output
        METHOD Next : LREAL 
            VAR_INPUT
                value : LREAL;
                input : LREAL;
            END_VAR
        END_METHOD

    END_INTERFACE
END_NAMESPACE