// src/config/db.js
import mysql from "mysql2/promise";
import dotenv from "dotenv";
import { getMysqlConnectionOptions, logMysqlTarget } from "./mysqlOptions.js";

dotenv.config();

export const SCHEMA = process.env.DB_NAME; // 👈 lo usamos para calificar tablas

logMysqlTarget();

const pool = mysql.createPool({
  ...getMysqlConnectionOptions(),
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

// Test de conexión + log útil
pool.getConnection()
  .then(async (conn) => {
    const [dbRow] = await conn.query("SELECT DATABASE() AS db");
    console.log("✅ Conexión OK. DB en uso =>", dbRow?.[0]?.db);
    conn.release();
  })
  .catch(err => {
    console.error("❌ Error al conectar a la base de datos:", err);
  });

export default pool;
