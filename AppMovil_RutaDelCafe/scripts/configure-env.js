import fs from "fs";
import os from "os";

const mode = process.argv[2] || "cloud";
const envPath = ".env.local";

if (mode === "keep") {
  if (fs.existsSync(envPath)) {
    console.log("📌 Sin cambios en .env.local");
  }
  process.exit(0);
}

if (mode === "auto") {
  if (fs.existsSync(envPath) && fs.readFileSync(envPath, "utf8").includes("https://")) {
    console.log("☁️ Manteniendo API en la nube");
    process.exit(0);
  }
  mode = "local";
}

if (mode === "cloud") {
  const apiUrl = process.env.EXPO_API_CLOUD || "https://ps3-ruta-cafe-1.onrender.com";
  fs.writeFileSync(envPath, `EXPO_PUBLIC_API_URL=${apiUrl}\n`, "utf8");
  console.log("☁️ API en la nube:", apiUrl);
  process.exit(0);
}

const interfaces = os.networkInterfaces();
let wifiIP = "192.168.1.100";

for (const name of Object.keys(interfaces)) {
  if (!/wi-?fi|wlan/i.test(name)) continue;
  for (const net of interfaces[name] || []) {
    if (net.family === "IPv4" && !net.internal) {
      wifiIP = net.address;
      break;
    }
  }
}

fs.writeFileSync(envPath, `EXPO_PUBLIC_API_URL=http://${wifiIP}:4000\n`, "utf8");
process.env.EXPO_PACKAGER_PROXY_URL = `http://${wifiIP}:8081`;
process.env.REACT_NATIVE_PACKAGER_HOSTNAME = wifiIP;
console.log("🏠 API local:", `http://${wifiIP}:4000`);
