NAMESPACE Simatic.Ax.Dynamics

    /// `Next(value)`
    INTERFACE IDynamic

        /// Pass process value 
        /// Get next output
        METHOD Next : LREAL 
            VAR_INPUT
                value : LREAL;
            END_VAR
        END_METHOD

    END_INTERFACE
END_NAMESPACE