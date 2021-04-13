with ada.text_io, ada.integer_text_io, ada.float_text_io, Ada.Characters.Handling, nt_console;
use ada.text_io, ada.integer_text_io, ada.float_text_io, Ada.Characters.Handling, nt_console;

package body outils is


   function desirQuitter return boolean is
      -- permet de poser la question à l'utilisateur si il désir quitter la procedure acctuelle
     quitter : boolean;

   begin -- desirQuitter
     put("Voulez-vous quitter la procedure actuelle ?"); new_line;
     saisieBoolean(quitter);
     return(quitter);
   end desirQuitter;

   -------------------------------------------------------------------------------------

   procedure saisieInteger(bornInf, bornSupp : in integer; nombre : out integer) is
      -- permet la saisie d'un entier entre deux bornes

   begin -- saisieInteger

     loop
      begin
          put("=> ");
          get(nombre); skip_line;
          exit when nombre in bornInf..bornSupp;
          put("Votre saisie n'est pas entre "); put(bornInf, 1); put(" et "); put(bornSupp, 1); new_line;
             exception
               when others => put("Votre saisie n'est pas un nombre"); skip_line; new_line;
      end;
     end loop;

   end saisieInteger;

   -------------------------------------------------------------------------------------


   procedure saisieBoolean(bool : out boolean) is
      -- permet la saisie d'un boolean via un petit menu
     car : character;

   begin -- saisieBoolean
     loop
       put("Oui / Non (O/N) => ");
       get(car); skip_line; new_line;
       case car is
         when 'O'|'o' => bool := TRUE; exit;
         when 'N'|'n' => bool := FALSE; exit;
         when others => put_line("Le caractere n'est pas O ou N");
       end case;
     end loop;
   end saisieBoolean;

   -------------------------------------------------------------------------------------

   procedure afficherTexte(texte : in T_mot) is

   begin -- afficherTexte
     for i in texte'range loop
       if texte(i)=' ' and texte(i+1)=' ' then
         exit;
       else
         put(texte(i));
       end if;
     end loop;
   end afficherTexte;

   -------------------------------------------------------------------------------------


   procedure saisieString(texte : out T_mot) is
      -- permet la saisie d'un string de 50 caracteres
     k : integer:=0;

   begin -- saisieString
     loop
       texte := (others => ' ');
       put("=> ");
       get_line(texte, k); new_line;
       exit when k<=50 and k>0;
       put("Votre mot est vide ou supperieur a 50 caracteres, veuillez réessayer"); new_line;
     end loop;

     -- traitement de la casse : on stock tous les t_mot en majuscule
     texte := To_Upper(texte);

   end saisieString;

-- ----------------------------------------------------------------------------------------------

   procedure saisieIdentite(identite : out T_identite) is

   begin -- saisieIdentite
      put_line("Prenom du client : ");
      saisieString(identite.prenom);
      new_line;

      put_line("Nom du client : ");
      saisieString(identite.nom);
      new_line;


   end saisieIdentite;

-- ----------------------------------------------------------------------------------------------

procedure saisieMotDePasse(mdp : out T_MDP) is
   -- permet la saisie d'un string de 8 caracteres avec verif de caracteres autres que lettre
  k : integer:=0;
  carSpe : boolean := false; -- est TRUE si le mdp contient des caracteres speciaux

begin -- saisieString
  loop
    mdp := (others => 'z');
    carSpe := false;
    k := 0;

    put("=> ");
    get_line(mdp, k); new_line;

   for i in mdp'range loop
      if (not(mdp(i) in 'a'..'z')) AND (not(mdp(i) in 'A'..'Z')) then
         carSpe := TRUE;
         exit;
      end if;
   end loop;

   exit when (k = 8) AND (carSpe = true);

   if k /= 8 then
      put("Votre mot ne comporte pas 8 caracteres"); new_line;
   end if;

   if carSpe = false then
      put("Votre mot de passe ne comporte pas de caracteres qui ne sont pas des lettres"); new_line;
   end if;

  end loop;

end saisieMotDePasse;

end outils;
