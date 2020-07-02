DROP DATABASE IF EXISTS Bibliotheque;
CREATE DATABASE Bibliotheque;
USE Bibliotheque;
/* les tables*/

/*Creation de la table Auteur*/
CREATE TABLE Auteur (
  IdAuteur SMALLINT UNSIGNED NOT NULL  AUTO_INCREMENT,
  nom VARCHAR(30) NOT NULL,
  prenom VARCHAR(30) NOT NULL,
  date_naissance DATE NOT NULL,
  
  PRIMARY KEY (IdAuteur)
)
ENGINE=INNODB;

/*Creation de la table Personnel*/
CREATE TABLE Personnel (
  IdPersonnel INT(3) NOT NULL,
  nom VARCHAR(30) NOT NULL,
  prenom VARCHAR(30) NOT NULL,
  date_naissance DATE NOT NULL,
  mot_de_passe  VARCHAR(30) NOT NULL,
   
  PRIMARY KEY (IdPersonnel)
)
ENGINE=INNODB;

/*Creation de la table Edition*/
CREATE TABLE Edition (
  IdEdition SMALLINT UNSIGNED NOT NULL  AUTO_INCREMENT,
  nom_edition VARCHAR(30) NOT NULL,
  PRIMARY KEY (IdEdition)
)
ENGINE=INNODB;

/*Creation de la table Etudiant*/
CREATE TABLE Etudiant (
  Numero_etudiant INT(3) NOT NULL,
  nom VARCHAR(30) NOT NULL,
  prenom VARCHAR(30) NOT NULL,
  date_naissance DATE NOT NULL,
  mot_de_passe  VARCHAR(30) NOT NULL,
  PRIMARY KEY (Numero_etudiant)
)
ENGINE=INNODB;

/*Creation de la table Livre.
  Dans cette table nous pourrons avoir plusieurs exemplaires d'un meme livre mais qui auront un code barre differents*/
  
CREATE TABLE Livre (
   IdLivre SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
   titre VARCHAR(60) NOT NULL,
   cote  VARCHAR(30) NOT NULL,
   code_barre VARCHAR(30) NOT NULL,
   num_personnel INT(3) NOT NULL,
   num_auteur SMALLINT UNSIGNED NOT NULL,
   num_edition SMALLINT UNSIGNED NOT NULL,
   discipline VARCHAR(30) NOT NULL,
   prix decimal null default null comment '€',
   PRIMARY KEY (IdLivre),
   FOREIGN KEY (num_personnel) REFERENCES Personnel(IdPersonnel),
   FOREIGN KEY (num_auteur) REFERENCES Auteur(IdAuteur),
   FOREIGN KEY (num_edition) REFERENCES Edition(IdEdition)
   
   
)
ENGINE=INNODB;

/*Creation de la table Pret
cette table stockera l'historique de tout les livres emprunter  dans la bibliotheque ainsi nous pourrons avoir
plusieurs fois le meme livre dans la tables mais sous un identifiant de pret different,de plus nous pouvons aussi avoir 
des livres dont la date de retour est deja passée par rapport à la  date actuel vu qu'il s'agit bien d'une table qui conserve historique de 
tout les prets effectuer*/

CREATE TABLE Pret (
   IdPret SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
   date_pret  DATE NOT NULL,
   date_retour  DATE NOT NULL,
   num_etudiant INT(3) NOT NULL,
   num_livre SMALLINT UNSIGNED NOT NULL,
   PRIMARY KEY (IdPret),
   FOREIGN KEY (num_etudiant) REFERENCES Etudiant(Numero_etudiant),
   FOREIGN KEY (num_livre) REFERENCES Livre(IdLivre)
)
ENGINE=INNODB;


/*Insertion d'etudiant dans la table Etudiant*/

INSERT INTO Etudiant (Numero_etudiant,nom,prenom,date_naissance,mot_de_passe) 

