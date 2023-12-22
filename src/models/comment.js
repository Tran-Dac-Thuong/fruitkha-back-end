"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Comment extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Comment.belongsTo(models.User, {
        foreignKey: "user_id",
        targetKey: "id",
        as: "userCommentData",
      });
      Comment.belongsTo(models.New, {
        foreignKey: "news_id",
        targetKey: "id",
        as: "newsCommentData",
      });
    }
  }
  Comment.init(
    {
      user_id: DataTypes.INTEGER,
      news_id: DataTypes.INTEGER,
      content: DataTypes.TEXT,
      created_at: DataTypes.TEXT,
    },
    {
      sequelize,
      modelName: "Comment",
    }
  );
  return Comment;
};
