-- Production seed


-- 01-schema.sql

CREATE TABLE IF NOT EXISTS city (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  lastName VARCHAR(100) NOT NULL,
  secondLastName VARCHAR(100) NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  City_id INT NULL,
  role INT NOT NULL DEFAULT 3,
  fingerprint_data VARCHAR(255) NULL,
  has_fingerprint BOOLEAN DEFAULT FALSE,
  photo VARCHAR(255) NULL,
  createdAt DATETIME NOT NULL,
  modifiedAt DATETIME NULL,
  FOREIGN KEY (City_id) REFERENCES city(id)
);

CREATE TABLE IF NOT EXISTS route (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  description TEXT NULL,
  status ENUM('pendiente', 'aprobada', 'rechazada') DEFAULT 'pendiente',
  rejectionComment TEXT NULL,
  image_url VARCHAR(500) NULL,
  createdBy INT NOT NULL,
  createdAt DATETIME NOT NULL,
  modifiedAt DATETIME NULL,
  modifiedBy INT NULL,
  FOREIGN KEY (createdBy) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS place (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  description TEXT NULL,
  latitude DECIMAL(10, 8) NULL,
  longitude DECIMAL(11, 8) NULL,
  route_id INT NULL,
  webSite VARCHAR(255) NULL,
  phoneNumber VARCHAR(20) NULL,
  image_url VARCHAR(500) NULL,
  status ENUM('pendiente', 'aprobada', 'rechazada') DEFAULT 'pendiente',
  createdBy INT NOT NULL,
  createdAt DATETIME NOT NULL,
  modifiedAt DATETIME NULL,
  modifiedBy INT NULL,
  FOREIGN KEY (route_id) REFERENCES route(id),
  FOREIGN KEY (createdBy) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS place_images (
  id INT AUTO_INCREMENT PRIMARY KEY,
  place_id INT NOT NULL,
  image_url VARCHAR(500) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (place_id) REFERENCES place(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS placeschedule (
  id INT AUTO_INCREMENT PRIMARY KEY,
  place_id INT NOT NULL,
  dayOfWeek VARCHAR(20) NOT NULL,
  openTime TIME NULL,
  closeTime TIME NULL,
  FOREIGN KEY (place_id) REFERENCES place(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  place_id INT NOT NULL,
  comment TEXT NOT NULL,
  createdBy INT NOT NULL,
  createdAt DATETIME NOT NULL,
  modifiedAt DATETIME NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (place_id) REFERENCES place(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS likes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  place_id INT NOT NULL,
  createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_like (user_id, place_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (place_id) REFERENCES place(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS favorites (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  place_id INT NOT NULL,
  createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_favorite (user_id, place_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (place_id) REFERENCES place(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS advertising (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  description TEXT NULL,
  image_url VARCHAR(500) NULL,
  enlace_url VARCHAR(500) NULL,
  status ENUM('activo', 'inactivo') DEFAULT 'activo',
  start_date DATETIME NULL,
  end_date DATETIME NULL,
  createdBy INT NULL,
  createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modifiedAt DATETIME NULL,
  modifiedBy INT NULL
);

-- 03-cochabamba-seed.sql

-- Repoblar base de datos: Cochabamba, Bolivia

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

-- 04-mas-lugares-cbba.sql

-- Mas lugares: cafeterias y restaurantes en Cochabamba, Quillacollo y Tiquipaya

INSERT IGNORE INTO city (id, name) VALUES
(4, 'Quillacollo'),
(5, 'Tiquipaya');

INSERT INTO route (id, name, description, status, image_url, createdBy, createdAt) VALUES
(4, 'Ruta Gastronomica - Quillacollo', 'Cafeterias y restaurantes del municipio de Quillacollo, desde el centro hasta la zona del terminal.', 'aprobada', '', 2, NOW()),
(5, 'Ruta Gastronomica - Tiquipaya', 'Locales gastronomicos de Tiquipaya, incluyendo la zona universitaria y el valle.', 'aprobada', '', 5, NOW()),
(6, 'Ruta Cafes - Cochabamba Sur', 'Cafeterias y restaurantes del sur cochabambino, zona Cala Cala y Colcapirhua.', 'aprobada', '', 2, NOW()),
(7, 'Ruta Restaurantes - Cochabamba Este', 'Restaurantes tradicionales y cafes de la zona este, cercana a Sacaba y Av. Blanco Galindo.', 'aprobada', '', 5, NOW()),
(8, 'Ruta Sabores del Valle - Cochabamba Centro', 'Mas opciones de cafes y restaurantes en el centro ampliado y alrededores de la Plaza Colon.', 'aprobada', '', 1, NOW());

INSERT INTO place (id, name, description, latitude, longitude, route_id, webSite, phoneNumber, image_url, status, createdBy, createdAt) VALUES
-- Quillacollo
(9, 'Cafe Los Girasoles', 'Cafeteria familiar en el corazon de Quillacollo. Cafe pasado boliviano, empanadas y saltenas recien horneadas.', -17.392300, -66.278600, 4, '', '+591 4 4356789', '', 'aprobada', 2, NOW()),
(10, 'Restaurante El FogÃ³n Quillacollo', 'Comida casera cochabambina: silpancho, pique macho y chicharron. Ambiente popular y precios accesibles.', -17.394500, -66.281200, 4, '', '+591 4 4357890', '', 'aprobada', 2, NOW()),
(11, 'Pizzeria Don Carlo Quillacollo', 'Pizzeria con horno a lena y pastas artesanales. Muy concurrida los fines de semana por familias del valle.', -17.389800, -66.275400, 4, 'https://doncarlo.bo', '+591 4 4358901', '', 'aprobada', 5, NOW()),
(12, 'Cafe La Casona Quillacollo', 'Cafe boutique en casa colonial restaurada. Especialidad en capuchinos y tortas de zanahoria.', -17.391000, -66.280100, 4, '', '+591 4 4359012', '', 'aprobada', 2, NOW()),
(13, 'Restaurante Sabor del Valle Quillacollo', 'Restaurante de comida campestre con productos de la zona. Trucha, quinua y sopas de mani.', -17.396200, -66.283500, 4, '', '+591 4 4360123', '', 'aprobada', 5, NOW()),
(14, 'Sweet Coffee Quillacollo', 'Cafe moderno con bebidas frias, frappe y postres. Frecuentado por jovenes de colegios cercanos.', -17.388500, -66.277800, 4, '', '+591 4 4361234', '', 'aprobada', 2, NOW()),
(15, 'Restaurante Michelangelo Quillacollo', 'Pizzeria y restaurante italiano con terraza. Lasagna y risottos son los platos favoritos.', -17.393800, -66.279900, 4, '', '+591 4 4362345', '', 'aprobada', 5, NOW()),

-- Tiquipaya
(16, 'Cafe Universidad Tiquipaya', 'Cafe estudiantil junto a la UMSS. Menu economico, sandwiches y cafe americano todo el dia.', -17.341400, -66.214700, 5, '', '+591 4 4373456', '', 'aprobada', 5, NOW()),
(17, 'Restaurante El Vallecito Tiquipaya', 'Restaurante campestre con vista al valle. Especialidad en cordero al horno y chicha artesanal.', -17.338900, -66.218300, 5, '', '+591 4 4374567', '', 'aprobada', 2, NOW()),
(18, 'Cafe Villa Quesimpuco', 'Cafe rustico con jardin. Ideal para desayunos de fin de semana y mate de coca con bizcochitos.', -17.344500, -66.211200, 5, '', '+591 4 4375678', '', 'aprobada', 5, NOW()),
(19, 'Restaurante Sabores del Valle Tiquipaya', 'Comida tipica cochabambina en ambiente acogedor. Pique a lo macho y rostro asado destacados.', -17.339800, -66.216500, 5, '', '+591 4 4376789', '', 'aprobada', 2, NOW()),
(20, 'Cafe Tiquipaya Garden', 'Cafe con terraza verde y reposteria francesa. Excelente para brunch y reuniones al aire libre.', -17.342800, -66.213400, 5, '', '+591 4 4377890', '', 'aprobada', 5, NOW()),
(21, 'Pizzeria Tiquipaya Express', 'Pizza rapida y delivery en la zona universitaria. Masas finas y combos para estudiantes.', -17.340500, -66.215800, 5, '', '+591 4 4378901', '', 'aprobada', 2, NOW()),
(22, 'Restaurante La Casa de la Abuela Tiquipaya', 'Cocina casera como en casa. Sopa de mani, fricase y api con buena atencion familiar.', -17.343200, -66.217600, 5, '', '+591 4 4379012', '', 'aprobada', 5, NOW()),
(23, 'Cafe Grano de Mostaza Tiquipaya', 'Cafe de especialidad con granos tostados localmente. Venden cafe molido para llevar.', -17.341900, -66.212300, 5, '', '+591 4 4380123', '', 'aprobada', 2, NOW()),

-- Cochabamba (mas lugares)
(24, 'Restaurante Dumbo', 'Icono gastronomico de Cochabamba. Famoso por sus porciones generosas de pollo y parrilla.', -17.378500, -66.162300, 8, 'https://dumbo.bo', '+591 4 4251234', '', 'aprobada', 1, NOW()),
(25, 'Casa de Campo Restaurante', 'Restaurante campestre con piscina y areas verdes. Ideal para almuerzos familiares los domingos.', -17.352100, -66.178900, 6, 'https://casadecampo.bo', '+591 4 4252345', '', 'aprobada', 2, NOW()),
(26, 'Cafe Paris Cochabamba', 'Cafeteria estilo parisino en el centro. Croissants, cafe expreso y ambiente elegante.', -17.391800, -66.155400, 8, '', '+591 4 4253456', '', 'aprobada', 1, NOW()),
(27, 'Restaurante El Cordobes', 'Parrillada y corte de carne premium. Uno de los restaurantes mas reconocidos de la ciudad.', -17.386500, -66.158700, 8, '', '+591 4 4254567', '', 'aprobada', 1, NOW()),
(28, 'Cafe Plaza Colon', 'Cafe con vista a la Plaza Colon. Cafe latte, jugos naturales y sandwiches ligeros.', -17.395200, -66.154800, 8, '', '+591 4 4255678', '', 'aprobada', 2, NOW()),
(29, 'Restaurante Sabor Campestre', 'Comida tipica en ambiente rustico. Destaca el charke de llama y las humintas.', -17.367800, -66.149800, 6, '', '+591 4 4256789', '', 'aprobada', 5, NOW()),
(30, 'Cafe Grano de Oro', 'Cafe de origen con barra de espresso. Granos de Caranavi y Yungas en variedad de preparaciones.', -17.384200, -66.163500, 8, 'https://granodeoro.bo', '+591 4 4257890', '', 'aprobada', 2, NOW()),
(31, 'Restaurante La Taverne', 'Restaurante europeo con fondue y pastas. Ambiente romantico para cenas especiales.', -17.390500, -66.159800, 8, '', '+591 4 4258901', '', 'aprobada', 1, NOW()),
(32, 'Cafe Cala Cala Corner', 'Cafe de barrio en Cala Cala. Ambiente relajado, wifi gratis y buen cafe con leche.', -17.361200, -66.171200, 6, '', '+591 4 4259012', '', 'aprobada', 5, NOW()),
(33, 'Restaurante El Meson del Pescador', 'Especialidad en pescados y mariscos. Trucha y pacu frescos en preparaciones al ajillo y a la plancha.', -17.372500, -66.152300, 7, '', '+591 4 4260123', '', 'aprobada', 2, NOW()),
(34, 'Cafe Sacaba Express', 'Cafe rapido en la zona este con conexion a Sacaba. Empanadas de queso y cafe pasado.', -17.368900, -66.138700, 7, '', '+591 4 4261234', '', 'aprobada', 5, NOW()),
(35, 'Restaurante Los Nogales', 'Restaurante de cocina internacional en zona residencial. Ensaladas, carnes y vinos seleccionados.', -17.375600, -66.165400, 6, 'https://losnogales.bo', '+591 4 4262345', '', 'aprobada', 1, NOW()),
(36, 'Cafe Mundo Andino', 'Cafe tematico andino con decoracion local. Te de coca, api y pasteles de queso.', -17.388900, -66.151200, 8, '', '+591 4 4263456', '', 'aprobada', 2, NOW()),
(37, 'Restaurante Pachamama', 'Comida fusion boliviana-contemporanea. Usa ingredientes organicos del valle cochabambino.', -17.381200, -66.157600, 8, '', '+591 4 4264567', '', 'aprobada', 5, NOW()),
(38, 'Cafe Colcapirhua Central', 'Cafe de barrio en Colcapirhua. Precios populares y desayunos completos.', -17.358700, -66.184500, 6, '', '+591 4 4265678', '', 'aprobada', 2, NOW());

INSERT INTO placeschedule (place_id, dayOfWeek, openTime, closeTime) VALUES
(9, 'lunes', '07:00:00', '20:00:00'),
(9, 'martes', '07:00:00', '20:00:00'),
(9, 'miercoles', '07:00:00', '20:00:00'),
(9, 'jueves', '07:00:00', '20:00:00'),
(9, 'viernes', '07:00:00', '21:00:00'),
(9, 'sabado', '08:00:00', '21:00:00'),
(10, 'lunes', '11:00:00', '22:00:00'),
(10, 'martes', '11:00:00', '22:00:00'),
(10, 'miercoles', '11:00:00', '22:00:00'),
(10, 'jueves', '11:00:00', '22:00:00'),
(10, 'viernes', '11:00:00', '23:00:00'),
(10, 'sabado', '11:00:00', '23:00:00'),
(10, 'domingo', '11:00:00', '21:00:00'),
(16, 'lunes', '07:30:00', '21:00:00'),
(16, 'martes', '07:30:00', '21:00:00'),
(16, 'miercoles', '07:30:00', '21:00:00'),
(16, 'jueves', '07:30:00', '21:00:00'),
(16, 'viernes', '07:30:00', '22:00:00'),
(16, 'sabado', '08:00:00', '20:00:00'),
(17, 'viernes', '12:00:00', '22:00:00'),
(17, 'sabado', '11:00:00', '22:00:00'),
(17, 'domingo', '11:00:00', '21:00:00'),
(24, 'lunes', '11:00:00', '23:00:00'),
(24, 'martes', '11:00:00', '23:00:00'),
(24, 'miercoles', '11:00:00', '23:00:00'),
(24, 'jueves', '11:00:00', '23:00:00'),
(24, 'viernes', '11:00:00', '00:00:00'),
(24, 'sabado', '11:00:00', '00:00:00'),
(24, 'domingo', '11:00:00', '22:00:00'),
(25, 'martes', '11:00:00', '21:00:00'),
(25, 'miercoles', '11:00:00', '21:00:00'),
(25, 'jueves', '11:00:00', '21:00:00'),
(25, 'viernes', '11:00:00', '22:00:00'),
(25, 'sabado', '11:00:00', '22:00:00'),
(25, 'domingo', '11:00:00', '21:00:00');

INSERT INTO comment (user_id, place_id, comment, createdBy, createdAt) VALUES
(3, 9, 'Las empanadas de queso son lo mejor de Quillacollo. Muy recomendado.', 3, NOW()),
(4, 10, 'El silpancho mas grande que he probado. Sabor autentico cochabambino.', 4, NOW()),
(3, 16, 'Perfecto para estudiar cerca de la universidad. Precios de estudiante.', 3, NOW()),
(4, 17, 'La vista al valle es hermosa y el cordero excelente. Ideal para domingo.', 4, NOW()),
(3, 24, 'Dumbo no decepciona. Hay que ir con hambre, las porciones son enormes.', 3, NOW()),
(4, 25, 'Ambiente campestre precioso. Los ninos disfrutaron mucho la piscina.', 4, NOW()),
(3, 30, 'El mejor espresso de Cochabamba. Granos de excelente calidad.', 3, NOW()),
(4, 22, 'Comida como la de la abuela. La sopa de mani es espectacular.', 4, NOW()),
(3, 13, 'Productos frescos del valle. La trucha al ajillo muy buena.', 3, NOW()),
(4, 36, 'Ambiente acogedor y el api con pastel perfecto para la tarde.', 4, NOW());

INSERT INTO likes (user_id, place_id, createdAt) VALUES
(3, 9, NOW()), (3, 10, NOW()), (3, 16, NOW()), (3, 24, NOW()), (3, 25, NOW()), (3, 30, NOW()), (3, 36, NOW()),
(4, 11, NOW()), (4, 17, NOW()), (4, 22, NOW()), (4, 24, NOW()), (4, 27, NOW()), (4, 30, NOW()), (4, 37, NOW());

INSERT INTO favorites (user_id, place_id, createdAt) VALUES
(3, 9, NOW()), (3, 16, NOW()), (3, 24, NOW()), (3, 30, NOW()),
(4, 10, NOW()), (4, 17, NOW()), (4, 22, NOW()), (4, 25, NOW()), (4, 27, NOW());