VALUES (21859635,'Hilaire','Thibaut','1998-04-20','afevaefe7481'),
       (21748596,'Titone','Vincent','1999-06-14','1985fzfgazet7'),
       (27616896,'Duroc','Antoine','1995-08-07','ezuhrifi'),
       (27986497,'Dupond','Michel','1999-07-28','hfzieojf78'),
       (29954979,'Troubard','Sophie','1996-06-17','zigbjzrzif8754'),
       (27994949,'Maatoug','Mohamed','1994-09-22','aedddrfnr!'),
       (21989578,'Mezrag','Morad','1999-08-11','azcrjfi8879!?'),
       (28795962,'leclerc','Marion','1995-05-26','ahfienir95keoen!'),
       (27488851,'Deschamps','Clement','1991-08-08','mpmokfe84215'),
       (23698547,'Jaquet','Maryline','1993-01-03','poieljr9828zz!'),
       (21478956,'Sylvestre','Nils','1999-12-17','alsioebr8745ld'),
       (22587419,'Bodin','julie','1994-06-25',',zorjeibref8745'),
       (21463879,'Carre','Francois','1989-07-07','zzpkdzpad'),
       (24615972,'Bouvale','Sarah','2000-07-27','zigbjzrzif87efe'),
       (26849164,'Henni','Mohamed','1989-06-04','fydfkjhufrdc85!'),
       (21689764,'Familary','Cassandre','1998-09-18','zigbjzrziffnsfj4'),
       (21894659,'Meyer','Felix','1999-03-14','ggdetdtyreze'),
       (22467997,'Tardif','Theo','2000-08-01','hitreesuutrd'),
       (21163789,'Bulle','Audrey','1995-11-16','gut7854khug'),
       (28784971,'Mignon','Mathilde','2000-01-29','uttdtftyy87495'),
       (21973648,'Vlaad','Eric','1998-09-24','ftesseftgh87954'),
       (21739287,'Latour','Daniel','1994-04-28','hiuyreesdfy7485ok'),
       (23579514,'Paul','Amandine','1999-04-23','nbjughi875p'),
       (21169667,'Abeillon','Justine','1997-02-13','iytuyfyg7995k'),
       (24785296,'Admon','Florian','1994-06-07','azersfgm925okj'),
       (25589663,'Roqueduc','Stephanie','199-08-17','oiuyièur-urty84'),
       (28457518,'Simmat','Damien','1998-08-28','zryyoiyotio7894'),
       (29865481,'Kingue','Jonathan','1990-09-01','ml!nueiebdiz721'),
       (27369419,'Hubert','Florian','1996-07-07','awesolpej846prle!'),
       (27995841,'Pruvost','Nils','1994-06-09','apkcdofrjirj845926'),
       (21234578,'Esteves','Anthony','1997-05-18','kkeijfjfrpz927!'),
       (27894561,'Lebeau','Aurelie','1993-08-17','anezojfjrf9856217fr'),
       (27395824,'Jouanno','Cathy','2000-08-10','vbjbgierqjfaroat87512'),
       (29517536,'Da Costa','Pedro','1992-12-30','etjpzkyrho!!kebnsgf'),
       (23146977,'Duhamel','Maeva','1990-06-08','fiehfhcoslpfzeu729585!!');
       
       
/*insertion du personnel de la bibliothèque  dans la table Personnel*/

INSERT INTO Personnel(IdPersonnel,nom,prenom,date_naissance,mot_de_passe) 

VALUES (19735268,'Franklin','Bernard','1969-02-14','Angrsdforr7594212jl'),
       (17246859,'Curve','Brigitte','1978-04-21','acpnsfef4837rgfoz1'),
       (15428763,'Vaquet','Francoise','1971-11-22','npawinrvt718ehe93!'),
       (17392846,'Bouazza','Malika','1970-08-07','1569827ddsdqf71'),
       (17986497,'Nicouleau','Julien','1975-03-30','vjnwl718nhgd'),
       (19954979,'Lecargot','Pauline','1980-02-27','wxcolnrziza71!8471!4'),
       (17994949,'Duripot','Suzanne','1972-05-22','qfhaeif1758'),
       (11989578,'Lefort','Sylvie','1967-04-11','ckzkngforz7155524'),
       (18795962,'Doudriche','Michel','1976-08-15','npbivuyxetsa!'),
       (17488851,'Pouliquenne','Cassandra','1979-06-07','nvoezifzfqjdoa');

/*insertion des editions dans la table Edition*/ 
  
INSERT INTO Edition(IdEdition,nom_edition) 

