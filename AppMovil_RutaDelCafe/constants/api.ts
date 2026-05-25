/** URL base del backend (sin /api). Por defecto: API en Render. */
export const API_BASE =
  (process.env.EXPO_PUBLIC_API_URL || "https://ps3-ruta-cafe-1.onrender.com").replace(
    /\/$/,
    ""
  );

export const API_URL = `${API_BASE}/api`;

export const isCloudApi = API_BASE.startsWith("https://");
