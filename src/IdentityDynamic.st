NAMESPACE Dynamics 
    CLASS IdentityDynamic IMPLEMENTS IDynamic                
    
        METHOD PUBLIC Next : LREAL
            VAR_INPUT
                value : LREAL;
            END_VAR
            Next := value;
        END_METHOD

    END_CLASS
END_NAMESPACE