VALUES (1,'Montréal : Presses de l Université de Montréal'),
       (2,'Paris : CNRS Éditions'),
       (3,'Louvain-la-Neuve : De Boeck'),
       (4,'Paris : Nathan'),
       (5,'Bruxelles : De Boeck'),
       (6,'Paris : Vuibert'),
       (7,'Paris : Belin'),
       (8,'Albin Michel'),
       (9,'Calmann-Lévy'),
       (10,'Armand Colin'),
       (11,'Arthème Fayard'),
       (12,'Bordas'),
       (13,'Delagrave'),
       (14,'Denoël'),                                                      
       (15,'du Chêne'),
       (16,'Grasset'),
       (17,'Odile Jacob'),
       (18,'Paris : Hachette éducation ; 2001'),
       (19,'Jean-Claude Lattès'),
       (20,'Le Dauphiné'),
       (21,'Harmattan'),
       (22,'Massin'),
       (23,'Michel Lafon'),
       (24,'Édilarge'),
       (25,'Perrin'),
       (26,'Privat');
       
      
/*insertion des auteurs des livres dans la table Auteur*/
     
INSERT INTO Auteur(IdAuteur,nom,prenom,date_naissance) 

VALUES (1,'Bouillard','Jean-Claude','1970-04-27'),
       (2,'Catsaros','Catherine','1963-12-04'),
       (3,'Mayet','Frederic','1978-10-22'),
       (4,'Perilleux','Eric','1970-11-17'),
       (5,'Raven','Peter Hamilton','1965-05-12'),
       (6,'Reix','Robert','1974-04-16'),
       (7,'Dars','Jean','1968-06-15'),
       (8,'Oaks','philibert','1958-11-10'),
       (9,'Laplace','Edouard','1962-04-15'),
       (10,'Lecointre','Guillaume','1964-08-23'),
       (11,'Planche','Alexandre','1971-01-02'),
       (12,'Tisseron','Serge','1964-07-24'),
       (13,'Gochet','Paul','1960-03-03'),
       (14,'Guerrain','Sylvestre','1963-06-09'),
       (15,'Lowered','Edwin','1973-06-22'),
       (16,'Verined','Salomon','1954-11-17'),
       (17,'Rovendold','Rudolf','1949-04-15'),
       (18,'Rifflerin','Akrami','1968-10-29'),
       (19,'Emannuelle','Michel','1961-12-17'),
       (20,'Anatole','Frank','1968-02-27'),
       (21,'Prevert','Jean','1965-05-03'),
       (22,'Frattalone','Patrick','1972-03-20'),
       (23,'Vauchet','Marius','1965-05-03'),
       (24,'Raudifont','Martin','1963-01-10'),
       (25,'Pinoplet','Pierre-Marie','1974-11-29'),
       (26,'Tuillier','Stephane','1959-06-19');
       
/*insertion des livres dans la table Livre.
comme j'ai expliqué ci-dessus nous pouvons avoir plusieurs exemplaire d'un meme livre mais sous un code barre differents*/   

INSERT INTO Livre(IdLivre,titre,cote,code_barre,num_personnel,num_auteur,num_edition,discipline,prix) 

