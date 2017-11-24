use ticopartdb1
go
set language Spanish
set nocount on 
go
begin try
drop table BitacoraBusqueda;end try begin catch end catch
begin try
drop table Cotizaciones;end try begin catch end catch
begin try
drop table Usuario;end try begin catch end catch
begin try
drop table ParteVehiculo;end try begin catch end catch
begin try
drop table telefonoProveedor;end try begin catch end catch
begin try
drop table tipoTelefono;end try begin catch end catch
begin try
drop table Imagenes;end try begin catch end catch
begin try
drop table Parte;end try begin catch end catch
begin try
drop table ListaParte;end try begin catch end catch
begin try
drop table Roles;end try begin catch end catch
begin try
drop table ModeloVehiculo;end try begin catch end catch
begin try
drop table MarcaVehiculo;end try begin catch end catch
begin try
drop table Proveedor;end try begin catch end catch
begin try
drop table tipoProveedor;end try begin catch end catch
begin try
drop table CategoriaParte;end try begin catch end catch
begin try
drop table Clasificacion;end try begin catch end catch
begin try
drop table Canton;end try begin catch end catch
begin try
drop table Provincia;end try begin catch end catch
begin try
drop view vw_VistaPartes;end try begin catch end catch
begin try
drop view vw_InfoParte;end try begin catch end catch
begin try
drop view vw_InfoParteVehiculo;end try begin catch end catch
begin try
drop view vw_InfoProveedorParte;end try begin catch end catch
begin try
drop view vw_InfoCotizaciones;end try begin catch end catch
begin try
drop view Vw_ListaProveedores;end try begin catch end catch
begin try
drop view Vw_Top10;end try begin catch end catch
begin try
drop Procedure sp_GuardarParte;end try begin catch end catch
begin try
drop Procedure sp_GuardarImagen;end try begin catch end catch
begin try
drop Procedure sp_GuardarVehiculo;end try begin catch end catch
begin try
drop procedure sp_GuardarCotizacion;end try begin catch end catch
go
Create table Provincia(
idProvincia int primary key,
provincia varchar(50) unique)
insert into Provincia values (1,'San Jose'),(2,'Alajuela'),(3,'Cartago'),(4,'Heredia'),(5,'Guanacaste'),(6,'Puntarenas'),(7,'Limón')
Create table Canton(
idProvincia int references Provincia,
idCanton int primary key(idProvincia,idCanton),
Canton varchar(50))
insert into Canton values (1,1,'San Jose'),(1,2,'Escazu'),(1,3,'Desamparados'),(1,4,'Puriscal'),(1,5,'Aserri'),(1,6,'Mora'),(1,7,'Goicoechea'),(1,8,'Santa Ana'),(1,9,'Alajuelita'),(1,10,'Vasquez de Coronado'),(1,11,'Acosta'),(1,12,'Tibas'),(1,13,'Moravia'),(1,14,'Montes de Oca'),(1,15,'Turrubares'),(1,16,'Dota'),(1,17,'Curridabat'),(1,18,'Perez Zeledon'),(1,19,'Leon Cortez'),(2,1,'Alajuela'),(2,2,'San Ramon'),(2,3,'Grecia'),(2,4,'San Mateo'),(2,5,'Atenas'),(2,6,'Naranjo'),(2,7,'Palmares'),(2,8,'Poas'),(2,9,'Orotina'),(2,10,'San Carlos'),(2,11,'Alfaro uiz'),(2,12,'Valverde Vega'),(2,13,'Upala'),(2,14,'Los Chiles'),(2,15,'Guatuso'),(3,1,'Cartago'),(3,2,'Paraiso'),(3,3,'La Union'),(3,4,'Jimenez'),(3,5,'Turrialba'),(3,6,'Alvarado'),(3,7,'Oreamuno'),(3,8,'El Guarco'),(4,1,'Heredia'),(4,2,'Barva'),(4,3,'Santo Domingo'),(4,4,'Santa Barbara'),(4,5,'San Rafael'),(4,6,'San Isidro'),(4,7,'Belen'),(4,8,'Flores'),(4,9,'San Pablo'),(4,10,'Sarapiqui'),(5,1,'Liberia'),(5,2,'Nicoya'),(5,3,'Santa Cruz'),(5,4,'Bagaces'),(5,5,'Carrillo'),(5,6,'Cañas'),(5,7,'Abangares'),(5,8,'Tilaran'),(5,9,'Nandayure'),(5,10,'La Cruz'),
(5,11,'Hojancha'),(6,1,'Puntarenas'),(6,2,'Esparza'),(6,3,'Buenos Aires'),(6,4,'Montes de Oro'),(6,5,'Osa'),(6,6,'Aguirre'),(6,7,'Golfito'),(6,8,'Coto Brus'),(6,9,'Parrita'),(6,10,'Corredores'),(6,11,'Garabito'),(7,1,'Limon'),(7,2,'Pococi'),(7,3,'Siquirres'),(7,4,'Talamanca'),(7,5,'Matina'),(7,6,'Guacimo')

create table MarcaVehiculo(
idMarca int primary key,
Marca varchar(100))
insert into MarcaVehiculo values (1,'Abarth'),(2,'Alfa Romeo'),(3,'Aro'),(4,'Asia'),(5,'Asia Motors'),(6,'Aston Martin'),(7,'Audi'),(8,'Austin'),(9,'Auverland'),(10,'Bentley'),(11,'Bertone'),(12,'BMW'),(13,'Cadillac'),(14,'Chevrolet'),(15,'Chrysler'),(16,'Citroen'),(17,'Corvette'),(18,'Dacia'),(19,'Daewoo'),(20,'Daf'),(21,'Daihatsu'),(22,'Daimler'),(23,'Dodge'),(24,'Ferrari'),(25,'Fiat'),(26,'Ford'),(27,'Galloper'),(28,'Gmc'),(29,'Honda'),(30,'Hummer'),(31,'Hyundai'),(32,'Infiniti'),(33,'Innocenti'),(34,'Isuzu'),(35,'Iveco'),(36,'Iveco-pegaso'),(37,'Jaguar'),(38,'Jeep'),(39,'Kia'),(40,'Lada'),(41,'Lamborghini'),(42,'Lancia'),(43,'Land-Rover'),(44,'Ldv'),(45,'Lexus'),(46,'Lotus'),(47,'Mahindra'),(48,'Maserati'),(49,'Maybach'),(50,'Mazda'),(51,'Mercedes-benz'),(52,'Mg'),(53,'Mini'),(54,'Mitsubishi'),(55,'Morgan'),(56,'Nissan'),(57,'Opel'),(58,'Peugeot'),(59,'Pontiac'),(60,'Porsche'),(61,'Renault'),(62,'Rolls Royce'),(63,'Rover'),(64,'Saab'),(65,'Santana'),(66,'Seat'),(67,'Skoda'),(68,'Smart'),(69,'Ssangyong'),(70,'Subaru'),(71,'Suzuki'),(72,'Talbot'),(73,'Tata'),(74,'Toyota'),(75,'Umm'),(76,'Vaz'),(77,'Volkswagen'),(78,'Volvo'),(79,'Wartburg'),(80,'geo'),(81,'dongfeng')

