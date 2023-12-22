const { Client } = require("pg");

const connection = new Client({
  host: "localhost",
  user: "postgres",
  port: 5432,
  password: "12345",
  database: "web_app_db",
});

module.exports = connection;