VALUES (1,'Equations aux dérivées partielles','515.35 BOU','1873256984741',19735268,1,1,'mathematiques',45),
       (2,'Equations aux dérivées partielles','515.35 BOU','5736289741822',19735268,1,1,'mathematiques',45),
       (3,'Les minéraux : sciences et collections','549 CAT','1796582431817',17246859,2,2,'Svt',52),
       (4,'Les minéraux : sciences et collections','549 CAT','4862975315784',17246859,2,2,'Svt',52),
       (5,'Physique nucléaire appliquée : cours et exercices corrigés','539.7 MAY','7596824314857',15428763,3,3,'Physique',64),
       (6,'Physique nucléaire appliquée : cours et exercices corrigés','539.7 MAY','9936852748512',15428763,3,3,'Physique',64),
       (7,'Biochimie génétique, biologie moléculaire','572.8 PER','9175823648124',17392846,4,4,'biologie',60),
       (8,'Biochimie génétique, biologie moléculaire','572.8 PER','7396582147852',17392846,4,4,'biologie',60),
       (9,'Biologie végétale','581 RAV','6704985221879',17392846,5,5,'biologie',60),
       (10,'Biologie végétale','581 RAV','736626596214',17392846,5,5,'biologie',60),
       (11,'Systèmes d information et management des organisations','658 REI','1978409867182',17986497,6,6,'informatique',48),
       (12,'Systèmes d information et management des organisations','658 REI','7369269514582',17986497,6,6,'informatique',48),
       (13,'Les déchiffreurs : voyage en mathématiques','510.9 DAR','462539852147',19735268,7,7,'mathematiques',39),
       (14,'Les déchiffreurs : voyage en mathématiques','510.9 DAR','475996231785',19735268,7,7,'mathematiques',39),
       (15,'Simplifying equations in Arabic algebra','510.9 OAK','1872596325894',18795962,8,8,'mathematiques',60),
       (16,'Simplifying equations in Arabic algebra','510.9 OAK','7592631485296',18795962,8,8,'mathematiques',60),
       (17,'École normale de an III, Leçons de mathématiques','487.6 LAP','7185962348512',17994949,9,9,'mathematiques',75),
       (18,'École normale de an III, Leçons de mathématiques','487.6 LAP','1758296358412',17994949,9,9,'mathematiques',75),
       (19,'Classification phylogénétique du vivant. Tome 1','576.8 LEC','1875926533257',17246859,10,10,'biologie',63),
       (20,'Classification phylogénétique du vivant. Tome 1','576.8 LEC','7186923548192',17246859,10,10,'biologie',63),
       (21,'La sécurité informatique en mode projet','574.8 PLA','1795264813748',19735268,11,11,'informatique',58),
       (22,'La sécurité informatique en mode projet','574.8 PLA','7396852147558',19735268,11,11,'informatique',58),
       (23,'Du livre à écran : indispensable complémentarité','576.8 TIS','4859621758296',11989578,12,12,'informatique',32),
       (24,'Du livre à écran : indispensable complémentarité','576.8 TIS','1125556329847',11989578,12,12,'informatique',32),
       (25,'Du livre à écran : indispensable complémentarité','576.8 TIS','4865972135974',11989578,12,12,'informatique',32),
       (26,'Du livre à écran : indispensable complémentarité','576.8 TIS','8888558441895',11989578,12,12,'informatique',32),
       (27,'Logique. volume 1. Méthodes pour informatique fondamentale','511.3 GOC','1758299968555',15428763,13,13,'informatique',44),
       (28,'Logique. volume 1. Méthodes pour informatique fondamentale','511.3 GOC','7485122569221',15428763,13,13,'informatique',44),
       (29,'Logique. volume 1. Méthodes pour informatique fondamentale','511.3 GOC','4859125785199',15428763,13,13,'informatique',44),
       (30,'Logique. volume 1. Méthodes pour informatique fondamentale','511.3 GOC','1758296348124',15428763,13,13,'informatique',44),
       (31,'Logique. volume 1. Méthodes pour informatique fondamentale','511.3 GOC','1748592395854',15428763,13,13,'informatique',44),
       (32,'Sécurité informatique et réseaux : cours+exos','511.3 GER','1254584552623',18795962,14,14,'informatique',59),
       (33,'Sécurité informatique et réseaux : cours+exos','511.3 GER','4987778485748',18795962,14,14,'informatique',59),
       (34,'Sécurité informatique et réseaux : cours+exos','511.3 GER','4682971582699',18795962,14,14,'informatique',59),
       (35,'Sécurité informatique et réseaux : cours+exos','511.3 GER','2874945963289',18795962,14,14,'informatique',59),
       (36,'Le beau livre de la chimie : de la poudre à canon','540.3 LOW','5748158156958',11989578,15,15,'chimie',67),
       (37,'Le beau livre de la chimie : de la poudre à canon','540.3 LOW','1777485847514',11989578,15,15,'chimie',67),
       (38,'Le beau livre de la chimie : de la poudre à canon','540.3 LOW','1233214525142',11989578,15,15,'chimie',67),
       (39,'Le beau livre de la chimie : de la poudre à canon','540.3 LOW','1452626535214',11989578,15,15,'chimie',67),
       (40,'sciences de ingenieurs Licence 1','140.8 VER','1758496231479',17488851,16,16,'sciences de ingenieurs',55),
       (41,'sciences de ingenieurs Licence 1','140.8 VER','1448569528512',17488851,16,16,'sciences de ingenieurs',55),
       (42,'mecanique du point','352.8 ROV','7956646284514',15428763,17,17,'mecanique',68),
       (43,'mecanique du point','352.8 ROV','3588878415815',15428763,17,17,'mecanique',68),
       (44,'mecanique du point','352.8 ROV','8548125426929',15428763,17,17,'mecanique',68),
       (45,'mecanique du point','352.8 ROV','4656326591817',15428763,17,17,'mecanique',68),
       (46,'mecanique du point','352.8 ROV','6974579687975',15428763,17,17,'mecanique',68),
       (47,'mecanique du point','352.8 ROV','4879656899898',15428763,17,17,'mecanique',68),
       (48,'thermodynamique et lois gaz parfaits','845.7 RIF','7968565464562',18795962,18,18,'physique',51),
       (49,'thermodynamique et lois gaz parfaits','845.7 RIF','1748559296148',18795962,18,18,'physique',51),
       (50,'thermodynamique et lois gaz parfaits','845.7 RIF','4956597574829',18795962,18,18,'physique',51),
       (51,'integration par partie volume 4','958.1 EMA','1796598489562',17246859,19,19,'mathematiques',49),
       (52,'optique ondulatoire','528.4 ANA','6545864866485',17986497,20,20,'physique',50),
       (53,'optique ondulatoire','528.4 ANA','3456468987464',17986497,20,20,'physique',50),
       (54,'architecture des ordinateurs ','533.4 PRE','1758264851253',17994949,21,21,'informatique',51),
       (55,'architecture des ordinateurs ','533.4 PRE','1485965214758',17994949,21,21,'informatique',51),
       (56,'architecture des ordinateurs ','533.4 PRE','7986416794965',17994949,21,21,'informatique',51),
       (57,'architecture des ordinateurs ','533.4 PRE','4989651387985',17994949,21,21,'informatique',51),
       (58,'architecture des ordinateurs ','533.4 PRE','4185595862398',17994949,21,21,'informatique',51),
       (59,'architecture des ordinateurs ','533.4 PRE','8565635342465',17994949,21,21,'informatique',51),
       (60,'chimie organique','295.85 FRA','1749623518755',17488851,22,22,'chimie',68),
       (61,'chimie organique','295.85 FRA','1659765989846',17488851,22,22,'chimie',68),
       (62,'chimie organique','295.85 FRA','8487949648797',17488851,22,22,'chimie',68),
       (63,'chimie organique','295.85 FRA','4649749467947',17488851,22,22,'chimie',68),
       (64,'chimie organique','295.85 FRA','7946569999994',17488851,22,22,'chimie',68),
       (65,'la biodiversité','174.54 VAU','1652485422957',11989578,23,23,'svt',63),
       (66,'la biodiversité','174.54 VAU','4979449864916',11989578,23,23,'svt',63),
       (67,'la biodiversité','174.54 VAU','4498658879744',11989578,23,23,'svt',63),
       (68,'la biodiversité','174.54 VAU','4979564948155',11989578,23,23,'svt',63),
       (69,'la biodiversité','174.54 VAU','8874544464974',11989578,23,23,'svt',63),
       (70,'la biodiversité','174.54 VAU','4784152645823',11989578,23,23,'svt',63),
       (71,'la biodiversité','174.54 VAU','1748592152151',11989578,23,23,'svt',63),
       (72,'la biodiversité','174.54 VAU','1856235498748',11989578,23,23,'svt',63),
       (73,'la biodiversité','174.54 VAU','1748595663251',11989578,23,23,'svt',63),
       (74,'équations differentielles','451 RAU','1458715884575',17392846,24,24,'Mathematiques',78),
       (75,'équations differentielles','451 RAU','1845959599269',17392846,24,24,'Mathematiques',78),
       (76,'équations differentielles','451 RAU','4851558499595',17392846,24,24,'Mathematiques',78),
       (77,'équations differentielles','451 RAU','1748466858549',17392846,24,24,'Mathematiques',78),
       (78,'équations differentielles','451 RAU','5884899955887',17392846,24,24,'Mathematiques',78),
       (79,'équations differentielles','451 RAU','4745915954866',17392846,24,24,'Mathematiques',78),
       (80,'équations differentielles','451 RAU','8526515875582',17392846,24,24,'Mathematiques',78),
       (81,'optique ondulatoire','857.71 PIN','48516274152012',17246859,25,25,'physique',54),
       (82,'optique ondulatoire','857.71 PIN','65281759529522',17246859,25,25,'physique',54),
       (83,'optique ondulatoire','857.71 PIN','78541525954895',17246859,25,25,'physique',54),
       (84,'optique ondulatoire','857.71 PIN','78541525954895',17246859,25,25,'physique',54),
       (85,'cinématique','174.54 TUI','1748559541827',15428763,26,26,'physique',53),
       (86,'cinématique','174.54 TUI','5879495741558',15428763,26,26,'physique',53),
       (87,'cinématique','174.54 TUI','7845544874248',15428763,26,26,'physique',53),
       (88,'cinématique','174.54 TUI','4059808798844',15428763,26,26,'physique',53),
       (89,'cinématique','174.54 TUI','9989548785889',15428763,26,26,'physique',53);
       
       
       
