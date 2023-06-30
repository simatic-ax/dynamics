NAMESPACE Simatic.Ax.Dynamics
    CLASS BangBangController EXTENDS Controller

        VAR PUBLIC 
            hysteresis : LREAL;
        END_VAR
        VAR PRIVATE
            _output : BOOL;
            _heatingMode : BOOL;
        END_VAR

        // Get Output
        METHOD PUBLIC GetOutput : BOOL 
            GetOutput := _output;
        END_METHOD
        // Set Output
        METHOD PUBLIC SetOutput
            VAR_INPUT
                newOutput : BOOL;
            END_VAR
            _output := newOutput;
        END_METHOD

        // Get Mode
        METHOD PUBLIC IsHeatingModeEnabled : BOOL
            IsHeatingModeEnabled := _heatingMode;
        END_METHOD
        METHOD PUBLIC IsCoolingModeEnabled : BOOL
            IsCoolingModeEnabled := NOT _heatingMode;
        END_METHOD
        // Set Mode
        METHOD PUBLIC EnableHeatingMode 
            _heatingMode := TRUE;
        END_METHOD 
        METHOD PUBLIC EnableCoolingMode
            _heatingMode := FALSE;
        END_METHOD

        METHOD PUBLIC Next : BOOL
            VAR_INPUT 
                value : LREAL;
            END_VAR
            IF      value < this.GetInput() - hysteresis THEN 
                _output := _heatingMode;
            ELSIF   value > this.GetInput() + hysteresis THEN
                _output := NOT _heatingMode;
            END_IF;
            Next := _output;
        END_METHOD

        METHOD PUBLIC Next : BOOL
            VAR_INPUT 
                value : LREAL;
                input : LREAL;
            END_VAR
            this.SetInput(input);
            Next := this.Next(value);
        END_METHOD
        
    END_CLASS
END_NAMESPACE