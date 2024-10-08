CREATE SCHEMA periodic_table;

CREATE TABLE periodic_table.periodic_table (
    atomic_number integer NOT NULL,
    element_name text,
    symbol text,
    atomic_mass numeric,
    number_of_neutrons integer,
    number_of_protons integer,
    number_of_electrons integer,
    period_number integer,
    phase text,
    naturally_occurring boolean,
    element_type text,
    PRIMARY KEY (atomic_number)
);

INSERT INTO periodic_table.periodic_table VALUES (1,'Hydrogen','H',1.007,0,1,1,1,'gas',true,'Nonmetal');

INSERT INTO periodic_table.periodic_table VALUES (2,'Helium','He',4.002,2,2,2,1,'gas',true,'NobleGas'),
(3,'Lithium','Li',6.941,4,3,3,2,'solid',true,'AlkaliMetal'),
(4,'Beryllium','Be',9.012,5,4,4,2,'solid',true,'AlkalineEarthMetal'),
(5,'Boron','B',10.811,6,5,5,2,'solid',true,'Metalloid'),
(6,'Carbon','C',12.011,6,6,6,2,'solid',true,'Nonmetal'),
(7,'Nitrogen','N',14.007,7,7,7,2,'gas',true,'Nonmetal'),
(8,'Oxygen','O',15.999,8,8,8,2,'gas',true,'Nonmetal'),
(9,'Fluorine','F',18.998,10,9,9,2,'gas',true,'Halogen'),
(10,'Neon','Ne',20.18,10,10,10,2,'gas',true,'NobleGas');

