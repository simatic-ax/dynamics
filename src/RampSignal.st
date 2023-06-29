NAMESPACE Dynamics
    CLASS RampSignal IMPLEMENTS IOutputSignal

        VAR PUBLIC 
            elapsedTimeProvider : TimeProviders.IElapsedSecondsProvider;
            slope : LREAL;
        END_VAR
        VAR PRIVATE 
            _output : LREAL;
        END_VAR

        // Get output 
        METHOD PUBLIC GetOutput : LREAL
            GetOutput := _output;
        END_METHOD 
        // Set output 
        METHOD PUBLIC SetOutput : LREAL
            VAR_INPUT
                newOutput : LREAL;
            END_VAR
            _output := newOutput;
            SetOutput := _output;
        END_METHOD

        METHOD PUBLIC  GetTISeconds : LREAL
            GetTISeconds := 1 / slope;
        END_METHOD
        METHOD PUBLIC SetTISeconds
            VAR_INPUT
                newTISeconds : LREAL;
            END_VAR 
            slope := 1 / newTISeconds;
        END_METHOD

        METHOD PUBLIC Next : LREAL
            _output := _output + elapsedTimeProvider.GetElapsedSeconds() * slope;
            Next := _output;
        END_METHOD
        
    END_CLASS
END_NAMESPACE