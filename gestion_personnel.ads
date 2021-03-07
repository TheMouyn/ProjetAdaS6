with outils;
use outils;

package gestion_personnel is


   type T_categorie is (nain, elfe, magicien, grandMagicien);

   type T_personnel is record
      identite : T_identite;
      pseudo : T_mot := (others =>' ');
      categorie : T_categorie;
      nuMagique : integer;
      emprinte : integer;
      nbFoisMdpFaux : integer; -- permet de denombrer le nombre de fois ou le mdp a ete saisie incorect. Quand > 3 mdp doit etre reset et connexion impossible
   end record;

   -- liste du personnel
   type T_cellPersonnel;
   type T_Pteur_Personnel is access T_cellPersonnel;
   type T_cellPersonnel is record
      val : T_personnel;
      suiv : T_Pteur_Personnel;
   end record;

   -- file de personnel : permmet de gerer les demande de mdp pour Mandrake
   type T_filePersonnel is record
      tete, fin : T_Pteur_Personnel;
   end record;


end gestion_personnel;
