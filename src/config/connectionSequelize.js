const { Sequelize } = require("sequelize");

const sequelize = new Sequelize(
  "postgres",
  "postgres.riynwtbduiydbvtbesha",
  "ehSNR59nR5OMstJY",
  {
    host: "aws-0-ap-southeast-1.pooler.supabase.com",
    dialect: "postgres",
  }
);

const connectionSequelize = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
};

module.exports = connectionSequelize;