/*insertion de  tout les prets effectuer dans la bibliotheque dans la table Pret*/      
 
INSERT INTO Pret(IdPret,date_pret,date_retour,num_etudiant,num_livre) 

VALUES (1,'2018-10-14','2018-12-23',29954979,4),
       (2,'2018-11-09','2018-01-17',21859635,9),
       (3,'2018-11-28','2018-01-22',27994949,5),
       (4,'2018-10-24','2018-12-15',21463879,35),
       (5,'2018-10-22','2018-12-26',22587419,17),
       (6,'2018-07-01','2018-09-13',29517536,42),
       (7,'2018-09-05','2018-11-14',27894561,12),
       (8,'2018-12-06','2018-02-28',21234578,27),
       (9,'2018-10-04','2018-12-27',29865481,21),
       (10,'2018-10-08','2018-12-19',24785296,1),
       (11,'2018-08-17','2018-10-13',28457518,4),
       (12,'2018-10-27','2018-12-08',26849164,27),
       (13,'2018-06-21','2018-09-28',27994949,6),
       (14,'2018-11-15','2018-01-02',27894561,35),
       (15,'2018-10-12','2018-12-16',21689764,31),
       (16,'2018-07-11','2018-09-19',21169667,22),
       (17,'2018-09-15','2018-11-24',24785296,15),
       (18,'2018-12-16','2018-02-18',21234578,46),
       (19,'2018-10-14','2018-01-07',23146977,21),
       (20,'2018-10-18','2018-01-08',27369419,1),
       (21,'2018-09-09','2018-12-14',24785296,1),
       (22,'2018-09-14','2018-11-25',28457518,4),
       (23,'2018-10-17','2018-12-18',21478956,64),
       (24,'2018-06-11','2018-09-24',22587419,14),
       (25,'2018-11-05','2018-01-22',24615972,18),
       (26,'2018-10-02','2018-12-06',21689764,22),
       (27,'2018-07-01','2018-09-29',22467997,26),
       (28,'2018-09-25','2018-11-14',24785296,34),
       (29,'2018-12-06','2018-02-23',21973648,25),
       (30,'2018-10-24','2018-01-17',21169667,74),
       (31,'2018-10-08','2018-01-08',25589663,80),
       (32,'2018-10-28','2018-12-29',28457518,1),
       (33,'2018-08-27','2018-10-23',28457518,4),
       (34,'2018-10-17','2018-12-18',26849164,56),
       (35,'2018-06-01','2018-09-18',29865481,63),
       (36,'2018-11-25','2018-01-21',27894561,72),
       (37,'2018-10-22','2018-12-26',21689764,81),
       (38,'2018-07-11','2018-09-29',21169667,49),
       (39,'2018-09-25','2018-11-14',24785296,36),
       (40,'2018-12-06','2018-02-28',21234578,32),
       (41,'2018-10-24','2018-01-17',23146977,44),
       (42,'2018-10-28','2018-01-18',29517536,1),
       (43,'2018-10-18','2018-12-09',24785296,41),
       (44,'2018-08-27','2018-10-23',28457518,4),
       (45,'2018-10-17','2018-12-18',27994949,17),
       (46,'2018-06-11','2018-09-18',29954979,26),
       (47,'2018-11-25','2018-01-22',22587419,35),
       (48,'2018-10-22','2018-12-26',21689764,31),
       (49,'2018-07-21','2018-09-09',21478956,22),
       (50,'2018-09-25','2018-11-14',24785296,15),
       (51,'2018-12-26','2018-02-28',21234578,46),
       (52,'2018-10-24','2018-01-17',23146977,21),
       (53,'2018-10-28','2018-01-18',27369419,1),
       (54,'2018-10-18','2018-12-29',26849164,1),
       (55,'2018-08-27','2018-10-23',28457518,4),
       (56,'2018-10-24','2018-12-18',26849164,24),
       (57,'2018-06-11','2018-09-18',27994949,6),
       (58,'2018-11-16','2018-01-22',27894561,46),
       (59,'2018-10-21','2018-12-06',21689764,77),
       (60,'2018-07-21','2018-09-29',21169667,32),
       (61,'2018-09-05','2018-11-14',24785296,27),
       (62,'2018-12-26','2018-02-28',21234578,17),
       (63,'2018-10-04','2018-01-17',23146977,43),
       (64,'2018-10-28','2018-01-18',27369419,14);
       
       

