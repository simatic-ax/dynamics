USING Siemens.Simatic.S71500.Clocks;
NAMESPACE Simatic.Ax.Dynamics
    /// Uses a `Siemens.Simatic.S71500.Clocks.RuntimeMeasurement` 
    CLASS MeasuredTimeProvider IMPLEMENTS IElapsedSecondsProvider 
        
        VAR PRIVATE
            _measurement : RuntimeMeasurement;
        END_VAR
    
        METHOD PUBLIC GetElapsedSeconds : LREAL
            GetElapsedSeconds := _measurement.GetElapsedSeconds();
        END_METHOD        
    
        METHOD PUBLIC Start
            _measurement.Start();
        END_METHOD

    END_CLASS
END_NAMESPACE