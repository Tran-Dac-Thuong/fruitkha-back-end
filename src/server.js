const express = require("express");
const bodyParser = require("body-parser");
var cookieParser = require("cookie-parser");
const connectionDB = require("./config/connectionSequelize.js");
// import connection from "./config/connectionSequelize";

require("dotenv").config();

const app = express();
const port = process.env.PORT;
const cors = require("cors");

app.use(cookieParser());
app.use(express.static("asset"));
app.set("view engine", "ejs");
app.set("views", "./src/views");
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(
  cors({
    origin: "http://localhost:3000",
  })
);

connectionDB();

app.use("/api/", require("./routes/web.js"));

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