create table ModeloVehiculo(
idMarca int references MarcaVehiculo,
idModelo int primary key(idMarca,idModelo),
Modelo varchar(100))
insert into ModeloVehiculo values (1,1,'500'),(1,2,'Grande Punto'),(1,3,'Punto Evo'),(1,4,'500c'),(1,5,'695'),(1,6,'Punto'),(2,7,'155'),(2,8,'156'),(2,9,'159'),(2,10,'164'),(2,11,'145'),(2,12,'147'),(2,13,'146'),(2,14,'Gtv'),(2,15,'Spider'),(2,16,'166'),(2,17,'Gt'),(2,18,'Crosswagon'),(2,19,'Brera'),(2,20,'90'),(2,21,'75'),(2,22,'33'),(2,23,'Giulietta'),(2,24,'Sprint'),(2,25,'Mito'),(3,26,'Expander'),(3,27,'10'),(3,28,'24'),(3,29,'Dacia'),(4,30,'Rocsta'),(5,31,'Rocsta'),(6,32,'Db7'),(6,33,'V8'),(6,34,'Db9'),(6,35,'Vanquish'),(6,36,'V8 Vantage'),(6,37,'Vantage'),(6,38,'Dbs'),(6,39,'Volante'),(6,40,'Virage'),(6,41,'Vantage V8'),(6,42,'Vantage V12'),(6,43,'Rapide'),(6,44,'Cygnet'),(7,45,'80'),(7,46,'A4'),(7,47,'A6'),(7,48,'S6'),(7,49,'Coupe'),(7,50,'S2'),(7,51,'Rs2'),(7,52,'A8'),(7,53,'Cabriolet'),(7,54,'S8'),(7,55,'A3'),(7,56,'S4'),(7,57,'Tt'),(7,58,'S3'),(7,59,'Allroad Quattro'),(7,60,'Rs4'),(7,61,'A2'),(7,62,'Rs6'),(7,63,'Q7'),(7,64,'R8'),(7,65,'A5'),(7,66,'S5'),(7,67,'V8'),(7,68,'200'),(7,69,'100'),(7,70,'90'),(7,71,'Tts'),(7,72,'Q5'),(7,73,'A4 Allroad Quattro'),(7,74,'Tt Rs'),(7,75,'Rs5'),(7,76,'A1'),(7,77,'A7'),(7,78,'Rs3'),(7,79,'Q3'),(7,80,'A6 Allroad Quattro'),(7,81,'S7'),(7,82,'Sq5'),(8,83,'Mini'),(8,84,'Montego'),(8,85,'Maestro'),(8,86,'Metro'),(8,87,'Mini Moke'),(9,88,'Diesel'),(10,89,'Brooklands'),(10,90,'Turbo'),(10,91,'Continental'),(10,92,'Azure'),(10,93,'Arnage'),(10,94,'Continental Gt'),(10,95,'Continental Flying Spur'),(10,96,'Turbo R'),(10,97,'Mulsanne'),(10,98,'Eight'),(10,99,'Continental Gtc'),(10,100,'Continental Supersports'),(11,101,'Freeclimber Diesel'),(12,102,'Serie 3'),(12,103,'Serie 5'),(12,104,'Compact'),(12,105,'Serie 7'),(12,106,'Serie 8'),(12,107,'Z3'),(12,108,'Z4'),(12,109,'Z8'),(12,110,'X5'),(12,111,'Serie 6'),(12,112,'X3'),(12,113,'Serie 1'),(12,114,'Z1'),(12,115,'X6'),(12,116,'X1'),(13,117,'Seville'),(13,118,'Sts'),(13,119,'El Dorado'),(13,120,'Cts'),(13,121,'Xlr'),(13,122,'Srx'),(13,123,'Escalade'),(13,124,'Bls'),(14,125,'Corvette'),(14,126,'Blazer'),(14,127,'Astro'),(14,128,'Nubira'),(14,129,'Evanda'),(14,130,'Trans Sport'),(14,131,'Camaro'),(14,132,'Aveo'),(14,133,'Alero'),(14,134,'Tahoe'),(14,135,'Tacuma'),(14,136,'Trailblazer'),(14,137,'Kalos'),(14,138,'Aveo'),(14,139,'Lacetti'),(14,140,'Epica'),(14,141,'Captiva'),(14,142,'Hhr'),(14,143,'Cruze'),(14,144,'Spark'),(14,145,'Orlando'),(14,146,'Volt'),(14,147,'Malibu'),(14,1010,'Suburban'),(14,1011,'Matiz'),(14,1018,'Tracker'),(14,1019,'optra'),(14,1027,'sonic lt'),(15,148,'Vision'),(15,149,'300m'),(15,150,'Grand Voyager'),(15,151,'Viper'),(15,152,'Neon'),(15,153,'Voyager'),(15,154,'Stratus'),(15,155,'Sebring'),(15,156,'Sebring 200c'),(15,157,'New Yorker'),(15,158,'Pt Cruiser'),(15,159,'Crossfire'),(15,160,'300c'),(15,161,'Le Baron'),(15,162,'Saratoga'),(16,163,'Xantia'),(16,164,'Xm'),(16,165,'Ax'),(16,166,'Zx'),(16,167,'Evasion'),(16,168,'C8'),(16,169,'Saxo'),(16,170,'C2'),(16,171,'Xsara'),(16,172,'C4'),(16,173,'Xsara Picasso'),(16,174,'C5'),(16,175,'C3'),(16,176,'C3 Pluriel'),(16,177,'C1'),(16,178,'C6'),(16,179,'Grand C4 Picasso'),(16,180,'C4 Picasso'),(16,181,'Ccrosser'),(16,182,'C15'),(16,183,'Jumper'),(16,184,'Jumpy'),(16,185,'Berlingo'),(16,186,'Bx'),(16,187,'C25'),(16,188,'Cx'),(16,189,'Gsa'),(16,190,'Visa'),(16,191,'Lna'),(16,192,'2cv'),(16,193,'Nemo'),(16,194,'C4 Sedan'),(16,195,'Berlingo First'),(16,196,'C3 Picasso'),(16,197,'Ds3'),(16,198,'Czero'),(16,199,'Ds4'),(16,200,'Ds5'),(16,201,'C4 Aircross'),(16,202,'Celysee'),(17,203,'Corvette'),(18,204,'Contac'),(18,205,'Logan'),(18,206,'Sandero'),(18,207,'Duster'),(18,208,'Lodgy'),(19,209,'Nexia'),(19,210,'Aranos'),(19,211,'Lanos'),(19,212,'Nubira'),(19,213,'Compact'),(19,214,'Nubira Compact'),(19,215,'Leganza'),(19,216,'Evanda'),(19,217,'Matiz'),(19,218,'Tacuma'),(19,219,'Kalos'),(19,220,'Lacetti'),(21,221,'Applause'),(21,222,'Charade'),(21,223,'Rocky'),(21,224,'Feroza'),(21,225,'Terios'),(21,226,'Sirion'),(21,1023,'bego'),(22,227,'Serie Xj'),(22,228,'Xj'),(22,229,'Double Six'),(22,230,'Six'),(22,231,'Series Iii'),(23,232,'Viper'),(23,233,'Caliber'),(23,234,'Nitro'),(23,235,'Avenger'),(23,236,'Journey'),(24,237,'F355'),(24,238,'360'),(24,239,'F430'),(24,240,'F512 M'),(24,241,'550 Maranello'),(24,242,'575m Maranello'),(24,243,'599'),(24,244,'456'),(24,245,'456m'),(24,246,'612'),(24,247,'F50'),(24,248,'Enzo'),(24,249,'Superamerica'),(24,250,'430'),(24,251,'348'),(24,252,'Testarossa'),(24,253,'512'),(24,254,'355'),(24,255,'F40'),(24,256,'412'),(24,257,'Mondial'),(24,258,'328'),(24,259,'California'),(24,260,'458'),(24,261,'Ff'),(25,262,'Croma'),(25,263,'Cinquecento'),(25,264,'Seicento'),(25,265,'Punto'),(25,266,'Grande Punto'),(25,267,'Panda'),(25,268,'Tipo'),(25,269,'Coupe'),(25,270,'Uno'),(25,271,'Ulysse'),(25,272,'Tempra'),(25,273,'Marea'),(25,274,'Barchetta'),(25,275,'Bravo'),(25,276,'Stilo'),(25,277,'Brava'),(25,278,'Palio Weekend'),(25,279,'600'),(25,280,'Multipla'),(25,281,'Idea'),(25,282,'Sedici'),(25,283,'Linea'),(25,284,'500'),(25,285,'Fiorino'),(25,286,'Ducato'),(25,287,'Doblo Cargo'),(25,288,'Doblo'),(25,289,'Strada'),(25,290,'Regata'),(25,291,'Talento'),(25,292,'Argenta'),(25,293,'Ritmo'),(25,294,'Punto Classic'),(25,295,'Qubo'),(25,296,'Punto Evo'),(25,297,'500c'),(25,298,'Freemont'),(25,299,'Panda Classic'),(25,300,'500l'),(26,301,'Maverick'),(26,302,'Escort'),(26,303,'Focus'),(26,304,'Mondeo'),(26,305,'Scorpio'),(26,306,'Fiesta'),(26,307,'Probe'),(26,308,'Explorer'),(26,309,'Galaxy'),(26,310,'Ka'),(26,311,'Puma'),(26,312,'Cougar'),(26,313,'Focus Cmax'),(26,314,'Fusion'),(26,315,'Streetka'),(26,316,'Cmax'),(26,317,'Smax'),(26,318,'Transit'),(26,319,'Courier'),(26,320,'Ranger'),(26,321,'Sierra'),(26,322,'Orion'),(26,323,'Pick Up'),(26,324,'Capri'),(26,325,'Granada'),(26,326,'Kuga'),(26,327,'Grand Cmax'),(26,328,'Bmax'),(26,329,'Tourneo Custom'),(26,1010,'festiva'),(26,1013,'Econoline E350'),(26,1020,'escape'),(26,1038,'army'),(27,330,'Exceed'),(27,331,'Santamo'),(27,332,'Super Exceed'),(29,333,'Accord'),(29,334,'Civic'),(29,335,'Crx'),(29,336,'Prelude'),(29,337,'Nsx'),(29,338,'Legend'),(29,339,'Crv'),(29,340,'Hrv'),(29,341,'Logo'),(29,342,'S2000'),(29,343,'Stream'),(29,344,'Jazz'),(29,345,'Frv'),(29,346,'Concerto'),(29,347,'Insight'),(29,348,'Crz'),(30,349,'H2'),(30,350,'H3'),(30,351,'H3t'),(31,352,'Lantra'),(31,353,'Sonata'),(31,354,'Elantra'),(31,355,'Accent'),(31,356,'Scoupe'),(31,357,'Coupe'),(31,358,'Atos'),(31,359,'H1'),(31,360,'Atos Prime'),(31,361,'Xg'),(31,362,'Trajet'),(31,363,'Santa Fe'),(31,364,'Terracan'),(31,365,'Matrix'),(31,366,'Getz'),(31,367,'Tucson'),(31,368,'I30'),(31,369,'Pony'),(31,370,'Grandeur'),(31,371,'I10'),(31,372,'I800'),(31,373,'Sonata Fl'),(31,374,'Ix55'),(31,375,'I20'),(31,376,'Ix35'),(31,377,'Ix20'),(31,378,'Genesis'),(31,379,'I40'),(31,380,'Veloster'),(31,1015,'santa fe'),(31,1026,'exel'),(31,1032,'galoper'),(31,1042,'starex'),(32,381,'G'),(32,382,'Ex'),(32,383,'Fx'),(32,384,'M'),(33,385,'Elba'),(33,386,'Minitre'),(34,387,'Trooper'),(34,388,'Pick Up'),(34,389,'D Max'),(34,390,'Rodeo'),(34,391,'Dmax'),(34,392,'Trroper'),(35,393,'Daily'),(35,394,'Massif'),(36,395,'Daily'),(36,396,'Duty'),(37,397,'Serie Xj'),(37,398,'Serie Xk'),(37,399,'Xj'),(37,400,'Stype'),(37,401,'Xf'),(37,402,'Xtype'),(38,403,'Wrangler'),(38,404,'Cherokee'),(38,405,'Grand Cherokee'),(38,406,'Commander'),(38,407,'Compass'),(38,408,'Wrangler Unlimited'),(38,409,'Patriot'),(39,410,'Sportage'),(39,411,'Sephia'),(39,412,'Sephia Ii'),(39,413,'Pride'),(39,414,'Clarus'),(39,415,'Shuma'),(39,416,'Carnival'),(39,417,'Joice'),(39,418,'Magentis'),(39,419,'Carens'),(39,420,'Rio'),(39,421,'Cerato'),(39,422,'Sorento'),(39,423,'Opirus'),(39,424,'Picanto'),(39,425,'Ceed'),(39,426,'Ceed Sporty Wagon'),(39,427,'Proceed'),(39,428,'K2500 Frontier'),(39,429,'K2500'),(39,430,'Soul'),(39,431,'Venga'),(39,432,'Optima'),(39,433,'Ceed Sportswagon'),(39,1022,'towner'),(40,434,'Samara'),(40,435,'Niva'),(40,436,'Sagona'),(40,437,'Stawra 2110'),(40,438,'214'),(40,439,'Kalina'),(40,440,'Serie 2100'),(40,441,'Priora'),(41,442,'Gallardo'),(41,443,'Murcielago'),(41,444,'Aventador'),(42,445,'Delta'),(42,446,'K'),(42,447,'Y10'),(42,448,'Dedra'),(42,449,'Lybra'),(42,450,'Z'),(42,451,'Y'),(42,452,'Ypsilon'),(42,453,'Thesis'),(42,454,'Phedra'),(42,455,'Musa'),(42,456,'Thema'),(42,457,'Zeta'),(42,458,'Kappa'),(42,459,'Trevi'),(42,460,'Prisma'),(42,461,'A112'),(42,462,'Ypsilon Elefantino'),(42,463,'Voyager'),(43,464,'Range Rover'),(43,465,'Defender'),(43,466,'Discovery'),(43,467,'Freelander'),(43,468,'Range Rover Sport'),(43,469,'Discovery 4'),(43,470,'Range Rover Evoque'),(44,471,'Maxus'),(45,472,'Ls400'),(45,473,'Ls430'),(45,474,'Gs300'),(45,475,'Is200'),(45,476,'Rx300'),(45,477,'Gs430'),(45,478,'Gs460'),(45,479,'Sc430'),(45,480,'Is300'),(45,481,'Is250'),(45,482,'Rx400h'),(45,483,'Is220d'),(45,484,'Rx350'),(45,485,'Gs450h'),(45,486,'Ls460'),(45,487,'Ls600h'),(45,488,'Ls'),(45,489,'Gs'),(45,490,'Is'),(45,491,'Sc'),(45,492,'Rx'),(45,493,'Ct'),(46,494,'Elise'),(46,495,'Exige'),(47,496,'Bolero Pickup'),(47,497,'Goa Pickup'),(47,498,'Goa'),(47,499,'Cj'),(47,500,'Pikup'),(47,501,'Thar'),(48,502,'Ghibli'),(48,503,'Shamal'),(48,504,'Quattroporte'),(48,505,'3200 Gt'),(48,506,'Coupe'),(48,507,'Spyder'),(48,508,'Gransport'),(48,509,'Granturismo'),(48,510,'430'),(48,511,'Biturbo'),(48,512,'228'),(48,513,'224'),(48,514,'Grancabrio'),(49,515,'Maybach'),(50,516,'Xedos 6'),(50,517,'626'),(50,518,'121'),(50,519,'Xedos 9'),(50,520,'323'),(50,521,'Mx3'),(50,522,'Rx7'),(50,523,'Mx5'),(50,524,'Mazda3'),(50,525,'Mpv'),(50,526,'Demio'),(50,527,'Premacy'),(50,528,'Tribute'),(50,529,'Mazda6'),(50,530,'Mazda2'),(50,531,'Rx8'),(50,532,'Mazda5'),(50,533,'Cx7'),(50,534,'Serie B'),(50,535,'B2500'),(50,536,'Bt50'),(50,537,'Mx6'),(50,538,'929'),(50,539,'Cx5'),(51,540,'Clase C'),(51,541,'Clase E'),(51,542,'Clase Sl'),(51,543,'Clase S'),(51,544,'Clase Cl'),(51,545,'Clase G'),(51,546,'Clase Slk'),(51,547,'Clase V'),(51,548,'Viano'),(51,549,'Clase Clk'),(51,550,'Clase A'),(51,551,'Clase M'),(51,552,'Vaneo'),(51,553,'Slklasse'),(51,554,'Slr Mclaren'),(51,555,'Clase Cls'),(51,556,'Clase R'),(51,557,'Clase Gl'),(51,558,'Clase B'),(51,559,'100d'),(51,560,'140d'),(51,561,'180d'),(51,562,'Sprinter'),(51,563,'Vito'),(51,564,'Transporter'),(51,565,'280'),(51,566,'220'),(51,567,'200'),(51,568,'190'),(51,569,'600'),(51,570,'400'),(51,571,'Clase Sl R129'),(51,572,'300'),(51,573,'500'),(51,574,'420'),(51,575,'260'),(51,576,'230'),(51,577,'Clase Clc'),(51,578,'Clase Glk'),(51,579,'Sls Amg'),(52,580,'Mgf'),(52,581,'Tf'),(52,582,'Zr'),(52,583,'Zs'),(52,584,'Zt'),(52,585,'Ztt'),(52,586,'Mini'),(52,587,'Countryman'),(52,588,'Paceman'),(53,1006,'Mini'),(53,1007,'Countryman'),(53,1008,'Paceman'),(54,589,'Montero'),(54,590,'Galant'),(54,591,'Colt'),(54,592,'Space Wagon'),(54,593,'Space Runner'),(54,594,'Space Gear'),(54,595,'3000 Gt'),(54,596,'Carisma'),(54,597,'Eclipse'),(54,598,'Space Star'),(54,599,'Montero Sport'),(54,600,'Montero Io'),(54,601,'Outlander'),(54,602,'Lancer'),(54,603,'Grandis'),(54,604,'L200'),(54,605,'Canter'),(54,606,'300 Gt'),(54,607,'Asx'),(54,608,'Imiev'),(54,1009,'Van'),(54,1024,'mirage'),(54,1036,'Expo'),(55,609,'44'),(55,610,'Plus 8'),(55,611,'Aero 8'),(55,612,'V6'),(55,613,'Roadster'),(55,614,'4'),(55,615,'Plus 4'),(56,616,'Terrano Ii'),(56,617,'Terrano'),(56,618,'Micra'),(56,619,'Sunny'),(56,620,'Primera'),(56,621,'Serena'),(56,622,'Patrol'),(56,623,'Maxima Qx'),(56,624,'200 Sx'),(56,625,'300 Zx'),(56,626,'Patrol Gr'),(56,627,'100 Nx'),(56,628,'Almera'),(56,629,'Pathfinder'),(56,630,'Almera Tino'),(56,631,'Xtrail'),(56,632,'350z'),(56,633,'Murano'),(56,634,'Note'),(56,635,'Qashqai'),(56,636,'Tiida'),(56,637,'Vanette'),(56,638,'Trade'),(56,639,'Vanette Cargo'),(56,640,'Pickup'),(56,641,'Navara'),(56,642,'Cabstar E'),(56,643,'Cabstar'),(56,644,'Maxima'),(56,645,'Camion'),(56,646,'Prairie'),(56,647,'Bluebird'),(56,648,'Np300 Pick Up'),(56,649,'Qashqai2'),(56,650,'Pixo'),(56,651,'Gtr'),(56,652,'370z'),(56,653,'Cube'),(56,654,'Juke'),(56,655,'Leaf'),(56,656,'Evalia'),(56,1014,'sentra'),(56,1016,'Axxess'),(56,1029,'frontier'),(56,1030,'frontier'),(56,1031,'frontier'),(56,1037,'PATHFINDER SE'),(56,1039,'Quest'),(57,657,'Astra'),(57,658,'Vectra'),(57,659,'Calibra'),(57,660,'Corsa'),(57,661,'Omega'),(57,662,'Frontera'),(57,663,'Tigra'),(57,664,'Monterey'),(57,665,'Sintra'),(57,666,'Zafira'),(57,667,'Agila'),(57,668,'Speedster'),(57,669,'Signum'),(57,670,'Meriva'),(57,671,'Antara'),(57,672,'Gt'),(57,673,'Combo'),(57,674,'Movano'),(57,675,'Vivaro'),(57,676,'Kadett'),(57,677,'Monza'),(57,678,'Senator'),(57,679,'Rekord'),(57,680,'Manta'),(57,681,'Ascona'),(57,682,'Insignia'),(57,683,'Zafira Tourer'),(57,684,'Ampera'),(57,685,'Mokka'),(57,686,'Adam'),(58,687,'306'),(58,688,'605'),(58,689,'106'),(58,690,'205'),(58,691,'405'),(58,692,'406'),(58,693,'806'),(58,694,'807'),(58,695,'407'),(58,696,'307'),(58,697,'206'),(58,698,'607'),(58,699,'308'),(58,700,'307 Sw'),(58,701,'206 Sw'),(58,702,'407 Sw'),(58,703,'1007'),(58,704,'107'),(58,705,'207'),(58,706,'4007'),(58,707,'Boxer'),(58,708,'Partner'),(58,709,'J5'),(58,710,'604'),(58,711,'505'),(58,712,'309'),(58,713,'Bipper'),(58,714,'Partner Origin'),(58,715,'3008'),(58,716,'5008'),(58,717,'Rcz'),(58,718,'508'),(58,719,'Ion'),(58,720,'208'),(58,721,'4008'),(58,1017,'206 Diesel'),(59,722,'Trans Sport'),(59,723,'Firebird'),(59,724,'Trans Am'),(60,725,'911'),(60,726,'Boxster'),(60,727,'Cayenne'),(60,728,'Carrera Gt'),(60,729,'Cayman'),(60,730,'928'),(60,731,'968'),(60,732,'944'),(60,733,'924'),(60,734,'Panamera')
insert into ModeloVehiculo values (60,735,'918'),(61,736,'Megane'),(61,737,'Safrane'),(61,738,'Laguna'),(61,739,'Clio'),(61,740,'Twingo'),(61,741,'Nevada'),(61,742,'Espace'),(61,743,'Spider'),(61,744,'Scenic'),(61,745,'Grand Espace'),(61,746,'Avantime'),(61,747,'Vel Satis'),(61,748,'Grand Scenic'),(61,749,'Clio Campus'),(61,750,'Modus'),(61,751,'Express'),(61,752,'Trafic'),(61,753,'Master'),(61,754,'Kangoo'),(61,755,'Mascott'),(61,756,'Master Propulsion'),(61,757,'Maxity'),(61,758,'R19'),(61,759,'R25'),(61,760,'R5'),(61,761,'R21'),(61,762,'R4'),(61,763,'Alpine'),(61,764,'Fuego'),(61,765,'R18'),(61,766,'R11'),(61,767,'R9'),(61,768,'R6'),(61,769,'Grand Modus'),(61,770,'Kangoo Combi'),(61,771,'Koleos'),(61,772,'Fluence'),(61,773,'Wind'),(61,774,'Latitude'),(61,775,'Grand Kangoo Combi'),(62,776,'Siver Dawn'),(62,777,'Silver Spur'),(62,778,'Park Ward'),(62,779,'Silver Seraph'),(62,780,'Corniche'),(62,781,'Phantom'),(62,782,'Touring'),(62,783,'Silvier'),(63,784,'800'),(63,785,'600'),(63,786,'100'),(63,787,'200'),(63,788,'Coupe'),(63,789,'400'),(63,790,'45'),(63,791,'Cabriolet'),(63,792,'25'),(63,793,'Mini'),(63,794,'75'),(63,795,'Streetwise'),(63,796,'Sd'),(64,797,'900'),(64,798,'93'),(64,799,'9000'),(64,800,'95'),(64,801,'93x'),(64,802,'94x'),(65,803,'300'),(65,804,'350'),(65,805,'Anibal'),(65,806,'Anibal Pick Up'),(66,807,'Ibiza'),(66,808,'Cordoba'),(66,809,'Toledo'),(66,810,'Marbella'),(66,811,'Alhambra'),(66,812,'Arosa'),(66,813,'Leon'),(66,814,'Altea'),(66,815,'Altea Xl'),(66,816,'Altea Freetrack'),(66,817,'Terra'),(66,818,'Inca'),(66,819,'Malaga'),(66,820,'Ronda'),(66,821,'Exeo'),(66,822,'Mii'),(67,823,'Felicia'),(67,824,'Forman'),(67,825,'Octavia'),(67,826,'Octavia Tour'),(67,827,'Fabia'),(67,828,'Superb'),(67,829,'Roomster'),(67,830,'Scout'),(67,831,'Pickup'),(67,832,'Favorit'),(67,833,'130'),(67,834,'S'),(67,835,'Yeti'),(67,836,'Citigo'),(67,837,'Rapid'),(68,838,'Smart'),(68,839,'Citycoupe'),(68,840,'Fortwo'),(68,841,'Cabrio'),(68,842,'Crossblade'),(68,843,'Roadster'),(68,844,'Forfour'),(69,845,'Korando'),(69,846,'Family'),(69,847,'K4d'),(69,848,'Musso'),(69,849,'Korando Kj'),(69,850,'Rexton'),(69,851,'Rexton Ii'),(69,852,'Rodius'),(69,853,'Kyron'),(69,854,'Actyon'),(69,855,'Sports Pick Up'),(69,856,'Actyon Sports Pick Up'),(69,857,'Kodando'),(70,858,'Legacy'),(70,859,'Impreza'),(70,860,'Svx'),(70,861,'Justy'),(70,862,'Outback'),(70,863,'Forester'),(70,864,'G3x Justy'),(70,865,'B9 Tribeca'),(70,866,'Xt'),(70,867,'1800'),(70,868,'Tribeca'),(70,869,'Wrx Sti'),(70,870,'Trezia'),(70,871,'Xv'),(70,872,'Brz'),(71,873,'Maruti'),(71,874,'Swift'),(71,875,'Vitara'),(71,876,'Baleno'),(71,877,'Samurai'),(71,878,'Alto'),(71,879,'Wagon R'),(71,880,'Jimny'),(71,881,'Grand Vitara'),(71,882,'Ignis'),(71,883,'Liana'),(71,884,'Grand Vitara Xl7'),(71,885,'Sx4'),(71,886,'Splash'),(71,887,'Kizashi'),(71,1010,'Tracker'),(71,1012,'Sidekick'),(71,1040,'celerio gl'),(72,888,'Samba'),(72,889,'Tagora'),(72,890,'Solara'),(72,891,'Horizon'),(73,892,'Telcosport'),(73,893,'Telco'),(73,894,'Sumo'),(73,895,'Safari'),(73,896,'Indica'),(73,897,'Indigo'),(73,898,'Grand Safari'),(73,899,'Tl Pick Up'),(73,900,'Xenon Pick Up'),(73,901,'Vista'),(73,902,'Xenon'),(73,903,'Aria'),(74,904,'Carina E'),(74,905,'4runner'),(74,906,'Camry'),(74,907,'Rav4'),(74,908,'Celica'),(74,909,'Supra'),(74,910,'Paseo'),(74,911,'Land Cruiser 80'),(74,912,'Land Cruiser 100'),(74,913,'Land Cruiser'),(74,914,'Land Cruiser 90'),(74,915,'Corolla'),(74,916,'Auris'),(74,917,'Avensis'),(74,918,'Picnic'),(74,919,'Yaris'),(74,920,'Yaris Verso'),(74,921,'Mr2'),(74,922,'Previa'),(74,923,'Prius'),(74,924,'Avensis Verso'),(74,925,'Corolla Verso'),(74,926,'Corolla Sedan'),(74,927,'Aygo'),(74,928,'Hilux'),(74,929,'Dyna'),(74,930,'Land Cruiser 200'),(74,931,'Verso'),(74,932,'Iq'),(74,933,'Urban Cruiser'),(74,934,'Gt86'),(74,1021,'tercel'),(74,1028,'ECHO'),(74,1035,'prado'),(75,935,'100'),(75,936,'121'),(76,937,'214'),(76,938,'110 Stawra'),(76,939,'111 Stawra'),(76,940,'215'),(76,941,'112 Stawra'),(77,942,'Passat'),(77,943,'Golf'),(77,944,'Vento'),(77,945,'Polo'),(77,946,'Corrado'),(77,947,'Sharan'),(77,948,'Lupo'),(77,949,'Bora'),(77,950,'Jetta'),(77,951,'New Beetle'),(77,952,'Phaeton'),(77,953,'Touareg'),(77,954,'Touran'),(77,955,'Multivan'),(77,956,'Caddy'),(77,957,'Golf Plus'),(77,958,'Fox'),(77,959,'Eos'),(77,960,'Caravelle'),(77,961,'Tiguan'),(77,962,'Transporter'),(77,963,'Lt'),(77,964,'Taro'),(77,965,'Crafter'),(77,966,'California'),(77,967,'Santana'),(77,968,'Scirocco'),(77,969,'Passat Cc'),(77,970,'Amarok'),(77,971,'Beetle'),(77,972,'Up'),(77,973,'Cc'),(77,1010,'Prueba'),(78,974,'440'),(78,975,'850'),(78,976,'S70'),(78,977,'V70'),(78,978,'V70 Classic'),(78,979,'940'),(78,980,'480'),(78,981,'460'),(78,982,'960'),(78,983,'S90'),(78,984,'V90'),(78,985,'Classic'),(78,986,'S40'),(78,987,'V40'),(78,988,'V50'),(78,989,'V70 Xc'),(78,990,'Xc70'),(78,991,'C70'),(78,992,'S80'),(78,993,'S60'),(78,994,'Xc90'),(78,995,'C30'),(78,996,'780'),(78,997,'760'),(78,998,'740'),(78,999,'240'),(78,1000,'360'),(78,1001,'340'),(78,1002,'Xc60'),(78,1003,'V60'),(78,1004,'V40 Cross Country'),(79,1005,'353'),(80,1025,'Tracker'),(80,1041,'metro'),(81,1033,'rich'),(81,1034,'rich')

