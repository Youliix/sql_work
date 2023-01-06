BEGIN;

INSERT INTO clients(codecli, prenomcli, nomcli, ruecli, cpcli, villecli)
VALUES
  (12, 'Thomas', 'Andurand', '21, rue des affections', 33000, 'Bordeaux');

ALTER TABLE clients 
ADD COLUMN television VARCHAR(30);

ALTER TABLE clients
DROP COLUMN cpcli;

UPDATE clients
SET prenomcli = 'Michelle'
WHERE codecli = 9;

DELETE FROM Locations
WHERE duree = 5;

DROP TABLE locations;

COMMIT;