# 🍽️ Ruta del Sabor - Plataforma Gastronómica

## Descripción
Plataforma web y móvil para la gestión y exploración de rutas gastronómicas. Permite descubrir sitios culinarios, comentar, dar likes y guardar favoritos.

## 🚀 Características Principales

### Para Usuarios
- 📍 Explorar rutas y sitios gastronómicos
- 💬 Comentar y calificar experiencias
- ❤️ Dar like y guardar favoritos
- 🗺️ Navegación intuitiva por regiones

### Para Técnicos  
- ➕ Crear nuevas rutas y sitios
- 📋 Gestión de contenido pendiente de aprobación

### Para Administradores
- ✅ Aprobar/rechazar rutas y sitios
- 👥 Gestión de usuarios y roles
- 📊 Dashboard con métricas
- 📢 Gestión de publicidades

## 🛠️ Tecnologías

### Backend
- Node.js + Express.js
- MySQL 8.0
- JWT Authentication
- Bcrypt para hashing

### Frontend Web (Admin)
- React 18 + Vite
- Tailwind CSS
- Axios para API calls

### App Móvil
- React Native + Expo
- React Navigation
- Context API

## 📦 Instalación Rápida

### Con Docker (Recomendado)
```bash
git clone https://github.com/CB-PROYECTO-SISTEMAS-2025/PS3-RUTA-CAFE.git
cd PS3-RUTA-CAFE
cp .env.example .env
docker compose up --build
```

Guia completa para publicar en la nube (Vercel + Render + Railway): ver [DEPLOY.md](./DEPLOY.md)

Servicios:
- API: http://localhost:4000
- Admin web: http://localhost:5173
- phpMyAdmin: http://localhost:8080

Usuarios demo: `admin@rutadelsabor.com` / `123456`

App móvil (Expo en tu PC, fuera de Docker):
```bash
cd AppMovil_RutaDelCafe
# En .env.local usa la IP de tu PC, no "localhost"
EXPO_PUBLIC_API_URL=http://TU_IP_LOCAL:4000
npm install && npm start
```

### Instalación Manual

```bash
# Backend
cd BackendRutaCafe && npm install
cp .env.example .env
npm run dev

# Frontend Web
cd app_web_admin && npm install
cp .env.example .env
npm run dev

# App Móvil
cd AppMovil_RutaDelCafe && npm install
npx expo start
```

🔑 Acceso de Prueba
Usuarios Demo:
Administrador: admin@rutadelsabor.com / 123456

Técnico: tecnico@rutadelsabor.com / 123456

Usuario: usuario@ejemplo.com / 123456

URLs:
API: http://localhost:3000/api

Admin Web: http://localhost:5173

phpMyAdmin: http://localhost:8080

📁 Estructura del Proyecto
PS3-RUTA-CAFE/
├── backend/          # API REST Node.js
├── frontend-web/     # Panel Admin React
├── app-movil/        # App React Native
├── database/         # Scripts BD
├── docs/            # Documentación
└── README.md        # Este archivo

📄 Documentación Completa
Para la documentación técnica completa, consulta el Manual Técnico que incluye:

Arquitectura del sistema

Configuración de base de datos

Guías de instalación

Procedimientos de deployment

Solución de problemas

Consideraciones de seguridad

🐛 Reportar Problemas
Si encuentras algún bug o tienes sugerencias, por favor crea un issue.

📄 Licencia
Este proyecto es desarrollado para fines académicos.

👥 Desarrolladores
Luis Mario Garcia Chambilla (Team Leader)

Rolando Valdivia Rodriguez (Git Master)

Manuel Ovando Crespo (DBA)