create table tipoProveedor(
idTipoProveedor int primary key,
tipoProveedor varchar(50))
insert into tipoProveedor values (1,'Partes Nuevas'),(2,'Partes Usadas'),(3,'Partes Nuevas y Usadas'),(4,'Servicios')

create table tipoTelefono(
idTtipoTelefono int primary key,
tipoTelefono varchar(30))
insert into tipoTelefono values (1,'Casa'),(2,'Celular'),(3,'Fax'),(4,'Oficina')

create table Roles(
idRol int primary key,
rol varchar(150))
insert into Roles values (1,'Administrador'),(2,'Proveedor'),(3,'Cliente'),(4,'Usuario Proveedor')

create table CategoriaParte(
idCategoriaParte int primary key,
categoria varchar(100) unique,
imagen varbinary(max))
insert into CategoriaParte values (1,'Motor y Transmisión',null),(2,'Sistema Eléctrico',null),(3,'Suspensión y Frenos',null),(4,'Carrocería',null)

create table Clasificacion(
id int primary key,
descripcion varchar(50))
insert into Clasificacion values (1,'Nuevo'),(2,'Reconstruido'),(3,'Usado')

create table Proveedor(
idProveedor int primary key,
tipoProveedor int references tipoProveedor,
NombreProveedor varchar(100),
cedula varchar(50),
descripcion varchar(300),
idProvincia int,
idCanton int,
foreign key(idProvincia,idCanton) references Canton,
direccion varchar(250),
logo varchar(500),
email varchar(400)
)
INSERT INTO [dbo].[proveedor]([idProveedor],[tipoProveedor],[NombreProveedor],[cedula],[descripcion],[idProvincia],[idCanton],[direccion],[logo],email)
     VALUES (1,4,'Taller LUJO','113870738','Reparacion de Vehículos',2,1,'75 mts al E, Iglesia Catolica, San Antonio del Tejar','../Proveedor/Logo/lujo.png','tallerlujo@ice.co.cr')

