USING System.Math;
NAMESPACE Simatic.Ax.Dynamics 
    CLASS PT1_DeadbeatController EXTENDS Controller IMPLEMENTS IDynamicController

        VAR PROTECTED 
            _expTT : LREAL;
            _k : LREAL;
        END_VAR

        // Get K
        METHOD PUBLIC GetK : LREAL
            GetK := _k;
        END_METHOD
        // Set K
        METHOD PUBLIC SetK
            VAR_INPUT 
                k : LREAL;
            END_VAR
            _k := k;
        END_METHOD

        // Set T0
        METHOD PUBLIC SetPeriods 
            VAR_INPUT 
                elapsedTime : LREAL;
                t0 : LREAL;
            END_VAR
            _expTT := Exp(elapsedTime / t0);
        END_METHOD

        METHOD PUBLIC Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            Next := (THIS.GetInput() * _expTT - value) / (_expTT - 1) / _k;
        END_METHOD

        METHOD PUBLIC Next : LREAL
            VAR_INPUT
                value : LREAL;
                input : LREAL;
            END_VAR
            THIS.SetInput(input);
            Next := THIS.Next(value);
        END_METHOD
        
    END_CLASS
END_NAMESPACE