INSERT INTO periodic_table.periodic_table VALUES 
(11,'Sodium','Na',22.99,12,11,11,3,'solid',true,'AlkaliMetal'),
(12,'Magnesium','Mg',24.305,12,12,12,3,'solid',true,'AlkalineEarthMetal'),
(13,'Aluminum','Al',26.982,14,13,13,3,'solid',true,'Metal'),
(14,'Silicon','Si',28.086,14,14,14,3,'solid',true,'Metalloid'),
(15,'Phosphorus','P',30.974,16,15,15,3,'solid',true,'Nonmetal'),
(16,'Sulfur','S',32.065,16,16,16,3,'solid',true,'Nonmetal'),
(17,'Chlorine','Cl',35.453,18,17,17,3,'gas',true,'Halogen'),
(18,'Argon','Ar',39.948,22,18,18,3,'gas',true,'NobleGas'),
(19,'Potassium','K',39.098,20,19,19,4,'solid',true,'AlkaliMetal'),
(20,'Calcium','Ca',40.078,20,20,20,4,'solid',true,'AlkalineEarthMetal'),
(21,'Scandium','Sc',44.956,24,21,21,4,'solid',true,'TransitionMetal'),
(22,'Titanium','Ti',47.867,26,22,22,4,'solid',true,'TransitionMetal'),
(23,'Vanadium','V',50.942,28,23,23,4,'solid',true,'TransitionMetal'),
(24,'Chromium','Cr',51.996,28,24,24,4,'solid',true,'TransitionMetal'),
(25,'Manganese','Mn',54.938,30,25,25,4,'solid',true,'TransitionMetal'),
(26,'Iron','Fe',55.845,30,26,26,4,'solid',true,'TransitionMetal'),
(27,'Cobalt','Co',58.933,32,27,27,4,'solid',true,'TransitionMetal'),
(28,'Nickel','Ni',58.693,31,28,28,4,'solid',true,'TransitionMetal'),
(29,'Copper','Cu',63.546,35,29,29,4,'solid',true,'TransitionMetal'),
(30,'Zinc','Zn',65.38,35,30,30,4,'solid',true,'TransitionMetal'),
(31,'Gallium','Ga',69.723,39,31,31,4,'solid',true,'Metal'),
(32,'Germanium','Ge',72.64,41,32,32,4,'solid',true,'Metalloid'),
(33,'Arsenic','As',74.922,42,33,33,4,'solid',true,'Metalloid'),
(34,'Selenium','Se',78.96,45,34,34,4,'solid',true,'Nonmetal'),
(35,'Bromine','Br',79.904,45,35,35,4,'liq',true,'Halogen'),
(36,'Krypton','Kr',83.798,48,36,36,4,'gas',true,'NobleGas'),
(37,'Rubidium','Rb',85.468,48,37,37,5,'solid',true,'AlkaliMetal'),
(38,'Strontium','Sr',87.62,50,38,38,5,'solid',true,'AlkalineEarthMetal'),
(39,'Yttrium','Y',88.906,50,39,39,5,'solid',true,'TransitionMetal'),
(40,'Zirconium','Zr',91.224,51,40,40,5,'solid',true,'TransitionMetal'),
(41,'Niobium','Nb',92.906,52,41,41,5,'solid',true,'TransitionMetal'),
(42,'Molybdenum','Mo',95.96,54,42,42,5,'solid',true,'TransitionMetal'),
(43,'Technetium','Tc',98,55,43,43,5,'artificial',false,'TransitionMetal'),
(44,'Ruthenium','Ru',101.07,57,44,44,5,'solid',true,'TransitionMetal'),
(45,'Rhodium','Rh',102.906,58,45,45,5,'solid',true,'TransitionMetal'),
(46,'Palladium','Pd',106.42,60,46,46,5,'solid',true,'TransitionMetal'),
(47,'Silver','Ag',107.868,61,47,47,5,'solid',true,'TransitionMetal'),
(48,'Cadmium','Cd',112.411,64,48,48,5,'solid',true,'TransitionMetal'),
(49,'Indium','In',114.818,66,49,49,5,'solid',true,'Metal'),
(50,'Tin','Sn',118.71,69,50,50,5,'solid',true,'Metal'),
(51,'Antimony','Sb',121.76,71,51,51,5,'solid',true,'Metalloid'),
(52,'Tellurium','Te',127.6,76,52,52,5,'solid',true,'Metalloid'),
(53,'Iodine','I',126.904,74,53,53,5,'solid',true,'Halogen'),
(54,'Xenon','Xe',131.293,77,54,54,5,'gas',true,'NobleGas'),
(55,'Cesium','Cs',132.905,78,55,55,6,'solid',true,'AlkaliMetal'),
(56,'Barium','Ba',137.327,81,56,56,6,'solid',true,'AlkalineEarthMetal'),
(57,'Lanthanum','La',138.905,82,57,57,6,'solid',true,'Lanthanide'),
(58,'Cerium','Ce',140.116,82,58,58,6,'solid',true,'Lanthanide'),
(59,'Praseodymium','Pr',140.908,82,59,59,6,'solid',true,'Lanthanide'),
(60,'Neodymium','Nd',144.242,84,60,60,6,'solid',true,'Lanthanide'),
(61,'Promethium','Pm',145,84,61,61,6,'artificial',false,'Lanthanide'),
(62,'Samarium','Sm',150.36,88,62,62,6,'solid',true,'Lanthanide'),
(63,'Europium','Eu',151.964,89,63,63,6,'solid',true,'Lanthanide'),
(64,'Gadolinium','Gd',157.25,93,64,64,6,'solid',true,'Lanthanide'),
(65,'Terbium','Tb',158.925,94,65,65,6,'solid',true,'Lanthanide'),
(66,'Dysprosium','Dy',162.5,97,66,66,6,'solid',true,'Lanthanide'),
(67,'Holmium','Ho',164.93,98,67,67,6,'solid',true,'Lanthanide'),
(68,'Erbium','Er',167.259,99,68,68,6,'solid',true,'Lanthanide'),
(69,'Thulium','Tm',168.934,100,69,69,6,'solid',true,'Lanthanide'),
(70,'Ytterbium','Yb',173.054,103,70,70,6,'solid',true,'Lanthanide'),
(71,'Lutetium','Lu',174.967,104,71,71,6,'solid',true,'Lanthanide'),
(72,'Hafnium','Hf',178.49,106,72,72,6,'solid',true,'TransitionMetal'),
(73,'Tantalum','Ta',180.948,108,73,73,6,'solid',true,'TransitionMetal'),
(74,'Tungsten','W',183.84,110,74,74,6,'solid',true,'TransitionMetal'),
(75,'Rhenium','Re',186.207,111,75,75,6,'solid',true,'TransitionMetal'),
(76,'Osmium','Os',190.23,114,76,76,6,'solid',true,'TransitionMetal'),
(77,'Iridium','Ir',192.217,115,77,77,6,'solid',true,'TransitionMetal'),
(78,'Platinum','Pt',195.084,117,78,78,6,'solid',true,'TransitionMetal'),
(79,'Gold','Au',196.967,118,79,79,6,'solid',true,'TransitionMetal'),
(80,'Mercury','Hg',200.59,121,80,80,6,'liq',true,'TransitionMetal'),
(81,'Thallium','Tl',204.383,123,81,81,6,'solid',true,'Metal'),
(82,'Lead','Pb',207.2,125,82,82,6,'solid',true,'Metal'),
(83,'Bismuth','Bi',208.98,126,83,83,6,'solid',true,'Metal'),
(84,'Polonium','Po',210,126,84,84,6,'solid',true,'Metalloid'),
(85,'Astatine','At',210,125,85,85,6,'solid',true,'Halogen'),
(86,'Radon','Rn',222,136,86,86,6,'gas',true,'NobleGas'),
(87,'Francium','Fr',223,136,87,87,7,'solid',true,'AlkalineMetal'),
(88,'Radium','Ra',226,138,88,88,7,'solid',true,'AlkalineEarthMetal'),
(89,'Actinium','Ac',227,138,89,89,7,'solid',true,'Actinide'),
(90,'Thorium','Th',232.038,142,90,90,7,'solid',true,'Actinide'),
(91,'Protactinium','Pa',231.036,140,91,91,7,'solid',true,'Actinide'),
(92,'Uranium','U',238.029,146,92,92,7,'solid',true,'Actinide'),
(93,'Neptunium','Np',237,144,93,93,7,'artificial',false,'Actinide'),
(94,'Plutonium','Pu',244,150,94,94,7,'artificial',false,'Actinide'),
(95,'Americium','Am',243,148,95,95,7,'artificial',false,'Actinide'),
(96,'Curium','Cm',247,151,96,96,7,'artificial',false,'Actinide'),
(97,'Berkelium','Bk',247,150,97,97,7,'artificial',false,'Actinide'),
(98,'Californium','Cf',251,153,98,98,7,'artificial',false,'Actinide'),
(99,'Einsteinium','Es',252,153,99,99,7,'artificial',false,'Actinide'),
(100,'Fermium','Fm',257,157,100,100,7,'artificial',false,'Actinide'),
(101,'Mendelevium','Md',258,157,101,101,7,'artificial',false,'Actinide'),
(102,'Nobelium','No',259,157,102,102,7,'artificial',false,'Actinide'),
(103,'Lawrencium','Lr',262,159,103,103,7,'artificial',false,'Actinide'),
(104,'Rutherfordium','Rf',261,157,104,104,7,'artificial',false,'Transactinide'),
(105,'Dubnium','Db',262,157,105,105,7,'artificial',false,'Transactinide'),
(106,'Seaborgium','Sg',266,160,106,106,7,'artificial',false,'Transactinide'),
(107,'Bohrium','Bh',264,157,107,107,7,'artificial',false,'Transactinide'),
(108,'Hassium','Hs',267,159,108,108,7,'artificial',false,'Transactinide'),
(109,'Meitnerium','Mt',268,159,109,109,7,'artificial',false,'Transactinide'),
(110,'Darmstadtium','Ds',271,161,110,110,7,'artificial',false,'Transactinide'),
(111,'Roentgenium','Rg',272,161,111,111,7,'artificial',false,'Transactinide'),
(112,'Copernicium','Cn',285,173,112,112,7,'artificial',false,'Transactinide'),
(113,'Nihonium','Nh',284,171,113,113,7,'artificial',false,'Unknown'),
(114,'Flerovium','Fl',289,175,114,114,7,'artificial',false,'Transactinide'),
(115,'Moscovium','Mc',288,173,115,115,7,'artificial',false,'Unknown'),
(116,'Livermorium','Lv',292,176,116,116,7,'artificial',false,'Transactinide'),
(117,'Tennessine','Ts',295,178,117,117,7,'artificial',false,'Unknown'),
(118,'Oganesson','Og',294,176,118,118,7,'artificial',false,'NobleGas');
