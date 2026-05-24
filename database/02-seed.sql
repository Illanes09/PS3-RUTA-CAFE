INSERT IGNORE INTO city (id, name) VALUES
(1, 'Cochabamba'),
(2, 'La Paz'),
(3, 'Santa Cruz de la Sierra');

INSERT IGNORE INTO users (id, name, lastName, secondLastName, email, password, phone, City_id, role, has_fingerprint, createdAt) VALUES
(1, 'Roberto', 'Mendoza', 'Quispe', 'admin.rutacafe@rutadelsabor.bo', '$2b$10$fa9Msmtg7knxYOOzB3603.xhQclGfN1aRg7FZZUOd1qyyCNsmCFi6', '+591 71456789', 1, 1, 0, NOW()),
(2, 'Elena', 'Vargas', 'Mamani', 'tecnico.rutacafe@rutadelsabor.bo', '$2b$10$dsilFaZabPv9kmcn2SC1A.wnsIDJOg6ldUQfzGrvo8nAsys1EKqwW', '+591 71567890', 1, 2, 0, NOW()),
(3, 'Sofia', 'Rios', 'Flores', 'cliente.rutacafe@rutadelsabor.bo', '$2b$10$UBKiPPA5W1/eRxvM9dbQou7wOeMuiii9bQqxIQESPDG6gQm6G8Yai', '+591 71678901', 1, 3, 0, NOW()),
(4, 'Maria', 'Condori', 'Apaza', 'maria.condori@rutadelsabor.bo', '$2b$10$KuMLcAZ.kSYt5WsjyvcGk.F9xn0bX/qmNNGcPWCr3QVk/pluK7bLy', '+591 71789012', 1, 3, 0, NOW()),
(5, 'Carlos', 'Aguilar', 'Soto', 'carlos.aguilar@rutadelsabor.bo', '$2b$10$8zzxNFXv0Ru8J.N9Wy9uzeyz/kf1x43EMT0idccUroF8BwG1ZpU3C', '+591 71890123', 1, 2, 0, NOW());
