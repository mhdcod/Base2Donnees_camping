-- remplissage de la base de données 

-- Insertion de clients (joueurs de football célèbres)
INSERT INTO Client (nom, prenom, date_naissance, genre, numero_telephone, adresse_mail, mot_de_passe)
VALUES 
    ('Ronaldo', 'Cristiano', '1985-02-05', 'M', '1234567891', 'cristiano@gmail.com', 'ronaldo123'),
    ('Messi', 'Lionel', '1987-06-24', 'M', '1234567892', 'lionel@gmail.com', 'messi123'),
    ('Neymar', 'Jr', '1992-02-05', 'M', '1234567893', 'neymar@gmail.com', 'neymar123'),
    ('Salah', 'Mohamed', '1992-06-15', 'M', '1234567894', 'salah@gmail.com', 'salah123'),
    ('Mahrez', 'Riyad', '1991-02-21', 'M', '1234567895', 'mahrez@gmail.com', 'mahrez123'),
    ('Lewandowski', 'Robert', '1988-08-21', 'M', '1234567896', 'lewandowski@gmail.com', 'lewandowski123'),
    ('Kane', 'Harry', '1993-07-28', 'M', '1234567897', 'kane@gmail.com', 'kane123'),
    ('De Bruyne', 'Kevin', '1991-06-28', 'M', '1234567898', 'debruyne@gmail.com', 'debruyne123'),
    ('Kroos', 'Toni', '1990-01-04', 'M', '1234567899', 'kroos@gmail.com', 'kroos123'),
    ('Mane', 'Sadio', '1992-04-10', 'M', '1234567800', 'mane@gmail.com', 'mane123');

-- Insertion d'activités
INSERT INTO Activité (nom, prix, date_debut, date_fin, participation_max, contraintes_participation)
VALUES 
    ('Tournoi de football',100.00,'2023-01-01', '2023-01-05',50,'Aucune'),
    ('Match de football',50.00,'2023-01-10', '2023-01-10', 22, 'Aucune'),
    ('Tournoi de tennis',20.00,'2023-02-20', '2023-02-22', 16, 'Aucune'),
    ('Cours de natation',30.00,'2023-03-05', '2023-03-05', 10, 'Savoir nager'),
    ('Randonnée à vélo',15.00,'2023-04-15', '2023-04-15', 12, 'Aucune'),
    ('Yoga en plein air',25.00,'2023-05-01', '2023-05-01', 20, 'Aucune');

-- Insertion d'administrateurs
INSERT INTO Administrateur (nom, prenom, email, mot_de_passe)
VALUES 
    ('MohamedL', 'Admin1', 'admin1@gmail.com', 'admin123'),
    ('MohamedM', 'Admin2', 'admin2@gmail.com', 'admin456');

-- Insertion de réservations
INSERT INTO Reservation (Reservation_id, date_debut, date_fin, statut, Client_Client_id, Administrateur_Administrateur_id)
VALUES 
    (1, '2023-01-01', '2023-01-05', 'En attente', 1, 1),
    (2, '2023-01-02', '2023-01-04', 'Confirmée', 2, 2),
    (3, '2023-01-03', '2023-01-03', 'En attente', 3, 1),
    (4, '2023-04-01', '2023-04-10', 'En attente', 4, 1),
    (5, '2023-05-05', '2023-05-10', 'Confirmée', 5, 2);

-- Insertion de paiements
INSERT INTO Paiement (carte_credit_numero, carte_credit_date_expiration, carte_credit_cvc, Reservation_Reservation_id)
VALUES 
    ('1234567890123456', '2023-12-31', '123', 1),
    ('9876543210987654', '2023-12-31', '456', 2),
    ('5555444433332222', '2023-12-31', '789', 3),
    ('5555666677778888', '2025-08-31', '012', 4),
    ('9999888877776666', '2024-05-31', '345', 5);

-- Insertion de types d'hébergement
INSERT INTO Hebergement_type (nom, nombre_chambres, capacite_max, image)
VALUES 
    ('Suite de luxe', 2, 4, 'suite_luxe.jpg'),
    ('Chambre standard', 1, 2, 'chambre_standard.jpg'),
    ('Appartement', 3, 6, 'appartement.jpg'),
    ('Cabane', 1, 2, 'cabane.jpg'),
    ('Villa', 4, 8, 'villa.jpg');

-- Insertion de parkspots
INSERT INTO ParkSpot (localisation, image, Administrateur_Administrateur_id)
VALUES 
    ('Stade A', 'stade_a.jpg', 1),
    ('Stade B', 'stade_b.jpg', 2),
    ('Stade C', 'stade_c.jpg', 1),
    ('Stade D', 'stade_d.jpg', 2),
    ('Stade E', 'stade_e.jpg', 1);

-- Insertion d'offres
INSERT INTO offre (date_debut, date_fin, nouveau_prix, Administrateur_Administrateur_id)
VALUES 
    ('2023-01-01', '2023-01-05', 500, 1),
    ('2023-01-02', '2023-01-04', 300, 2),
    ('2023-01-03', '2023-01-03', 0, 1);

-- Insertion d'hébergements
INSERT INTO Hebergement (prix_journalier, prix_petit_dejeuner, offre, offre_date_debut, offre_date_fin, offre_nouveau_prix, Hebergement_type_Hebergement_type_id, ParkSpot_ParkSpot_id, offre_offre_id, Administrateur_Administrateur_id)
VALUES 
    (150, 20, 1, '2023-01-01', '2023-01-05', 400, 1, 1, 1, 1),
    (100, 15, 2, '2023-01-02', '2023-01-04', 285, 1, 2, 2, 2),
    (80, 10, 3, '2023-01-03', '2023-01-03', 0, 2, 3, 3, 1);

-- Insertion de liaisons entre hébergements et réservations
INSERT INTO Hebergement_has_Reservation (Hebergement_Hebergement_id, Reservation_Reservation_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3);


-- Insertion de liaisons entre réservations et activités
INSERT INTO Reservation_has_Activité (Reservation_Reservation_id, Activité_activite_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3);
