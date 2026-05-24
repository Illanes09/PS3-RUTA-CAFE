import fs from "fs";
import os from "os";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, "..");

function getWifiIp() {
  const interfaces = os.networkInterfaces();
  for (const name of Object.keys(interfaces)) {
    if (!/wi-?fi|wlan/i.test(name)) continue;
    for (const net of interfaces[name] || []) {
      if (net.family === "IPv4" && !net.internal) return net.address;
    }
  }
  for (const name of Object.keys(interfaces)) {
    for (const net of interfaces[name] || []) {
      if (net.family === "IPv4" && !net.internal) return net.address;
    }
  }
  return "192.168.1.13";
}

const ip = getWifiIp();
const expUrl = `exp://${ip}:8081`;
const apiUrl = `http://${ip}:4000`;
const htmlPath = path.join(root, "conectar-expo.html");

const html = `<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Conectar Expo Go - Ruta del Cafe</title>
  <style>
    body { font-family: system-ui, sans-serif; max-width: 420px; margin: 40px auto; text-align: center; }
    img { margin: 16px 0; border: 8px solid #f0f0f0; border-radius: 12px; }
    code { background: #f4f4f4; padding: 4px 8px; border-radius: 6px; word-break: break-all; }
    ol { text-align: left; line-height: 1.6; }
    a { color: #2563eb; }
  </style>
</head>
<body>
  <h1>Expo Go - Ruta del Cafe</h1>
  <p>Escanea este QR con la app <strong>Expo Go</strong> (misma Wi-Fi que el PC):</p>
  <img src="https://api.qrserver.com/v1/create-qr-code/?size=280x280&data=${encodeURIComponent(expUrl)}" alt="QR Expo" />
  <p><code>${expUrl}</code></p>
  <h3>Pasos</h3>
  <ol>
    <li>Instala <strong>Expo Go</strong> en el celular.</li>
    <li>Asegúrate de que <code>npm start</code> esté corriendo en el PC.</li>
    <li>Abre Expo Go → <strong>Scan QR code</strong>.</li>
    <li>Si no funciona, en Expo Go elige <strong>Enter URL manually</strong> y pega la URL de arriba.</li>
  </ol>
  <p>API backend: <code>${apiUrl}</code></p>
  <p>Ver en navegador: <a href="http://localhost:8081/login">http://localhost:8081/login</a></p>
  <p>Login demo: <code>usuario@ejemplo.com</code> / <code>123456</code></p>
</body>
</html>`;

fs.writeFileSync(htmlPath, html, "utf8");
console.log("\n✅ Pagina con QR generada:");
console.log("   " + htmlPath);
console.log("\n📱 URL para Expo Go:");
console.log("   " + expUrl);
console.log("\n🌐 Abre el archivo HTML en el navegador para ver el QR.\n");
