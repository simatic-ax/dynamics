NAMESPACE Simatic.Ax.Dynamics
    INTERFACE IOutputDynamic EXTENDS IDynamic, IOutputProvider
        METHOD SetOutput : LREAL
            VAR_INPUT
                output : LREAL;
            END_VAR
        END_METHOD
    END_INTERFACE
END_NAMESPACE