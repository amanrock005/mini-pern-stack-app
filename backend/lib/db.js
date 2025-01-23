import pkg from "pg";
const { Client } = pkg;

const client = new Client({
  user: "postgres",
  password: "aman",
  host: "localhost",
  port: "5432",
  database: "Youtube",
});

const connectToDB = async () => {
  try {
    await client.connect();
    console.log("successfully connected to DB");
  } catch (err) {
    console.log("error occured: couldn't connect to DB");
  }
};

export { connectToDB, client };
