

select * from benutzer
-- -----------------------------------------------------
-- Table benutzer
-- -----------------------------------------------------
CREATE TABLE benutzer (
  Benutzer_id INT NOT NULL IDENTITY(1,1),
  Vorname VARCHAR(20) NOT NULL DEFAULT '',
  Nachname VARCHAR(20) NOT NULL DEFAULT '',
  email VARCHAR(255) NOT NULL,
  Bevorzugungen TEXT NOT NULL,
  erstellt_am DATETIME NOT NULL,
  upgedatet_am  DATETIME NOT NULL,
  password varchar(255) NOT NULL, 
  username as (vorname + Nachname)
  PRIMARY KEY (Benutzer_id))

  
  
-- -----------------------------------------------------
-- Table Kontakte
-- -----------------------------------------------------

CREATE TABLE Kontakte (
  Kontakte_id INT NOT NULL,
  Vorname VARCHAR(20) NOT NULL DEFAULT '',
  Nachname VARCHAR(20) NOT NULL DEFAULT '',
  PRIMARY KEY (Kontakte_id))

-- -----------------------------------------------------
-- Table  KontTel
-- -----------------------------------------------------
CREATE TABLE  KontTel(
  KontTel_id INT NOT NULL,
  Telefon_id INT NOT NULL,
  Kontakte_id INT NOT NULL,
  erstellt_am VARCHAR(45) NOT NULL,
  PRIMARY KEY (KontTel_id))

-- -----------------------------------------------------
-- Table   Telefon
-- -----------------------------------------------------

CREATE TABLE  Telefon(
  Telefon_id INT NOT NULL,
  TelefonNr int NOT NULL DEFAULT '',
  PRIMARY KEY (Telefon_id))

-- -----------------------------------------------------
-- Table Konversation
-- -------------------------------------------------

CREATE TABLE Konversation (
  Konversation_id INT NOT NULL IDENTITY(1,1),
  title VARCHAR(40) NOT NULL,
  ersteller_id INT NOT NULL,
  erstellt_am DATETIME NOT NULL,
  upgedatet_am DATETIME NOT NULL,
  geloschet_am DATETIME NOT NULL,
  PRIMARY KEY (Konversation_id))

-- -----------------------------------------------------
-- Table messages
-- -----------------------------------------------------

CREATE TABLE messages (
  messages_id INT NOT NULL,
  guid VARCHAR(100) NOT NULL,
  Konversation_id INT NOT NULL,
-- - message_type ENUM('text', 'image', 'vedio', 'audio') NOT NULL,
  message_type VARCHAR(6) CHECK (message_type IN ('text', 'image', 'vedio', 'audio')) NOT NULL,
  message VARCHAR(255) NOT NULL DEFAULT '',
  Anhang_thumb_url VARCHAR(255) NOT NULL DEFAULT '',
  erstellt_am DATETIME NOT NULL,
  geloschet_am DATETIME NOT NULL,
  PRIMARY KEY (messages_id))

-- -----------------------------------------------------
-- Table participants
-- -----------------------------------------------------

CREATE TABLE Teilnehmer (
  Teilnehmer_id INT NOT NULL IDENTITY(1,1),
  Konversation_id INT NOT NULL,
  benutzer_id INT NOT NULL,
 -- type ENUM('single', 'group') NOT NULL,
  type varchar(6) check (type in ('single', 'group')) not null,
  erstellt_am DATETIME NOT NULL,
  upgedatet_am DATETIME NOT NULL,
  PRIMARY KEY (Teilnehmer_id))

-- -----------------------------------------------------
-- Table blockierte_liste
-- -----------------------------------------------------

CREATE TABLE blockierte_liste (
  blockListe_id INT NOT NULL IDENTITY(1,1),
  benutzer_id INT NOT NULL,
  Teilnehmer_id INT NOT NULL,
  erstellt_am DATETIME NOT NULL,
  PRIMARY KEY (blockListe_id))

-- -----------------------------------------------------
-- Table geloeschte_Konversationen
-- -----------------------------------------------------

CREATE TABLE geloeschte_Konversationen (
  geloeschte_Konversationen_id INT NOT NULL,
  Teilnehmer_id INT NOT NULL,
  benutzer_id INT NOT NULL,
  erstellt_am datetime NOT NULL,
  PRIMARY KEY (geloeschte_Konversationen_id))

-- -----------------------------------------------------
-- Table geloeschte_messages
-- -----------------------------------------------------

CREATE TABLE geloeschte_messages (
  geloeschte_messages_id INT NOT NULL IDENTITY(1,1),
  messages_id INT NOT NULL,
  users_id INT NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (geloeschte_messages_id))


-- -----------------------------------------------------
-- Table benutzer_kontakt
-- -----------------------------------------------------

CREATE TABLE benutzer_kontakt (
  benutzer_id INT NOT NULL,
  Kontakte_id INT NOT NULL,
  Vorname VARCHAR(45) NOT NULL DEFAULT '',
  Nachname VARCHAR(45) NOT NULL DEFAULT '',
  erstellt_am datetime NOT NULL,
  upgedatet_am DATETIME NOT NULL,
  PRIMARY KEY (benutzer_id, Kontakte_id))




-- -----------------------------------------------------
-- Table benutzer_verification
-- -----------------------------------------------------

CREATE TABLE benutzer_verification (
  benutzer_id INT NOT NULL,
  verification_code VARCHAR(45) NOT NULL,
  erstellt_am datetime NOT NULL)
