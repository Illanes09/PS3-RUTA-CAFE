import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import path from "path";

import authRoutes from "./routes/authRoutes.js";
import userRoutes from "./routes/userRoutes.js";
import routeRoutes from "./routes/routeRoutes.js";
import placeRoutes from "./routes/placeRoutes.js";
import commentRoutes from "./routes/commentRoutes.js";
import likeRoutes from "./routes/likeRoutes.js";
import favoriteRoutes from "./routes/favoriteRoutes.js";

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/uploads", express.static(path.join(process.cwd(), "uploads")));

// Ruta de prueba
app.get("/", (req, res) => {
  res.send("Servidor BackendRutaCafe funcionando 🚀");
});

// Rutas de autenticación
app.use("/api/auth", authRoutes);
app.use("/api/routes", routeRoutes);
app.use("/api/places", placeRoutes);

// 🔐 requieren login (estas sí con verifyToken dentro de sus routers)
app.use("/api/comments", commentRoutes);
app.use("/api/likes", likeRoutes);
app.use("/api/favorites", favoriteRoutes);

export default app;