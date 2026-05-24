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
(10, 'Restaurante El Fogón Quillacollo', 'Comida casera cochabambina: silpancho, pique macho y chicharron. Ambiente popular y precios accesibles.', -17.394500, -66.281200, 4, '', '+591 4 4357890', '', 'aprobada', 2, NOW()),
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