--alter table Proveedor add email varchar(400)

create table Usuario(
[idUsuario] int primary key,
[Usuario] varchar(150) unique,
[contrasenna] varbinary(8000),
Identificacion varchar(15) unique,
[Nombre] varchar(150),
[Apellido1] varchar(150),
[Apellido2] varchar(150),
[correo] varchar(300) unique,
[Telefono] varchar(250),
[Rol] int references Roles,
[estado] bit,
Proveedor int references Proveedor
)

Insert into Usuario values (1,'lbolanos',HASHBYTES('MD5','lbolanos'),'113870738','Luis Miguel','Bolaños','Mejias','luis.mbm89@gmail.com','882999979',1,1,1)
Insert into Usuario values (2,'lmejias',HASHBYTES('MD5','lmejias'),'203890621','Maria Lorena','Mejias','Huertas','lmejias@gmail.com','88602745',3,1,null)

create table listaParte(
idParte int primary key,
parte varchar(400) 
);
insert into listaParte values ('1','A / C Condensador'),
('2','A / C Cubierta del Evaporador solamente'),
('3','A / C Evaporador'),
('4','Acoplador de dirección'),
('5','Acoplamiento del cambio'),
('6','Actuador de bloqueo'),
('7','Actuador de eje (4WD)'),
('8','Adaptador de Caja de Transferencia'),
('9','Adaptador de filtro de aceite'),
('10','Adaptive Cruise Proyector'),
('11','Aire Cond./Aires Ventiladores'),
('12','Alerón trasero'),
('13','Alfombra'),
('14','Alfombras de piso'),
('15','Altavoz'),
('16','Alternador'),
('17','Amortiguador'),
('18','Amortiguador Absorber Energía (Frontal)'),
('19','Amortiguador Absorber Energía (Trasero)'),
('20','Amplificador / Radio'),
('21','Anillo de ajuste'),
('22','Antena'),
('23','Árbol de levas'),
('24','Arnés de cableado / Misc. Eléctrico'),
('25','Arnés de cableado eléctrico / eléctrico'),
('26','Ascensor superior convertible'),
('27','Asiento del eje trasero (RWD)'),
('28','Asiento, Atrás (3er)'),
('29','Asiento, Delantero'),
('30','Asiento, trasero (segundo)'),
('31','Asistente de dirección asistida'),
('32','ASPA del ventilador'),
('33','Audiovisual (A / V) (véase también Pantalla TV)'),
('34','Auto. Trans. Enfriador'),
('35','Balanceador de armónicos (Polea de manivela)'),
('36','Balancín'),
('37','Bandeja de ceniza / encendedor'),
('38','Bandeja de la batería'),
('39','Bandeja del piso'),
('40','Barra antivuelco'),
('41','Barra de acoplamiento'),
('42','Barra de conexión, motor'),
('43','Barra de la cara del parachoques (delantera)'),
('44','Barra de la cara del parachoques (parte posterior)'),
('45','Barra de torsión'),
('46','Barra delantera del parachoques de la cara'),
('47','Bastidor de techo'),
('48','Batería'),
('49','Bell Housing'),
('50','Bisagra de Capucha'),
('51','Bisagra de puerta delantera'),
('52','Bisagra de Puerta Trasera'),
('53','Bisagra de puerta trasera'),
('54','Bisagra trasera'),
('55','Bisel bisel'),
('56','Bloque de motor'),
('57','Bobina / Encendedor'),
('58','Bobina / muelle de aire'),
('59','Bolsa de aire'),
('60','Bolsa de aire Clockspring'),
('61','Bomba aspiradora'),
('62','Bomba de aceite, motor'),
('63','Bomba de agua'),
('64','Bomba de aire'),
('65','Bomba de combustible'),
('66','Bomba de dirección'),
('67','Bomba de dirección asistida'),
('68','Bomba de fluido de escape'),
('69','Bomba de freno antibloqueo'),
('70','Bomba de humo'),
('71','Bomba de inyección de combustible'),
('72','Bomba de refrigeración'),
('73','Bota superior convertible'),
('74','Botella de desbordamiento del radiador'),
('75','Brazo'),
('76','Brazo Arrastrador de Suspensión Trasera'),
('77','Brazo de control, delantero inferior'),
('78','Brazo de control, parte trasera superior'),
('79','Brazo de control, superior delantero'),
('80','Brazo de control, trasero inferior'),
('81','Brazo de radios, Delantero'),
('82','Brazo de Suspensión Trasera'),
('83','Brazo del limpiaparabrisas'),
('84','Brazo Idler'),
('85','Brazo Pitman'),
('86','Brida del eje'),
('87','Bumper (Front) incluye cubierta'),
('88','Bumper (trasero) incluye cubierta'),
('89','BumperTapa de tope'),
('90','Cabellos'),
('91','Cabeza (Cilindro)'),
('92','Cabeza del cilindro (motor)'),
('93','Cable del embrague'),
('94','Caja / caja / engranaje de la dirección de energía'),
('95','Caja de aire / limpiador de aire'),
('96','Caja de fusibles (cabina)'),
('97','Caja de fusibles (motor)'),
('98','Caja de fusibles de la cabina'),
('99','Caja de fusibles del motor'),
('100','Caja de la computadora no motor'),
('101','Caja de transmisión'),
('102','Calentador'),
('103','Calentador / Control de CA (vea también Pantalla de Radio o TV)'),
('104','Calibre (Misc)'),
('105','Caliper'),
('106','Cama de recogida'),
('107','Cama, recogida'),
('108','Cámara de asistencia de aparcamiento'),
('109','Cámara de punto ciego'),
('110','Cámara de respaldo'),
('111','Cámara de visión nocturna'),
('112','Capucha'),
('113','capucha'),
('114','Carburador'),
('115','Carcasa del árbol de levas'),
('116','Carcasa Transaxle solamente'),
('117','Carrier'),
('118','Carrier Case'),
('119','Carril de combustible (y varios inyectables)'),
('120','Cárter de aceite, motor'),
('121','Casas de termostato'),
('122','Caso diferencial solamente'),
('123','Choque de la campana'),
('124','Choque de parachoques'),
('125','Cigüeñal'),
('126','Cilindro de presión de dirección hidráulica'),
('127','Cilindro del motor'),
('128','Cilindro esclavo'),
('129','Cilindro maestro'),
('130','Cilindro maestro del embrague'),
('131','Cinturón de seguridad (eléctrico)'),
('132','Cinturón de seguridad delantero'),
('133','Cinturón de seguridad trasero'),
('134','Clip de la cabina, sin capucha'),
('135','Clip trasero'),
('136','Clockspring (bolsa de aire)'),
('137','Cojín de escritorio'),
('138','Colector de escape'),
('139','Columna de dirección'),
('140','Compresor A / C'),
('141','Compresor de aire comprimido'),
('142','Computadora de control del chasis (no del motor)'),
('143','Computadora del motor'),
('144','Condensador'),
('145','Condensador / Radiador mtd. Ventilador'),
('146','Conjunto de parachoques delantero (incluye cubierta)'),
('147','Consola frontal'),
('148','Consola trasera'),
('149','Consola trasera'),
('150','Consola, Frontal'),
('151','Control del calefactor del aire acondicionado'),
('152','Controlador de velocidad de crucero'),
('153','Convertible Top Motor'),
('154','Convertidor de par'),
('155','Convertidor de par de transmisión'),
('156','Convertidor Híbrido / Inversor'),
('157','Correa dentada / Cadena'),
('158','Cremallera de dirección / caja / engranaje'),
('159','Cremallera y piñón (dirección)'),
('160','Cristal, Ventana de cuarto'),
('161','Cristal, Ventana trasera'),
('162','Cuarto Interior'),
('163','Cubierta de Bumper (delantera)'),
('164','Cubierta de Bumper (trasera)'),
('165','Cubierta de Carga / Sombra'),
('166','Cubierta de la rueda / Hubcap (imagen w de la exhibición)'),
('167','Cubierta de la rueda / Hubcap (pantalla sin imagen)'),
('168','Cubierta de lona'),
('169','Cubierta de sincronización'),
('170','Cubierta del motor'),
('171','Cubierta del ventilador del radiador'),
('172','Cubierta principal'),
('173','Cubo'),
('174','Cubo de bloqueo, 4X4'),
('175','Cubo, bloqueo (4WD)'),
('176','Cucharada'),
('177','Cuello de llenado de combustible'),
('178','cuerno'),
('179','Cuerno de marco'),
('180','Cuerpo del acelerador / Carcasa de la válvula de mariposa'),
('181','Cuna del motor'),
('182','Defensa'),
('183','Deflector de la cubierta del radiador'),
('184','Depósito de combustible'),
('185','Depósito del lavaparabrisas'),
('186','Desempañante de la ventana trasera'),
('187','Disco de embrague'),
('188','Distribuidor'),
('189','Distribuidor de Combustible (& Miscelánea Inyección)'),
('190','Eje de transmisión, delantero'),
('191','Eje de transmisión, trasero'),
('192','Eje del eje'),
('193','Eje delantero de transmisión'),
('194','Eje delantero eje'),
('195','Eje Trasero (con Carcasa)'),
('196','Eje Trasero / Embrague'),
('197','Eje trasero de la transmisión'),
('198','El manual del propietario'),
('199','Emblema'),
('200','Embrague del compresor del aire acondicionado solamente'),
('201','Embrague del ventilador'),
('202','Enfriador de aceite'),
('203','Enfriador de dirección asistida'),
('204','Enfriador del inversor'),
('205','Enganche de remolque / gancho de remolque / winch'),
('206','Engranajes de sincronización'),
('207','Ensamblaje del eje delantero (4WD w Housing)'),
('208','Ensamblaje diferencial (véase también Carrier)'),
('209','Ensamble del Escape'),
('210','Ensamble del faro'),
('211','Equipo de transmisión'),
('212','Escudo térmico de escape'),
('213','Espejo de la puerta delantera'),
('214','Espejo, Puerta'),
('215','Espejo, Vista trasera'),
('216','Estante de la parcela'),
('217','Extensión del panel de cuartos'),
('218','Falda fender'),
('219','Faros delanteros'),
('220','Fender Extensión / Flare'),
('221','Freno de emergencia'),
('222','Freno Rotor / Tambor, Delantero'),
('223','Generador'),
('224','Grupo de instrumentos (ver también Speedo)'),
('225','Guantera'),
('226','Haz de eje delantero (2WD, incl I Beam Susp)'),
('227','Hoja de la primavera, Delantero'),
('228','Hoja de resorte, trasero'),
('229','Huso'),
('230','Ignitor / Bobina'),
('231','Indicador de combustible'),
('232','Intercooler'),
('233','Interior completo'),
('234','Interruptor de asiento'),
('235','Interruptor de caja de transferencia'),
('236','Interruptor de columna'),
('237','Interruptor de la ventana (puerta delantera)'),
('238','Interruptor de puerta delantera'),
('239','Interruptor de puerta trasera'),
('240','Interruptor de Ventana (Puerta Trasera)'),
('241','Interruptor del faro delantero'),
('242','Interruptor del faro delantero (véase también Interruptor de columna)'),
('243','Interruptor del tablero / del interior / del asiento'),
('244','Inversor de potencia (híbrido)'),
('245','Inyector De Combustible (& Miscelánea Inyección)'),
('246','Jack Assembly'),
('247','Key Remote / Fob'),
('248','Lado de la cama, recogida'),
('249','Lámpara de estacionamiento lateral (lateral)'),
('250','Lámpara de licencia'),
('251','Lámpara de niebla'),
('252','Línea de combustible'),
('253','Llaves / Pestillos y Cerraduras'),
('254','Luz de la cola'),
('255','Luz de reserva'),
('256','Luz indicadora / lateral, trasera'),
('257','Luz interior'),
('258','Manguera de aire acondicionado'),
('259','Manguera de presión de dirección hidráulica'),
('260','Manifold de admisión'),
('261','Manija de la manivela de la ventana de la puerta'),
('262','Manija de la puerta delantera, exterior'),
('263','Manija de la puerta delantera, interior'),
('264','Manija de la puerta trasera, interior'),
('265','Manija de puerta trasera, exterior'),
('266','Manija de puerta trasera, exterior'),
('267','Manija de puerta trasera, interior'),
('268','Manija de puerta, interior'),
('269','Manija interior de la puerta'),
('270','Marco'),
('271','Marco del parabrisas'),
('272','Marker / Fog Light, Delantero'),
('273','Medidor de flujo de aire'),
('274','Módulo Ctrl de la bolsa de aire'),
('275','Módulo de encendido (ver también Ignitor / Coil)'),
('276','Moldeado (panel de cuarto / lado de cama)'),
('277','Moldeado (parabrisas)'),
('278','Moldeado (puerta delantera)'),
('279','Moldeado (Rocker)'),
('280','Moldeado (tapa / portilla / puerta)'),
('281','Moldeo de balancines'),
('282','Moldura (puerta trasera)'),
('283','Moldura (puerta trasera)'),
('284','Moldura de defensa'),
('285','Moldura de la tapa del maletero'),
('286','Moldura de puerta delantera'),
('287','Molduras (Fender)'),
('288','Molduras (Misc)'),
('289','Molduras de cuarto'),
('290','Molduras para Puertas Traseras'),
('291','Molduras para puertas traseras'),
('292','Montaje de la rodilla (ver también Soporte de apoyo)'),
('293','Montaje del cinturón de seguridad delantero'),
('294','Montaje del cinturón de seguridad trasero'),
('295','Montaje del desplazador (piso)'),
('296','Montaje del piso'),
('297','Montaje delantero (nariz)'),
('298','Motor'),
('299','Motor de arranque'),
('300','Motor de cuarto de ventana'),
('301','Motor de dirección asistida'),
('302','Motor de elevación del portón trasero'),
('303','Motor de la caja del ordenador'),
('304','Motor de la lavadora de la ventana trasera'),
('305','Motor de la lavadora de ventanas, trasero'),
('306','Motor de la lavadora del faro solamente'),
('307','Motor de la ventana de la puerta delantera'),
('308','Motor de la ventana de la puerta trasera'),
('309','Motor de la ventana de la puerta trasera'),
('310','Motor de puerta eléctrico (no ventana)'),
('311','Motor de soplador'),
('312','Motor de ventana'),
('313','Motor del asiento'),
('314','Motor del calentador'),
('315','Motor del cinturón de seguridad'),
('316','Motor del faro'),
('317','Motor del lavaparabrisas (frontal)'),
('318','Motor del limpiacristales solamente'),
('319','Motor del limpiaparabrisas trasero'),
('320','Motor del limpiaparabrisas, delante (parabrisas)'),
('321','Motor del techo solar'),
('322','Motor eléctrico de caja de transferencia'),
('323','Motor eléctrico de ventana'),
('324','Nariz (Conjunto del extremo delantero)'),
('325','Neumático'),
('326','Núcleo de transmisión'),
('327','Núcleo de Turbo / Sobrealimentador'),
('328','Núcleo del calentador'),
('329','Núcleo del caso de transferencia'),
('330','Núcleo del motor'),
('331','Nudillo de dirección (ver también rodilla y puntal)'),
('332','Obturador de aire'),
('333','Obturador de aire del radiador'),
('334','Oil Pan, Transmisión'),
('335','Ordenador de control de A / C'),
('336','Ordenador de crucero'),
('337','Ordenador de frenos antibloqueo'),
('338','Ornamento de la capilla'),
('339','Panel basculante (vea también Pilar central)'),
('340','Panel de acabado trasero'),
('341','Panel de ajuste interior, puerta (frontal)'),
('342','Panel de ajuste interior, puerta (posterior)'),
('343','Panel de encabezado'),
('344','Panel de instrumentos'),
('345','Panel de la puerta delantera'),
('346','Panel de la puerta trasera'),
('347','Panel de la puerta trasera'),
('348','Panel de recorte interior (puerta / tapa)'),
('349','Panel de recorte interior (trimestre)'),
('350','Panel de recorte interior, puerta (trasera)'),
('351','Panel de relleno para parachoques'),
('352','Panel de reparación de cuartos'),
('353','Panel de techo (ver también techo solar)'),
('354','Panel de ventilación del capó'),
('355','Panel del cuarto'),
('356','Panel delantero de la cama de la recogida'),
('357','Panel Frontal de la Cama (Pickup)'),
('358','Panel interior de la defensa'),
('359','Panel trasero del cuerpo'),
('360','Pantalla de información (consulte también Radio o Calentador / Control de CA)'),
('361','Pantalla de TV (vea también Radio o Calentador / Control de CA)'),
('362','Pantalla GPS (vea también Radio o Calentador / Control AC)'),
('363','Parabrisas'),
('364','Parachoques delantero'),
('365','Parachoques trasero (incluye cubierta)'),
('366','Parachoques trasero Barra de cara'),
('367','Parachoques Trasero Refuerzo / Misceláneo'),
('368','Paragolpes trasero'),
('369','Parasol'),
('370','Parte delantera del haz de ejes (2WD, incl I Beam Susp)'),
('371','Parte eléctrica Miscelánea y cableado'),
('372','Pedal de freno / embrague'),
('373','Percha'),
('374','Persiana'),
('375','Pestillos'),
('376','Piezas del Acelerador'),
('377','Pila de combustible'),
('378','Pilar central'),
('379','Piso de la cama (Pickup)'),
('380','Pista de Asiento, Sólo Frente'),
('381','Pistola de aceite del motor'),
('382','Pistón'),
('383','Placa de apoyo trasera'),
('384','Placa de apoyo, Frontal'),
('385','Placa de presión'),
('386','Plato flexible'),
('387','Polea de manivela (equilibrador de armónicos)'),
('388','Portabicicletas de repuesto'),
('389','Portaequipajes'),
('390','Potencia de frenado Booster'),
('391','Protector de parachoques (delantero)'),
('392','Protector de parachoques (trasero)'),
('393','Protector de parachoques delantero'),
('394','Protector de parachoques trasero'),
('395','Proyector de la cámara'),
('396','Puente de eje trasero (FWD)'),
('397','Puerta / tapa'),
('398','Puerta de llenado de combustible'),
('399','Puerta del faro'),
('400','Puerta Frente'),
('401','Puerta panel de ajuste interior'),
('402','Puerta principal'),
('403','Puerta Trasera (lado del vehículo)'),
('404','Puerta trasera (lado del vehículo)'),
('405','Puerta trasera (por encima del parachoques trasero)'),
('406','Puerta trasera (puerta sobre parachoques trasero)'),
('407','Puerta trasera / Tapa'),
('408','Puerta trasera / Tapa del maletero'),
('409','Puerta trasera de vidrio'),
('410','Radiador'),
('411','Radiador / Condensador mtd. Ventilador'),
('412','Radio / CD (vea también Control de A / C o Pantalla de TV)'),
('413','Rag Joint (ver también acoplador de dirección)'),
('414','Recipiente de vapor'),
('415','Recoge la cama lateral'),
('416','Recogida del suelo de la cama'),
('417','Refuerzo parachoques (delantero)'),
('418','Refuerzo parachoques (trasero)'),
('419','Refuerzo parachoques delantero'),
('420','Regulador automático de los faros'),
('421','Regulador de la ventana de la puerta'),
('422','Regulador de la ventana de la puerta trasera'),
('423','Regulador de la ventana delantera'),
('424','Regulador de puerta delantera'),
('425','Regulador de puerta trasera'),
('426','Regulador de ventana (frontal)'),
('427','Regulador de ventana (trasero)'),
('428','Regulador de ventanilla'),
('429','Regulador de vidrio para puerta trasera'),
('430','Regulador de vidrio trasero'),
('431','Regulador de voltaje'),
('432','Regulador del vidrio del respiradero de la puerta delantera'),
('433','Reja'),
('434','Relé (Misc)'),
('435','Reloj'),
('436','Reposacabezas'),
('437','Reproductor de CD / Radio'),
('438','Reservorio de dirección asistida'),
('439','Resonador de escape'),
('440','Revestimiento de la cama'),
('441','Revestimiento interior de defensa'),
('442','Rieles superiores e inferiores del bastidor'),
('443','Rotor / tambor de freno, trasero'),
('444','Rueda (pantalla sin imagen)'),
('445','Rueda (pantalla w imagen)'),
('446','Sensor (Chasis, Miscelánea)'),
('447','Sensor (Cuerpo, Varios)'),
('448','Sensor (Drivetrain, Misc)'),
('449','Señal de giro / lámpara de niebla'),
('450','Separador de agua'),
('451','Servo / Regulador de Control de Velocidad'),
('452','Servofreno'),
('453','Silenciador de escape'),
('454','Sobrealimentador / turbocompresor'),
('455','Sólo alojamiento de eje'),
('456','Sólo anillo y piñón'),
('457','Sólo barra estabilizadora'),
('458','Sólo brida diferencial'),
('459','Sólo en la parte delantera del bastidor'),
('460','Soporte de eje Fr (4WD con alojamiento)'),
('461','Soporte de torre de puntal'),
('462','Soporte de transmisión'),
('463','Soporte del núcleo (radiador)'),
('464','Soporte del radiador'),
('465','Soportes del motor'),
('466','Spoiler, Delantero'),
('467','Strut (ver también Knee Assy)'),
('468','Suspensión trasera (véase también Brazos de control)'),
('469','Switch de ignición'),
('470','Tablas de correr'),
('471','Tacómetro'),
('472','Tanque de almacenamiento al vacío'),
('473','Tanque de fluido de escape'),
('474','Tanque de gas'),
('475','Tapa / puerta'),
('476','Tapa central (rueda)'),
('477','Tapa de combustible'),
('478','Tapa de la capucha / carcasa del campista'),
('479','Tapa de la cubierta'),
('480','Tapa de la gasolina'),
('481','Tapa de la válvula'),
('482','Tapa del eje / cubierta de la rueda (imagen de la pantalla w)'),
('483','Tapa del eje / cubierta de la rueda (pantalla sin imagen)'),
('484','Tapa del maletero'),
('485','Tapa del maletero / bisagra de la escotilla'),
('486','Tapa del maletero / Choque de escotilla'),
('487','Tapa del maletero / escotilla'),
('488','Tapa del tronco'),
('489','Tapa interior panel de tapa'),
('490','Taxi'),
('491','Techo'),
('492','Techo solar / T-Top'),
('493','Tensor de la correa'),
('494','Tercera luz de freno'),
('495','Tirador de puerta exterior'),
('496','Tirador de puerta, exterior'),
('497','Tirante'),
('498','Trans OD Unit (ver también Transmisión)'),
('499','Transferir caso'),
('500','Transmisión'),
('501','Transmisión de Bellhousing solamente'),
('502','Transmisión de la bomba delantera'),
('503','Transmisión Transmisión'),
('504','Trasera de haz de ejes (FWD)'),
('505','Travesaño trasero'),
('506','TTop / techo solar'),
('507','Tubo de Aire / Resonador'),
('508','Tubo de cola de escape'),
('509','Tubo de escape'),
('510','Tubo de escape'),
('511','Tubo del tubo de escape'),
('512','Turbocompresor / sobrealimentador'),
('513','Un pilar'),
('514','Unidad de envío del tanque de combustible'),
('515','Unidad de sobremarcha (véase también Transmisión)'),
('516','Unidad por cable'),
('517','Uniside'),
('518','Valance, Delantero'),
('519','Valance, trasero'),
('520','Valida inferior trasera'),
('521','Válvula de control de dirección hidráulica'),
('522','Válvula de EGR'),
('523','Válvula de Proporción de Freno'),
('524','Valvula delantera'),
('525','Velocímetro (véase también Clúster Instr.)'),
('526','Ventana de cuarto'),
('527','Ventana de la puerta trasera'),
('528','Ventana de puerta trasera'),
('529','Ventilador de condensador de aire acondicionado'),
('530','Ventilador de refrigeración (Rad y Con mtd.)'),
('531','Vidrio de la puerta delantera'),
('532','Vidrio del respiradero de la puerta delantera'),
('533','Vidrio especial'),
('534','Vidrio trasero'),
('535','Vidrio, espalda'),
('536','Vidrio, Especial (véase también Techo solar / TTop)'),
('537','Vidrio, Parabrisas'),
('538','Vidrio, puerta delantera'),
('539','Vidrio, puerta trasera'),
('540','Vidrio, ventilación frontal'),
('541','Vínculo del limpiaparabrisas'),
('542','Visualización Heads Up'),
('543','Volante'),
('544','Volante'),
('545','Yoke / Articulación en U'),
('546','Zapatas de Freno / Almohadillas') 

