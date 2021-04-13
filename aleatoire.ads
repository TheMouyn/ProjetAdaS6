package Aleatoire is
    SUBTYPE Valeur_Reelle_Aleatoire IS FLOAT RANGE 0.0 .. 1.0 ;
    procedure Initialise (Minimum : INTEGER := 1 ; 
			  Maximum : INTEGER := 10);
    function Random RETURN Valeur_Reelle_Aleatoire ;
    function Random RETURN INTEGER ;
end Aleatoire;