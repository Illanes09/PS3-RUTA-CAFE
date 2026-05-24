# Despliegue gratuito: Vercel + Render + Railway

Stack recomendado (gratis para empezar):

| Parte | Servicio | Costo |
|-------|----------|-------|
| Panel admin (React) | [Vercel](https://vercel.com) | Gratis |
| API (Node.js) | [Render](https://render.com) | Gratis (se duerme tras inactividad) |
| MySQL | [Railway](https://railway.com) | ~5 USD/mes de credito gratis |

> **Nota:** Vercel no soporta MySQL ni el backend Express con archivos. Por eso se separa en 3 servicios conectados por GitHub.

---

## Paso 1 — Subir el codigo a GitHub

1. Crea un repositorio en GitHub (ej: `PS3-RUTA-CAFE`).
2. En PowerShell, desde la carpeta del proyecto:

```powershell
cd c:\Game\Proyectos\PS3-RUTA-CAFE-main
git init
git add .
git commit -m "Preparar despliegue en la nube"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/PS3-RUTA-CAFE.git
git push -u origin main
```

---

## Paso 2 — Base de datos MySQL en Railway

1. Entra a [railway.com](https://railway.com) con GitHub.
2. **New Project** → **Provision MySQL**.
3. Abre el servicio MySQL → pestaña **Variables** y copia:
   - `MYSQLHOST`
   - `MYSQLUSER`
   - `MYSQLPASSWORD`
   - `MYSQLDATABASE`
   - `MYSQLPORT`
4. En **Settings** → activa **Public Networking** (para que Render pueda conectar).

---

## Paso 3 — API en Render

1. Entra a [render.com](https://render.com) con GitHub.
2. **New** → **Blueprint** → conecta tu repo (detecta `render.yaml`).
3. O manualmente: **Web Service** → repo → **Root Directory:** `BackendRutaCafe`.
4. Configura estas variables de entorno:

| Variable | Valor |
|----------|-------|
| `DB_HOST` | Host de Railway |
| `DB_USER` | Usuario MySQL |
| `DB_PASS` | Contrasena MySQL |
| `DB_NAME` | `rutadelcafebdd` |
| `DB_PORT` | `3306` |
| `JWT_SECRET` | Una clave larga aleatoria |
| `SEED_ON_START` | `true` (solo la primera vez) |
| `ADMIN_FRONTEND_URL` | La URL de Vercel (paso 4) |
| `CORS_ORIGIN` | Misma URL de Vercel |

5. **Start Command:** `node scripts/bootstrap-db.js && node index.js`
6. Deploy. Copia la URL del API (ej: `https://rutacafe-api.onrender.com`).

La primera vez pobla la BD con los 38 lugares de Cochabamba. Luego puedes poner `SEED_ON_START=false`.

---

## Paso 4 — Panel admin en Vercel

1. Entra a [vercel.com](https://vercel.com) con GitHub.
2. **Add New Project** → importa el repo.
3. **Root Directory:** `app_web_admin`
4. Variable de entorno:

| Variable | Valor |
|----------|-------|
| `VITE_API_URL` | `https://TU-API.onrender.com/api` |

5. Deploy. Obtienes una URL como `https://tu-proyecto.vercel.app`.

6. Vuelve a Render y actualiza `ADMIN_FRONTEND_URL` y `CORS_ORIGIN` con esa URL de Vercel.

---

## Paso 5 — App movil (Expo)

En `AppMovil_RutaDelCafe/.env.local`:

```env
EXPO_PUBLIC_API_URL=https://TU-API.onrender.com
```

---

## Modificar despues

1. Editas el codigo en tu PC.
2. `git add .` → `git commit` → `git push`.
3. Vercel y Render redespliegan automaticamente.

Para cambiar datos en produccion:
- Usa el panel admin en Vercel.
- O conecta a MySQL de Railway con cualquier cliente (DBeaver, TablePlus).
- O ejecuta SQL en Railway desde su consola.

---

## Limitaciones del plan gratis

- **Render:** la API se duerme tras ~15 min sin uso; la primera peticion tarda ~30 s.
- **Railway:** credito mensual limitado; monitorea uso en el dashboard.
- **Uploads de imagenes:** en Render el disco es efimero; las fotos subidas pueden perderse al reiniciar. Para produccion real conviene Cloudinary o S3.

---

## URLs utiles

- Vercel dashboard: https://vercel.com/dashboard
- Render dashboard: https://dashboard.render.com
- Railway dashboard: https://railway.com/dashboard

Credenciales de prueba: ver `usuarios.txt` en la raiz del proyecto.