create table Parte(
[noSeq] int identity(1,1) primary key,
[idParte] int Not Null references listaParte,
[idCategoriaParte] int Not Null references CategoriaParte,
[descripcion] varchar(250)  Null,
[idProveedor] int Null,
[idProvincia] int Null,
[idCanton] int Null,
foreign key(idProvincia,idCanton) references Canton,
[codProveedor] varchar(100)  Null,
[estado] tinyint Null,
[clasificacion] int Null references Clasificacion,
[precio] float Null,
[envio] bit Null,
[costoEnvio] float Null,
[imagen] varchar(250)  Null);

create table ParteVehiculo(
NoSeq int identity(1,1) primary key,
[idParte] int Not Null references Parte,
[idCategoriaParte] int Not Null references CategoriaParte,
[idMarcaVehiculo] int Not Null,
[idModeloVehiculo] int Not Null,
[anno] varchar(4)  Not Null,
foreign key([idMarcaVehiculo],[idModeloVehiculo]) references ModeloVehiculo,
unique(idParte,idCategoriaParte,idMarcaVehiculo,idModeloVehiculo,anno));

--alter table Usuario drop constraint FK__Usuario__Proveed__2C3393D0
--sp_help ParteVehiculo

Create table telefonoProveedor (
[idProveedor] int Not Null references Proveedor,
[idTipoTelefono] int Not Null references tipoTelefono,
[telefono] varchar(50)  Not Null primary key([idProveedor],[telefono]),
);
insert into telefonoProveedor values (1,4,'2102-9090'),(1,1,'2440-6484'),(1,2,'8860-2745')

