with calendar  ;
package body Aleatoire is
    Max : INTEGER := 10 ;
    Min : INTEGER := 1 ;

      X : INTEGER := 10_001;
      Y : INTEGER := 20_001;
      Z : INTEGER := 30_001;
    procedure Initialise (Minimum : INTEGER := 1 ; 
			  Maximum : INTEGER := 10)IS
    begin
	Max := Maximum ;
	IF Minimum <= Max THEN
	    Min := Minimum ;
	ELSE
	    Min := Maximum ;
	END IF ;
    end Initialise ;

   function RAN return FLOAT is
      W : FLOAT;
	
	function CONVERT_TO_FLOAT ( i : INTEGER ) RETURN FLOAT is
	begin
	    RETURN FLOAT ( i ) ;
	end CONVERT_TO_FLOAT ;

   begin
      X := 171 * (X mod 177 - 177) - 2 * (X / 177);
      if X < 0 then
         X := X + 30269;
      end if;
      Y := 172 * (Y mod 176 - 176) - 35 * (Y / 176);
      if Y < 0 then
         Y := Y + 30307;
      end if;
      Z := 170 * (Z mod 178 - 178) - 63 * (Z / 178);
      if Z < 0 then
         Z := Z + 30323;
      end if;

      W := CONVERT_TO_FLOAT(X)/30269.0 + CONVERT_TO_FLOAT(Y)/30307.0 +
      CONVERT_TO_FLOAT(Z)/30323.0;
      return W - CONVERT_TO_FLOAT(INTEGER(W - 0.5));
   end RAN;

    function Random RETURN Valeur_Reelle_Aleatoire IS
    begin
	return RAN ;
    end Random ;

    function Random RETURN INTEGER IS
	Valeur : Valeur_Reelle_Aleatoire := Random ;
    begin
	RETURN Min + INTEGER ( Valeur * FLOAT ( Max - Min + 1 ) - 0.49999999 ) ;
    end Random ;

begin
for i in 1..20 loop
 declare
    x : Valeur_Reelle_aleatoire ;
    t : constant calendar.TIME := calendar.clock ;
    st : constant DURATION := calendar.seconds ( t ) ;
    s : constant natural := natural ( st - 0.4999 ) ; -- partie entiere
    d  : constant DURATION := st - DURATION ( s ) ;
    m : constant natural := NATURAL ( DURATION ( 1_000 ) * d ) ;
 begin
    for i in 0 .. m loop
	x := Random ;	
    end loop ;
 end ;
end loop ;
end Aleatoire;
