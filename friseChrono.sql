DROP DATABASE IF EXISTS FriseChrono;
CREATE DATABASE FriseChrono;
USE FriseChrono;
SET lc_time_names='fr_FR';

CREATE TABLE IF NOT EXISTS Parcours (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	date_debut DATE NOT NULL,
	date_fin DATE,
	nom_parcours VARCHAR(100) NOT NULL,
	lieu VARCHAR(50) NOT NULL,
	intitule VARCHAR(250) NOT NULL,
	type_parcours VARCHAR(5) NOT NULL,
	PRIMARY KEY (id))
	Engine=InnoDB DEFAULT CHARSET=utf8;
	
CREATE TABLE IF NOT EXISTS Realisation (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	description TEXT NOT NULL,
	PRIMARY KEY (id))
	engine=innodb DEFAULT CHARSET=utf8;
	
CREATE TABLE IF NOT EXISTS Realise (
	id_parcours SMALLINT UNSIGNED NOT NULL,
	id_realisation SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (id_parcours, id_realisation))
	engine=innodb DEFAULT CHARSET=utf8;
	
ALTER TABLE Realise
ADD CONSTRAINT fk_parcours_id FOREIGN KEY (id_parcours) REFERENCES Parcours(id);

ALTER TABLE Realise
ADD CONSTRAINT fk_realisation_id FOREIGN KEY (id_realisation) REFERENCES Realisation(id);
-- dates dans le style yyyy-mm-dd (à vérifier)
INSERT INTO Parcours VALUES
	(NULL, '1987-09-01', '1990-06-30','Lycée','Bonneville(74) puis Blanquefort(33)','seconde générale, première S puis Terminale S','perso'),	
	(NULL, '1990-09-01', '1991-06-30','Classe Préparatoire','Bordeaux(33)','Math Sup','perso'),
	(NULL, '1991-09-01', '1995-06-30','Ecole des Mines d''Alès','Alès(30)','Ecole d''ingénieur généraliste, option Environnement Industriel','perso'),
	(NULL, '1996-01-01', '1996-03-30','Bertin','Trappes ()','Chargée d''études : ventilation dans les tunnels routiers','pro'),
	(NULL, '1996-04-01', '1999-12-30','CRCI Bourgogne','Dijon (21)','Chargée de mission : accompagnement des entreprises à la mise en place de système de management environnemental','pro'),
	(NULL, '1999-09-29', NULL,'Hugo','Clermont-Ferrand(63)','Naissance','perso'),
	(NULL, '2000-01-01', '2002-08-30','Angleterre','Stock-on-Trent','Expatriation','perso'),
	(NULL, '2001-10-01', '2002-08-30','Keele University','Keele','Master of Sciences in IT avec stage chez Sumitomo Electrics','perso'),
	(NULL, '2002-09-01', '2005-08-30','Clermont-Ferrand','Clermont-Ferrand(63)','Retour et installation familiale','perso'),
	(NULL, '2003-10-30', NULL,'Guilhem','Beaumont (63)','Naissance','perso'),
	(NULL, '2004-10-01', '2006-05-30','Declic Laureat','Clermont-Ferrand (63) puis Chateau-Gontier(53)','Accompagnement à domicile des clients informatiques de Connexion : formation à l''utilisation de leur nouvel ordinateur. \n Suivi d''un jeune sportif de haut niveau descolarisé  BEP Ventes','pro'),
	(NULL, '2005-09-01', '2006-08-30','Quelaines','Quelaines Saint Gault (53)','installation familiale','perso'),
	(NULL, '2006-09-01', '2013-12-30','Greta 53','Laval (53)','Formatrice en mathématiques, Sciences Physiques, Bureautique, Apprentissage et animatrice qualité','pro'),
	(NULL, '2008-09-15', NULL,'Saxophone','Cossé-le-vivien (53)','Apprentissage du saxophone et participation à plusieurs ensembles dont l''Orchestre d''Harmonie de Laval','perso'),
	(NULL, '2013-01-22', '2015-08-30','Micro Lycée Laval','Laval (53)','Coordination, animation, tutorat et cours de Maths pour les raccrocheurs en terminale tous bacs','pro')
	;
	