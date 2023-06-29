USING System.Math;
NAMESPACE AxUnit.Assert
    FUNCTION LessThanOrEqual
        VAR_INPUT 
            left : LREAL;
            right : LREAL;
        END_VAR
        IF left = right THEN 
            Equal(left, right);
        ELSE 
            LessThan(left, right);
        END_IF;
    END_FUNCTION
    FUNCTION GreaterThanOrEqual
        VAR_INPUT 
            left : LREAL;
            right : LREAL;
        END_VAR
        IF left = right THEN 
            Equal(left, right);
        ELSE 
            GreaterThan(left, right);
        END_IF;
    END_FUNCTION
    FUNCTION Tolerated 
        VAR_INPUT 
            expected : LREAL;
            actual : LREAL;
            tolerance : LREAL;
        END_VAR
        GreaterThanOrEqual(actual, expected - tolerance);
        LessThanOrEqual   (actual, expected + tolerance);
    END_FUNCTION
END_NAMESPACE