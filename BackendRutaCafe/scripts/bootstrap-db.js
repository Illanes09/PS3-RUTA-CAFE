import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import mysql from "mysql2/promise";
import { getMysqlConnectionOptions, logMysqlTarget } from "../src/config/mysqlOptions.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const seedPath = path.join(__dirname, "..", "database", "production-seed.sql");

const run = async () => {
  if (process.env.SEED_ON_START !== "true") {
    console.log("ℹ️ SEED_ON_START no activo, se omite seed.");
    return;
  }

  if (!fs.existsSync(seedPath)) {
    console.warn("⚠️ No se encontró production-seed.sql");
    return;
  }

  logMysqlTarget();

  const connection = await mysql.createConnection({
    ...getMysqlConnectionOptions(),
    multipleStatements: true,
  });

  try {
    await connection.query(`CREATE DATABASE IF NOT EXISTS \`${process.env.DB_NAME}\``);
    await connection.query(`USE \`${process.env.DB_NAME}\``);

    let shouldSeed = true;
    try {
      const [[{ total }]] = await connection.query("SELECT COUNT(*) AS total FROM users");
      if (Number(total) > 0) {
        shouldSeed = false;
        console.log("✅ Base de datos ya poblada, seed omitido.");
      }
    } catch {
      console.log("ℹ️ Tablas inexistentes, se ejecutará seed inicial.");
    }

    if (!shouldSeed) return;

    const sqlRaw = fs.readFileSync(seedPath, "utf8");
    const sql = sqlRaw.charCodeAt(0) === 0xfeff ? sqlRaw.slice(1) : sqlRaw;
    console.log("🌱 Poblando base de datos...");
    await connection.query(sql);
    console.log("✅ Seed de producción completado.");
  } finally {
    await connection.end();
  }
};

run().catch((err) => {
  console.error("❌ Error en bootstrap DB:", err.message);
  process.exit(1);
});