Create table Imagenes (
[id] int identity(1,1) Not Null primary key,
[idParte] int Null references Parte,
[idProveedor] int Null references Proveedor,
[rutaImagen] varchar(200)  Null,
);


Create table cotizaciones (
[idCotizacion] int Not Null primary key,
[descripcion] varchar(300)  Null,
[idMarca] int Null,
[idModelo] int Null,
foreign key ([idMarca],[idModelo]) references ModeloVehiculo,
[año] varchar(4)  Null,
[otrosDatos] varchar(300)  Null,
[idUsuario] int Null references Usuario,
[estado] bit Null,
[imagen] varchar(250)  Null,
);

Create table BitacoraBusqueda (
[idBitacora] int Not Null primary key,
[anno] varchar(50)  Null,
[idMarca] int Null,
[idModelo] int Null,
foreign key ([idMarca],[idModelo]) references ModeloVehiculo,
[Categoria] int Null references CategoriaParte,
[Parte] varchar(150)  Null,
[Provincia] int Null,
[canton] int Null,
foreign key ([Provincia],[canton]) references Canton
);
--Select * from information_schema.Tables where Table_Type='BASE TABLE'
go

create view vw_VistaPartes
as
Select distinct 
                             (SELECT       distinct  anno + ','
                               FROM            ParteVehiculo
                               WHERE        idParte = a.noSeq FOR xml raw(''), elements) anno,
                             (SELECT       distinct  concat(ParteVehiculo.idMarcaVehiculo, ',')
                               FROM            ParteVehiculo
                               WHERE        idParte = a.noSeq FOR xml raw(''), elements) Marca,
                             (SELECT     distinct   concat(x.Modelo, ',')
                               FROM            ModeloVehiculo x inner join ParteVehiculo y on x.idModelo=y.idModeloVehiculo and y.idParte=a.noSeq   FOR xml raw(''), elements) Modelo,
                             (SELECT    distinct     concat(Provincia.provincia, ',')
                               FROM            Provincia
                               WHERE        idProvincia = a.idProvincia FOR xml raw(''), elements) Provincia,
                             (SELECT    distinct     concat(Canton.Canton, ',')
                               FROM            Canton
                               WHERE        idCanton = a.idCanton and idProvincia=a.idProvincia FOR xml raw(''), elements) Canton,
							   a.idParte,c.categoria,b.NombreProveedor,a.precio,a.imagen,a.descripcion,a.noSeq
