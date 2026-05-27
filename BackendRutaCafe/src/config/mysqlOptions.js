/**
 * Opciones MySQL compartidas (pool, wait-for-db, bootstrap).
 * Railway (host *.rlwy.net) requiere SSL en conexiones públicas.
 */
export function getMysqlConnectionOptions(overrides = {}) {
  const host = process.env.DB_HOST || "";
  const isRailway =
    host.includes("rlwy.net") ||
    host.includes("railway.app") ||
    host.includes("railway.internal");

  const useSsl =
    process.env.DB_SSL === "true" ||
    process.env.DB_SSL === "1" ||
    (process.env.DB_SSL !== "false" && isRailway);

  const port = Number(process.env.DB_PORT || 3306);

  return {
    host,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    port,
    connectTimeout: Number(process.env.DB_CONNECT_TIMEOUT || 30000),
    enableKeepAlive: true,
    keepAliveInitialDelay: 10000,
    ...(useSsl ? { ssl: { rejectUnauthorized: false } } : {}),
    ...overrides,
  };
}

export function logMysqlTarget() {
  const host = process.env.DB_HOST || "(sin DB_HOST)";
  const port = process.env.DB_PORT || 3306;
  const db = process.env.DB_NAME || "(sin DB_NAME)";
  const ssl =
    process.env.DB_SSL === "true" ||
    host.includes("rlwy.net") ||
    host.includes("railway.app");
  console.log(`🔌 MySQL → ${host}:${port} / DB=${db} / SSL=${ssl ? "sí" : "no"}`);
}
