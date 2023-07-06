NAMESPACE Simatic.Ax.Dynamics
    /// `SetOutput`, extends `IDynamic, IOutputProvider`
    INTERFACE IOutputDynamic EXTENDS IDynamic, IOutputProvider
        /// Set output value
        /// New value should be used as base for next output
        METHOD SetOutput : LREAL
            VAR_INPUT
                output : LREAL;
            END_VAR
        END_METHOD
    END_INTERFACE
END_NAMESPACE