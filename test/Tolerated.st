USING System.Math;
NAMESPACE AxUnit.Assert
    FUNCTION Tolerated 
        VAR_INPUT 
            expected : LREAL;
            actual : LREAL;
            tolerance : LREAL;
        END_VAR
        GreaterOrEqual(actual, expected - tolerance);
        LessOrEqual   (actual, expected + tolerance);
    END_FUNCTION
END_NAMESPACE
