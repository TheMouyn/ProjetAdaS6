with outils, gestion_commande, sequential_io;
use outils, gestion_commande;

package body gestion_commande is


   type T_article is record
      nomArticle : T_mot := (others => ' ');
      prix : T_prix;
      stockDispo : integer;
   end record;

   type T_commandeArticle is record
      -- permet de gerer la quantite d'un article desire
      idArticle : integer;
      qttVoulu : integer;
   end record;

   -- permet de gérer les articles et leurs stock et prix
   type T_stock is array (integer range 1..6) of T_article;

   -- ce tableau permet de lister les articles dans une commande
   type T_table_article is array (integer range 1..6) of T_commandeArticle;

   type T_commande is record
      identiteClient : T_identite;
      nuCommande : integer;
      articleCommande : T_table_article; -- tableau des produits de la commande
      preparateur : T_mot := (others =>' ');
      montant : T_prix;
      -- status de la commande -> placement dans une liste specifique
   end record;


   -- liste commande
   type T_cellCommande;
   type T_Pteur_Commande is access T_cellCommande;
   type T_cellCommande is record
      val : T_commande;
      suiv : T_Pteur_Commande;
   end record;

   -- file de commande
   type T_fileCommande is record
      tete, fin : T_Pteur_Commande;
   end record;

   -- gestion du fichier d'archive
   package Fichier_archive_commande is new sequential_io(T_commande);
   use Fichier_archive_commande;
   varFichier_T_commande : Fichier_archive_commande.file_type;


end gestion_commande;
