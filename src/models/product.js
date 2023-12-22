"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Product extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Product.hasMany(models.Cart, {
        foreignKey: "product_id",
        as: "productCartData",
      });
      Product.hasMany(models.Order, {
        foreignKey: "product_id",
        as: "productOrderData",
      });
    }
  }
  Product.init(
    {
      product_name: DataTypes.TEXT,
      price: DataTypes.DOUBLE,
      quantity: DataTypes.INTEGER,
      image: DataTypes.TEXT,
      description: DataTypes.TEXT,
      status: DataTypes.TEXT,
    },
    {
      sequelize,
      modelName: "Product",
    }
  );
  return Product;
};
