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
