import express from "express";
import { getAccordionData } from "../controllers/accordion.controller.js";

const router = express.Router();

router.get("/accordionContent", getAccordionData);

export default router;
