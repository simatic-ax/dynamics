NAMESPACE Simatic.Ax.Dynamics
    /// `GetElapsedSeconds` and `Start`
    INTERFACE IElapsedSecondsProvider 

        /// Get elapsed time since last call of `Start`
        METHOD GetElapsedSeconds : LREAL END_METHOD

        /// Start time measurement
        METHOD Start END_METHOD      

    END_INTERFACE
END_NAMESPACE