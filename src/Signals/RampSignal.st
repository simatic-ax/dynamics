NAMESPACE Simatic.Ax.Dynamics
    /// A ramp with constant slope as given by `slope`
    /// `elapsedTimeProvider` must be set!
    CLASS RampSignal IMPLEMENTS IOutputSignal

        VAR PUBLIC 
            /// The `IElapsedSecondsProvider` to use
            elapsedTimeProvider : IElapsedSecondsProvider;
            /// The slope of the ramp, being its derivative
            slope : LREAL;
        END_VAR
        VAR PRIVATE 
            _output : LREAL;
        END_VAR

        METHOD PUBLIC GetOutput : LREAL
            GetOutput := _output;
        END_METHOD 
        /// Set current output. Ramp will continue from there. 
        METHOD PUBLIC SetOutput : LREAL
            VAR_INPUT
                newOutput : LREAL;
            END_VAR
            _output := newOutput;
            SetOutput := _output;
        END_METHOD

        /// Get the integration time T_I viewing the ramp signal as the integral over a constant signal. 
        /// T_I = 1 / slope
        METHOD PUBLIC  GetTISeconds : LREAL
            GetTISeconds := 1 / slope;
        END_METHOD

        /// Set the integration time T_I viewing the ramp signal as the integral over a constant signal. 
        /// T_I = 1 / slope
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