from Parte a 
inner join Proveedor b on a.idProveedor=b.idProveedor
inner join CategoriaParte c on a.idCategoriaParte=c.idCategoriaParte
go
create view vw_InfoParte
as
SELECT        dbo.Parte.descripcion AS Parte, dbo.Clasificacion.descripcion AS Clasificacion, dbo.Parte.precio, dbo.Provincia.provincia, dbo.Canton.Canton, dbo.Parte.idParte, dbo.Parte.noSeq, dbo.Parte.idProveedor
FROM            dbo.Canton INNER JOIN
                         dbo.Parte ON dbo.Canton.idProvincia = dbo.Parte.idProvincia AND dbo.Canton.idCanton = dbo.Parte.idCanton INNER JOIN
                         dbo.Provincia ON dbo.Canton.idProvincia = dbo.Provincia.idProvincia INNER JOIN
                         dbo.Clasificacion ON dbo.Parte.clasificacion = dbo.Clasificacion.id
go

create view vw_InfoParteVehiculo
as
SELECT        dbo.MarcaVehiculo.Marca, dbo.ModeloVehiculo.Modelo, dbo.ParteVehiculo.anno, dbo.ParteVehiculo.idParte
FROM            dbo.MarcaVehiculo INNER JOIN
                         dbo.ModeloVehiculo ON dbo.MarcaVehiculo.idMarca = dbo.ModeloVehiculo.idMarca INNER JOIN
                         dbo.ParteVehiculo ON dbo.ModeloVehiculo.idMarca = dbo.ParteVehiculo.idMarcaVehiculo AND dbo.ModeloVehiculo.idModelo = dbo.ParteVehiculo.idModeloVehiculo
