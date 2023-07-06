NAMESPACE Simatic.Ax.Dynamics
    /// The process value is passed to two first order dynamics. 
    /// The output values are summed up and multiplied by the factor K.
    CLASS INTERNAL ABSTRACT ParallelFirstOrderDynamic EXTENDS FirstOrderDynamic

        VAR PUBLIC
            /// The factor K
            k : LREAL := 1.0;
        END_VAR

        VAR PROTECTED
            /// Provides the time of the real time provider in the moment of the call to next. 
            /// The use of a pseudo time provider ensures the same elapsed time is used by both dynamics. 
            /// Moreover, time is saved by not calling the measuring function twice. 
            _pseudoTimeProvider : ConstantTimeProvider;
        END_VAR

        /// Get the factor K
        METHOD PUBLIC GetK : LREAL
            GetK := k;
        END_METHOD
        /// Set the factor K
        METHOD PUBLIC SetK 
            VAR_INPUT 
                newK : LREAL;
            END_VAR
            k := newK;
        END_METHOD
        
        /// The method `Next` of one dynamic
        METHOD PROTECTED ABSTRACT _Next0 : LREAL
            VAR_INPUT 
                value : LREAL;
            END_VAR
        END_METHOD
        /// The method `Next` of the other dynamic
        METHOD PROTECTED ABSTRACT _Next1 : LREAL
            VAR_INPUT 
                value : LREAL;
            END_VAR
        END_METHOD

        METHOD PROTECTED FINAL OVERRIDE _Next : LREAL
            VAR_INPUT
                value : LREAL;
                elapsedSeconds : LREAL;
            END_VAR
            _pseudoTimeProvider.seconds := elapsedSeconds;
            _Next := k * (this._Next0(value) + this._Next1(value));
        END_METHOD

    END_CLASS
END_NAMESPACE