/*Cette vue permet de nous dire les livres qui sont actuellement emprunter*/

CREATE VIEW V_Livre_en_pret
AS SELECT Etudiant.Numero_etudiant,Etudiant.nom AS nom_etudiant,Etudiant.prenom AS prenom_etudiant,
Livre.IdLivre,Livre.titre,Livre.cote,Livre.code_barre,Auteur.nom AS nom_auteur,Edition.nom_edition,Livre.discipline
FROM Livre,Auteur,Edition,Pret,Etudiant
WHERE Pret.num_etudiant=Etudiant.Numero_etudiant  AND Pret.num_livre=Livre.IdLivre AND Livre.num_auteur=Auteur.IdAuteur 
AND Livre.num_edition=Edition.IdEdition AND Pret.date_retour>CURRENT_DATE;


/*Cette vue nous informe des livres qui sont actuellement disponibles*/

CREATE VIEW V_Livre_disponible
AS SELECT Livre.IdLivre,Livre.titre,Livre.cote,Livre.code_barre,Auteur.nom AS nom_auteur,Edition.nom_edition,Livre.discipline
FROM Livre,Edition,Auteur
WHERE Livre.num_auteur=Auteur.IdAuteur AND Livre.num_edition=Edition.IdEdition AND Livre.IdLivre NOT IN (SELECT V_Livre_en_pret.IdLivre
FROM V_Livre_en_pret );

