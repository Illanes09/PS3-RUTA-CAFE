-- Repoblar base de datos: Cochabamba, Bolivia
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE favorites;
TRUNCATE TABLE likes;
TRUNCATE TABLE comment;
TRUNCATE TABLE placeschedule;
TRUNCATE TABLE place_images;
TRUNCATE TABLE place;
TRUNCATE TABLE route;
TRUNCATE TABLE advertising;
TRUNCATE TABLE users;
TRUNCATE TABLE city;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO city (id, name) VALUES
(1, 'Cochabamba'),
(2, 'La Paz'),
(3, 'Santa Cruz de la Sierra');

INSERT INTO users (id, name, lastName, secondLastName, email, password, phone, City_id, role, has_fingerprint, createdAt) VALUES
(1, 'Roberto', 'Mendoza', 'Quispe', 'admin.rutacafe@rutadelsabor.bo', '$2b$10$fa9Msmtg7knxYOOzB3603.xhQclGfN1aRg7FZZUOd1qyyCNsmCFi6', '+591 71456789', 1, 1, 0, NOW()),
(2, 'Elena', 'Vargas', 'Mamani', 'tecnico.rutacafe@rutadelsabor.bo', '$2b$10$dsilFaZabPv9kmcn2SC1A.wnsIDJOg6ldUQfzGrvo8nAsys1EKqwW', '+591 71567890', 1, 2, 0, NOW()),
(3, 'Sofia', 'Rios', 'Flores', 'cliente.rutacafe@rutadelsabor.bo', '$2b$10$UBKiPPA5W1/eRxvM9dbQou7wOeMuiii9bQqxIQESPDG6gQm6G8Yai', '+591 71678901', 1, 3, 0, NOW()),
(4, 'Maria', 'Condori', 'Apaza', 'maria.condori@rutadelsabor.bo', '$2b$10$KuMLcAZ.kSYt5WsjyvcGk.F9xn0bX/qmNNGcPWCr3QVk/pluK7bLy', '+591 71789012', 1, 3, 0, NOW()),
(5, 'Carlos', 'Aguilar', 'Soto', 'carlos.aguilar@rutadelsabor.bo', '$2b$10$8zzxNFXv0Ru8J.N9Wy9uzeyz/kf1x43EMT0idccUroF8BwG1ZpU3C', '+591 71890123', 1, 2, 0, NOW());

INSERT INTO route (id, name, description, status, image_url, createdBy, createdAt) VALUES
(1, 'Ruta del Cafe - Centro Historico', 'Recorrido por cafeterias emblematicas del centro de Cochabamba, cerca de la Plaza 14 de Septiembre y calles coloniales.', 'aprobada', '', 1, NOW()),
(2, 'Ruta del Cafe - Zona Norte', 'Cafes modernos y espacios de trabajo en la zona norte de la ciudad, ideal para reuniones y estudio.', 'aprobada', '', 2, NOW()),
(3, 'Ruta del Cafe - Avenida America', 'Seleccion de cafeterias artesanales a lo largo de la Avenida America y calles aledanas.', 'aprobada', '', 5, NOW());

INSERT INTO place (id, name, description, latitude, longitude, route_id, webSite, phoneNumber, image_url, status, createdBy, createdAt) VALUES
(1, 'Cafe Viena', 'Cafeteria clasica del centro con tradicion cochabambina. Especialidad en cafe pasado y pasteles caseros.', -17.393200, -66.156900, 1, 'https://cafeviena.bo', '+591 4 4256789', '', 'aprobada', 2, NOW()),
(2, 'Alexander Coffee', 'Cafe de especialidad con granos bolivianos de Yungas. Ambiente acogedor y reposteria artesanal.', -17.378900, -66.154300, 1, 'https://alexandercoffee.bo', '+591 4 4267890', '', 'aprobada', 2, NOW()),
(3, 'Etnofood Cafe', 'Espacio gastronomico que combina cafe de origen con productos organicos de los valles cochabambinos.', -17.401200, -66.168800, 2, 'https://etnofood.bo', '+591 4 4278901', '', 'aprobada', 5, NOW()),
(4, 'The Best Coffee CBBA', 'Cafeteria especializada en metodos de filtrado manual y latte art. Muy popular entre estudiantes universitarios.', -17.369800, -66.145600, 2, '', '+591 4 4289012', '', 'aprobada', 5, NOW()),
(5, 'Cafe del Mundo', 'Cafe tematico con decoracion internacional y menu variado de bebidas calientes y frias.', -17.385600, -66.161200, 3, 'https://cafedelmundo.bo', '+591 4 4290123', '', 'aprobada', 2, NOW()),
(6, 'Java Times Cafe', 'Cadena local con excelente wifi y ambiente para teletrabajo. Cafe americano y capuchinos consistentes.', -17.392100, -66.172300, 2, 'https://javatimes.bo', '+591 4 4301234', '', 'aprobada', 5, NOW()),
(7, 'Espresso Bar Cochabamba', 'Barra de espresso profesional con baristas certificados. Ideal para amantes del cafe intenso.', -17.374500, -66.159800, 3, '', '+591 4 4312345', '', 'aprobada', 2, NOW()),
(8, 'Mundo Cafe Valles', 'Cafe boutique que promueve granos de los valles de Cochabamba. Desayunos y brunch los fines de semana.', -17.397800, -66.148900, 1, 'https://mundocafevalles.bo', '+591 4 4323456', '', 'aprobada', 1, NOW());

