"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Contact extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Contact.init(
    {
      customer_email: DataTypes.TEXT,
      customer_name: DataTypes.TEXT,
      subject: DataTypes.TEXT,
      message: DataTypes.TEXT,
      phone: DataTypes.TEXT,
      created_at: DataTypes.TEXT,
    },
    {
      sequelize,
      modelName: "Contact",
    }
  );
  return Contact;
};