/*cette vue nous indique le nombre de fois ou chaque livre qui figure dans historique de pret a été emprunter.
Nous ferrons pas la difference entre  2 exemplaires d'un meme livre dans cette vue car il s'agit du meme livre en soit.
Ainsi si par exemple 2 exemplaires d'un  livre figurent dans la table pret notre vue nous indiquera que le livre a été emprunter 2 fois*/

CREATE VIEW V_frequence_livre_emprunter
AS SELECT Livre.titre,Livre.cote,Auteur.nom AS nom_auteur,Edition.nom_edition,Livre.discipline,
COUNT(Livre.IdLivre) AS nombre_de_fois_emprunter
FROM Livre,Edition,Pret,Auteur
WHERE Pret.num_livre=Livre.IdLivre AND Livre.num_edition=Edition.IdEdition AND Livre.num_auteur=Auteur.IdAuteur
GROUP BY Livre.titre;



-- Creation des utilisateurs
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'bibliotheque';
GRANT ALL ON 
Bibliotheque.edition
TO 'admin'@'localhost';
-- Table Auteur
GRANT ALL ON 
Bibliotheque.auteur
TO 'admin'@'localhost';
-- Table Etudiant
GRANT SELECT (Numero_etudiant,nom,prenom,date_naissance),
      DELETE 
ON Bibliotheque.Etudiant
To 'admin'@'localhost';
-- Table Pret
GRANT ALL 
ON Bibliotheque.Pret
To 'admin'@'localhost';
-- Table Personnel
GRANT SELECT(nom,prenom,date_naissance)
ON Bibliotheque.Personnel
TO 'admin'@'localhost';
-- Table Livre
GRANT ALL 
ON Bibliotheque.Livre
TO 'admin'@'localhost';

-- Utilisateur Etudiant
CREATE USER 'etudiant'@'localhost' IDENTIFIED BY 'livre';
-- Table etudiant
GRANT SELECT (Numero_etudiant,nom,prenom,date_naissance,mot_de_passe),
      UPDATE (mot_de_passe)
ON Bibliotheque.Etudiant
TO 'etudiant'@'localhost';      
-- Table Auteur
GRANT SELECT 
ON Bibliotheque.Auteur
TO 'etudiant'@'localhost';

-- Table Edition
GRANT SELECT 
ON Bibliotheque.Edition
TO 'etudiant'@'localhost';

-- Table Pret
GRANT SELECT,INSERT
ON Bibliotheque.Pret
TO 'etudiant'@'localhost';

-- Table Livre
GRANT SELECT 
ON Bibliotheque.Livre
TO 'etudiant'@'localhost'; 

-- Table Personnel
GRANT SELECT(nom,prenom,date_naissance)
ON Bibliotheque.Personnel
TO 'etudiant'@'localhost';
