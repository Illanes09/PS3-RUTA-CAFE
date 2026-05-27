# Generar y subir el APK

## Opción A — GitHub Actions (recomendado)

1. Sube el workflow (si el push falló por permisos):
   ```powershell
   gh auth refresh -h github.com -s workflow
   cd c:\Game\Proyectos\PS3-RUTA-CAFE-main
   git push origin master
   ```
2. En GitHub: **Actions** → **Build Android APK** → **Run workflow**.
3. Al terminar (~10–15 min), el APK queda en `releases/RutaDelCafe-1.0.0.apk` en el repo.

## Opción B — Android Studio (tu PC)

1. Instala [Android Studio](https://developer.android.com/studio) (incluye JDK y SDK).
2. En la carpeta del proyecto:
   ```powershell
   cd AppMovil_RutaDelCafe
   echo EXPO_PUBLIC_API_URL=https://ps3-ruta-cafe-1.onrender.com > .env.local
   cd android
   .\gradlew.bat assembleRelease
   ```
3. Copia el APK:
   `android\app\build\outputs\apk\release\app-release.apk`
   → `releases\RutaDelCafe-1.0.0.apk`
4. Sube a git:
   ```powershell
   git add releases/RutaDelCafe-1.0.0.apk
   git commit -m "build: APK Android 1.0.0"
   git push
   ```

La app usa la API en la nube: `https://ps3-ruta-cafe-1.onrender.com`
