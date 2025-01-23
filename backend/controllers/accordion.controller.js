import { client } from "../lib/db.js";

export const getAccordionData = async (req, res) => {
  try {
    const data = await client.query("SELECT * FROM accordion");
    res.status(200).json(data.rows);
  } catch (err) {
    console.log("error occured in getAccordion controller ", err.message);
  }
};
