BEGIN;

CREATE TABLE IF NOT EXISTS Films (
       codefilm INT PRIMARY KEY,
       nomfilm VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Clients (
       codecli INT PRIMARY KEY,
       prenomcli VARCHAR(30) NOT NULL,
       nomcli VARCHAR(30) NOT NULL,
       ruecli VARCHAR(145) NOT NULL,
       cpcli INT NOT NULL,
       villecli VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Locations (
       codecli INT NOT NULL,
       codefilm INT NOT NULL,
       datedebut DATE NOT NULL,
       duree SMALLINT NOT NULL,
       FOREIGN KEY (codecli) REFERENCES Clients(codecli),
       FOREIGN KEY (codefilm) REFERENCES Films(codefilm)
);

COMMIT;