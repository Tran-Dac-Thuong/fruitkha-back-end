"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Order extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Order.belongsTo(models.User, {
        foreignKey: "user_id",
        targetKey: "id",
        as: "userOrderData",
      });
      Order.belongsTo(models.Product, {
        foreignKey: "product_id",
        targetKey: "id",
        as: "productOrderData",
      });
    }
  }
  Order.init(
    {
      user_id: DataTypes.INTEGER,
      product_id: DataTypes.INTEGER,
      quantity: DataTypes.INTEGER,
      payment_method: DataTypes.TEXT,
      status: DataTypes.TEXT,
      total_cost: DataTypes.DOUBLE,
      date: DataTypes.TEXT,
    },
    {
      sequelize,
      modelName: "Order",
    }
  );
  return Order;
};
