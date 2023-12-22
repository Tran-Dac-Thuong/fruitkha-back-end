"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class New extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      New.hasMany(models.Comment, {
        foreignKey: "news_id",
        as: "newsCommentData",
      });
    }
  }
  New.init(
    {
      title: DataTypes.TEXT,
      content: DataTypes.TEXT,
      image: DataTypes.TEXT,
      author: DataTypes.TEXT,
      created_at: DataTypes.TEXT,
    },
    {
      sequelize,
      modelName: "New",
    }
  );
  return New;
};