INSERT INTO placeschedule (place_id, dayOfWeek, openTime, closeTime) VALUES
(1, 'lunes', '07:30:00', '21:00:00'),
(1, 'martes', '07:30:00', '21:00:00'),
(1, 'miercoles', '07:30:00', '21:00:00'),
(1, 'jueves', '07:30:00', '21:00:00'),
(1, 'viernes', '07:30:00', '22:00:00'),
(1, 'sabado', '08:00:00', '22:00:00'),
(2, 'lunes', '08:00:00', '20:00:00'),
(2, 'martes', '08:00:00', '20:00:00'),
(2, 'miercoles', '08:00:00', '20:00:00'),
(2, 'jueves', '08:00:00', '20:00:00'),
(2, 'viernes', '08:00:00', '21:00:00'),
(2, 'sabado', '09:00:00', '21:00:00'),
(3, 'lunes', '09:00:00', '19:00:00'),
(3, 'martes', '09:00:00', '19:00:00'),
(3, 'miercoles', '09:00:00', '19:00:00'),
(3, 'jueves', '09:00:00', '19:00:00'),
(3, 'viernes', '09:00:00', '20:00:00'),
(4, 'lunes', '07:00:00', '22:00:00'),
(4, 'martes', '07:00:00', '22:00:00'),
(4, 'miercoles', '07:00:00', '22:00:00'),
(4, 'jueves', '07:00:00', '22:00:00'),
(4, 'viernes', '07:00:00', '23:00:00'),
(4, 'sabado', '08:00:00', '23:00:00'),
(5, 'lunes', '08:30:00', '21:30:00'),
(5, 'martes', '08:30:00', '21:30:00'),
(5, 'miercoles', '08:30:00', '21:30:00'),
(5, 'jueves', '08:30:00', '21:30:00'),
(5, 'viernes', '08:30:00', '22:30:00'),
(6, 'lunes', '07:00:00', '21:00:00'),
(6, 'martes', '07:00:00', '21:00:00'),
(6, 'miercoles', '07:00:00', '21:00:00'),
(6, 'jueves', '07:00:00', '21:00:00'),
(6, 'viernes', '07:00:00', '21:00:00'),
(7, 'martes', '10:00:00', '20:00:00'),
(7, 'miercoles', '10:00:00', '20:00:00'),
(7, 'jueves', '10:00:00', '20:00:00'),
(7, 'viernes', '10:00:00', '21:00:00'),
(7, 'sabado', '10:00:00', '21:00:00'),
(8, 'lunes', '08:00:00', '18:00:00'),
(8, 'martes', '08:00:00', '18:00:00'),
(8, 'miercoles', '08:00:00', '18:00:00'),
(8, 'jueves', '08:00:00', '18:00:00'),
(8, 'viernes', '08:00:00', '19:00:00'),
(8, 'sabado', '09:00:00', '14:00:00');

INSERT INTO comment (user_id, place_id, comment, createdBy, createdAt) VALUES
(3, 1, 'Excelente cafe pasado y ambiente colonial. Muy recomendado para visitar el centro.', 3, NOW()),
(4, 1, 'Los pasteles son deliciosos. Un clasico de Cochabamba.', 4, NOW()),
(3, 2, 'El latte con granos de Yungas tiene un sabor increible.', 3, NOW()),
(4, 4, 'Perfecto para estudiar, buen wifi y cafe consistente.', 4, NOW()),
(3, 5, 'Ambiente muy agradable, ideal para una tarde con amigos.', 3, NOW()),
(4, 8, 'Me encanto el cafe de origen de los valles. Volvere pronto.', 4, NOW());

INSERT INTO likes (user_id, place_id, createdAt) VALUES
(3, 1, NOW()),
(3, 2, NOW()),
(3, 4, NOW()),
(3, 8, NOW()),
(4, 1, NOW()),
(4, 3, NOW()),
(4, 5, NOW()),
(4, 6, NOW());

INSERT INTO favorites (user_id, place_id, createdAt) VALUES
(3, 1, NOW()),
(3, 4, NOW()),
(3, 8, NOW()),
(4, 2, NOW()),
(4, 5, NOW());

INSERT INTO advertising (title, description, image_url, enlace_url, status, start_date, end_date, createdBy, createdAt) VALUES
('Descubre la Ruta del Cafe en Cochabamba', 'Explora las mejores cafeterias de la Ciudad Jardin. Rutas guiadas por el centro, zona norte y Avenida America.', '', 'http://localhost:5173', 'activo', NOW(), DATE_ADD(NOW(), INTERVAL 6 MONTH), 1, NOW()),
('Promocion Alexander Coffee', '20% de descuento en cafe de especialidad presentando la app Ruta del Cafe.', '', 'https://alexandercoffee.bo', 'activo', NOW(), DATE_ADD(NOW(), INTERVAL 3 MONTH), 1, NOW());
