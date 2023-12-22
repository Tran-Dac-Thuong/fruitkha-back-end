"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      User.hasMany(models.Cart, {
        foreignKey: "user_id",
        as: "userCartData",
      });
      User.hasMany(models.Order, {
        foreignKey: "user_id",
        as: "userOrderData",
      });
      User.hasMany(models.Comment, {
        foreignKey: "user_id",
        as: "userCommentData",
      });
    }
  }
  User.init(
    {
      first_name: DataTypes.TEXT,
      last_name: DataTypes.TEXT,
      email: DataTypes.TEXT,
      password: DataTypes.TEXT,
      role: DataTypes.TEXT,
      auth_provider: DataTypes.TEXT,
      avatar: DataTypes.TEXT,
    },
    {
      sequelize,
      modelName: "User",
    }
  );
  return User;
};
