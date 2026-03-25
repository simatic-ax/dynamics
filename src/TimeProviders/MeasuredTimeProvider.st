USING Siemens.Simatic.Clocks;
NAMESPACE Simatic.Ax.Dynamics
    /// Uses a `Siemens.Simatic.S71500.Clocks.RuntimeMeasurement` 
    CLASS MeasuredTimeProvider IMPLEMENTS IElapsedSecondsProvider 
        
        VAR PRIVATE
            _lastTime : LDATE_AND_TIME;
            _currentTime : LDATE_AND_TIME;
        END_VAR
    
        METHOD PUBLIC GetElapsedSeconds : LREAL
            VAR_TEMP
                timeDiff : LTIME;
            END_VAR
            timeDiff := _currentTime - _lastTime;

            //on startup: ignore long time differences and zero time difference
            //replace with fixed 10ms
            IF timeDiff > T#1m OR timeDiff = T#0s THEN
                timeDiff := T#10ms;
            END_IF;
            //convert nanoseconds into seconds
            GetElapsedSeconds := TO_LREAL(TO_LINT(timeDiff)) * 0.001 * 0.001 * 0.001;
        END_METHOD        
    
        METHOD PUBLIC Start
            _lastTime := _currentTime;
            GetSystemDateTime(value => _currentTime);
        END_METHOD

    END_CLASS
END_NAMESPACE
