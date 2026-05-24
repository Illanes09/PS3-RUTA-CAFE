import mysql from "mysql2/promise";

const host = process.env.DB_HOST;
const port = Number(process.env.DB_PORT || 3306);
const user = process.env.DB_USER;
const password = process.env.DB_PASS;

if (!host || !user) {
  console.error("❌ Faltan variables DB_HOST o DB_USER en el entorno de Render.");
  process.exit(1);
}

try {
  const connection = await mysql.createConnection({
    host,
    user,
    password,
    port,
    connectTimeout: 10000,
    ssl: process.env.DB_SSL === "true" ? { rejectUnauthorized: false } : undefined,
  });

  await connection.ping();
  await connection.end();
  console.log(`✅ MySQL accesible en ${host}:${port}`);
  process.exit(0);
} catch (error) {
  console.error(`⏳ MySQL no disponible en ${host}:${port} — ${error.message}`);
  process.exit(1);
}
