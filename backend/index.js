import express from "express";
import dotenv from "dotenv";
import cors from "cors";

import accordionRoutes from "./routes/accordion.route.js";

import { connectToDB } from "./lib/db.js";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(cors());

app.use("/api/accordion", accordionRoutes);

app.listen(PORT, () => {
  console.log(`server running on http://localhost:${PORT}`);
  connectToDB();
});
