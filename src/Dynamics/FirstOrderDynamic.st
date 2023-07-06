NAMESPACE Simatic.Ax.Dynamics
    /// Dynamic exploiting the elapsed time since last call
    /// `elapsedTimeProvider` must be given!
    CLASS INTERNAL ABSTRACT FirstOrderDynamic IMPLEMENTS IDynamic

        VAR PUBLIC 
            /// Provides elapsed time since last call to `Next()`
            /// `elapsedTimeProvider.Start()` will be called automatically on `Next()`
            /// User should never call `elapsedTimeProvider.Start()`!
            /// Unexpected behaviour could be the result.
            elapsedTimeProvider : IElapsedSecondsProvider;
        END_VAR
    
        /// Maps the process value and the elapsed time in seconds to the next output value
        METHOD PROTECTED ABSTRACT _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
            END_VAR
        END_METHOD
        METHOD PUBLIC FINAL Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            Next := this._Next(value, elapsedTimeProvider.GetElapsedSeconds());
            elapsedTimeProvider.Start();
        END_METHOD

    END_CLASS
END_NAMESPACE