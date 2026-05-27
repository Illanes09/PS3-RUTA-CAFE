const fs = require('fs');
const os = require('os');

// Función para detectar la IP del WiFi
function getWiFiIP() {
  const interfaces = os.networkInterfaces();
  
  for (const name of Object.keys(interfaces)) {
    for (const interface of interfaces[name]) {
      // Filtrar IPv4 y no internas
      if (interface.family === 'IPv4' && !interface.internal) {
        // Priorizar interfaces WiFi
        if (name.toLowerCase().includes('wi-fi') || 
            name.toLowerCase().includes('wlan') || 
            name.toLowerCase().includes('wireless')) {
          console.log(`📱 IP WiFi detectada: ${interface.address}`);
          return interface.address;
        }
      }
    }
  }
  
  // Fallback: cualquier IP disponible
  for (const name of Object.keys(interfaces)) {
    for (const interface of interfaces[name]) {
      if (interface.family === 'IPv4' && !interface.internal) {
        console.log(`🌐 IP de red detectada: ${interface.address}`);
        return interface.address;
      }
    }
  }
  
  return '192.168.1.100';
}

// Actualizar el archivo .env.local
function updateEnvFile() {
  if (fs.existsSync('.env.local')) {
    const current = fs.readFileSync('.env.local', 'utf8');
    if (current.includes('https://')) {
      console.log('☁️ Manteniendo API en la nube');
      return;
    }
  }

  const wifiIP = getWiFiIP();
  
  const envContent = `# Archivo generado automáticamente - IP del WiFi detectada
EXPO_PUBLIC_API_URL=http://${wifiIP}:4000
`;

  fs.writeFileSync('.env.local', envContent, 'utf8');
  console.log(`✅ .env.local actualizado con IP: ${wifiIP}`);
  console.log(`🌐 URL de API: http://${wifiIP}:4000`);
}

// Ejecutar la actualización
updateEnvFile();