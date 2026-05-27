import mysql from "mysql2/promise";
import { getMysqlConnectionOptions, logMysqlTarget } from "../src/config/mysqlOptions.js";

const host = process.env.DB_HOST;
const port = Number(process.env.DB_PORT || 3306);

if (!host || !process.env.DB_USER) {
  console.error("❌ Faltan DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT en Render → Environment.");
  process.exit(1);
}

logMysqlTarget();

try {
  const connection = await mysql.createConnection(getMysqlConnectionOptions());
  await connection.ping();
  await connection.end();
  console.log(`✅ MySQL accesible en ${host}:${port}`);
  process.exit(0);
} catch (error) {
  console.error(`⏳ MySQL no disponible en ${host}:${port} — ${error.message}`);
  if (host.includes("rlwy.net") && String(port) === "3306") {
    console.error(
      "💡 Railway usa un puerto público distinto (ej. 21299). Copia MYSQLPORT desde Railway → Connect."
    );
  }
  process.exit(1);
}