go

create view vw_InfoProveedorParte
as
SELECT        dbo.Proveedor.NombreProveedor, dbo.tipoProveedor.tipoProveedor, dbo.Provincia.provincia, dbo.Canton.Canton, dbo.Proveedor.direccion, dbo.Proveedor.idProveedor, dbo.Proveedor.email
FROM            dbo.Canton INNER JOIN
                         dbo.Proveedor ON dbo.Canton.idProvincia = dbo.Proveedor.idProvincia AND dbo.Canton.idCanton = dbo.Proveedor.idCanton INNER JOIN
                         dbo.Provincia ON dbo.Canton.idProvincia = dbo.Provincia.idProvincia INNER JOIN
                         dbo.tipoProveedor ON dbo.Proveedor.tipoProveedor = dbo.tipoProveedor.idTipoProveedor
go

create view vw_InfoCotizaciones
as
SELECT        dbo.cotizaciones.idCotizacion, dbo.cotizaciones.descripcion, dbo.MarcaVehiculo.Marca, dbo.ModeloVehiculo.Modelo, dbo.cotizaciones.año, dbo.cotizaciones.otrosDatos, dbo.cotizaciones.idUsuario, dbo.cotizaciones.estado, 
                         dbo.cotizaciones.imagen
FROM            dbo.cotizaciones INNER JOIN
                         dbo.MarcaVehiculo ON dbo.cotizaciones.idMarca = dbo.MarcaVehiculo.idMarca INNER JOIN
                         dbo.ModeloVehiculo ON dbo.cotizaciones.idMarca = dbo.ModeloVehiculo.idMarca AND dbo.cotizaciones.idModelo = dbo.ModeloVehiculo.idModelo AND dbo.MarcaVehiculo.idMarca = dbo.ModeloVehiculo.idMarca
go

create procedure sp_GuardarParte
@noSeq int,
@idParte int,
@idCategoriaParte int,
@descripcion varchar(250),
@idProveedor int,
@idProvincia int,
@idCanton int,
@codProveedor varchar(100),
@estado tinyint,
@clasificacion int,
@precio float,
@envio bit,
@costoEnvio float,
@imagen varchar(250)
as
if exists (select noSeq from Parte where noSeq = @noSeq)
begin
	update Parte set idParte = @idParte, idCategoriaParte = @idCategoriaParte, descripcion = @descripcion, idProveedor = @idProveedor, idProvincia = @idProvincia, idCanton = @idCanton, codProveedor = @codProveedor, estado = @estado, clasificacion = @clasificacion, precio = @precio, envio = @envio, costoEnvio = @costoEnvio,imagen = @imagen where noSeq = @noSeq
end
else
begin
	insert into Parte(idParte,idCategoriaParte,descripcion,idProveedor,idProvincia,idCanton,codProveedor,estado,clasificacion,precio,envio,costoEnvio,imagen) values (@idParte,@idCategoriaParte,@descripcion,@idProveedor,@idProvincia,@idCanton,@codProveedor,@estado,@clasificacion,@precio,@envio,@costoEnvio,@imagen)
	set @NoSeq=(Select max(NoSeq) from Parte)
end
Select @NoSeq
go

create procedure sp_GuardarImagen
@idParte int,
@idProveedor int,
@rutaImagen varchar(200),
@id int
as
if exists (select id from Imagenes where id = @id)
begin
	update Imagenes set idParte = @idParte, idProveedor = @idProveedor, rutaImagen = @rutaImagen where id = @id
	return @id
end
else
begin
	insert into Imagenes(idParte,idProveedor,rutaImagen) values (@idParte,@idProveedor,@rutaImagen)
	return SCOPE_IDENTITY()
end
go

create procedure sp_GuardarVehiculo
@noSeq int,
@idParte int,
@idCategoriaParte int,
@idMarcaVehiculo int,
@idModeloVehiculo int,
@anno varchar(4)
as
if exists (select NoSeq from ParteVehiculo where NoSeq = @noSeq)
begin
	update ParteVehiculo set idParte = @idParte,idCategoriaParte = @idCategoriaParte,idMarcaVehiculo = @idMarcaVehiculo, idModeloVehiculo = @idModeloVehiculo, anno = @anno where NoSeq = @noSeq;
	return @noSeq
end
else
begin
	insert into ParteVehiculo(idParte,idCategoriaParte,idMarcaVehiculo,idModeloVehiculo,anno) values(@idParte,@idCategoriaParte,@idMarcaVehiculo,@idModeloVehiculo,@anno)
	return SCOPE_IDENTITY()
end
go

create procedure sp_GuardarCotizacion
@idCotizacion int,
@descripcion varchar(300),
@idMarca int,
@idModelo int,
@año varchar(4),
@otrosDatos varchar(300),
@idUsuario int,
@estado bit,
@imagen varchar(250)
as
if exists (select @idCotizacion from cotizaciones where idCotizacion = @idCotizacion)
begin
	update cotizaciones set descripcion = @descripcion, idMarca = @idMarca,idModelo = @idModelo,año = @año, otrosDatos = @otrosDatos,idUsuario = @idUsuario,estado = @estado, imagen = @imagen where idCotizacion = @idCotizacion
end
else
begin
	set @idCotizacion =(select ISNULL(Max(idCotizacion) + 1,1) from cotizaciones)
	insert into cotizaciones(idCotizacion,descripcion,idMarca,idModelo,año,otrosDatos,idUsuario,estado,imagen)
	values(@idCotizacion,@descripcion,@idMarca,@idModelo,@año,@otrosDatos,@idUsuario,@estado,@imagen)
end
go
create view Vw_ListaProveedores
as
Select idProveedor,b.tipoProveedor,cedula,a.NombreProveedor,descripcion,c.Canton,d.provincia,a.direccion,email,a.logo,(Select concat(b.tipoTelefono,' - ',a.telefono,', ') from telefonoProveedor a inner join tipoTelefono b on a.idTipoTelefono=b.idTtipoTelefono for xml raw(''),elements)telefonos
from Proveedor a 
inner join tipoProveedor b on a.tipoProveedor=b.idTipoProveedor 
inner join Canton c on a.idProvincia=c.idProvincia and a.idCanton=c.idCanton
inner join Provincia d on c.idProvincia=d.idProvincia
go
Select idProveedor,tipoProveedor,cedula,NombreProveedor,descripcion,Canton,provincia,direccion,email,logo,telefonos from Vw_ListaProveedores

Select concat(b.tipoTelefono,' - ',a.telefono,', ') from telefonoProveedor a inner join tipoTelefono b on a.idTipoTelefono=b.idTtipoTelefono for xml raw(''),elements
go
create view Vw_Top10 as
Select top 10 concat(case ROW_NUMBER() over(order by a.Total desc) 
when 1 then '<div class="item active">' else '<div class="item">' 
end,'<img src="',a.logo,'" alt="',a.NombreProveedor,'" style="width:100%;"/>','<div class="carousel-caption">','<h3 style="background-color:rgba(0,0,255,0.5);">Tel: ',(Select top 1 Telefono from TelefonoProveedor where idProveedor=a.idProveedor),'</h3>','<p style="background-color:rgba(0,0,255,0.5);">',a.Direccion,'</p>','</div>')[Div] from (
Select a.NombreProveedor,count(c.NoSeq)Total,a.idProveedor,a.logo,a.direccion
from Proveedor a left join Parte b on a.idProveedor=b.idProveedor left join ParteVehiculo c on b.idParte=c.idParte
group by a.NombreProveedor,a.idProveedor,a.logo,a.direccion)a
order by Total desc
go
Select * from Vw_Top10

/*
<div class="item active">
        <img src="../Imagenes/Diseno/LUJO.png" alt="Taller Lujo" style="width:100%;"/>
        <div class="carousel-caption">
          <h3>Tel: 24406484</h3>
          <p>San Antonio del Tejar, Alajuela</p>
        </div>
      </div>
      <div class="item">
        <img src="../Imagenes/Diseno/TP.png" alt="Ticoparts.co.cr" style="width:100%;"/>
        <div class="carousel-caption">
          <h3>Tel: 24406484</h3>
          <p>San Antonio del Tejar, Alajuela</p>
        </div>
      </div>
      <div class="item">
        <img src="../Imagenes/Diseno/toyosan.png" alt="Toyosan" style="width:100%;"/>
        <div class="carousel-caption">
          <h3>Tel: 2440 1090</h3>
          <p>Coyol, Alajuela</p>
        </div>
      </div>
*/