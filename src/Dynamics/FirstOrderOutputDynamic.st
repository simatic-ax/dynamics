NAMESPACE Simatic.Ax.Dynamics
    /// Dynamic exploiting the elapsed time since last call and last output value
    /// `elapsedTimeProvider` must be given!
    CLASS INTERNAL ABSTRACT FirstOrderOutputDynamic EXTENDS FirstOrderDynamic IMPLEMENTS IOutputDynamic

        VAR PRIVATE
            _output : LREAL;
        END_VAR

        METHOD PUBLIC GetOutput : LREAL
            GetOutput := _output;
        END_METHOD
        METHOD PUBLIC SetOutput : LREAL
            VAR_INPUT
                output : LREAL;
            END_VAR
            _output := output;
            SetOutput := _output;
        END_METHOD

        /// Maps process value, elapsed time since last call and last output value to next output value
        METHOD PROTECTED ABSTRACT _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
                output : LREAL;
            END_VAR
        END_METHOD

        METHOD PROTECTED FINAL OVERRIDE _Next : LREAL
            VAR_INPUT 
                value : LREAL;
                elapsedSeconds : LREAL;
            END_VAR
            _Next := this.SetOutput(this._Next(value, elapsedSeconds, _output));
        END_METHOD

    END_CLASS
END_NAMESPACE