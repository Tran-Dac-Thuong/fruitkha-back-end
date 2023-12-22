const sql = require("../models/index.js");
const EmailService = require("../service/EmailService.js");
const fs = require("fs");
const { Op } = require("sequelize");

let getAllProduct = async (req, res) => {
  let productData = [];
  if (req.query.page && req.query.limit) {
    let page = +req.query.page;
    let limit = +req.query.limit;
    let offset = (page - 1) * limit;
    const { count, rows } = await sql.Product.findAndCountAll({
      offset: offset,
      limit: limit,
    });
    let data = {
      totalRows: count,
      totalPages: Math.ceil(count / limit),
      products: rows,
    };
    if (data.products.length > 0) {
      return res.status(200).json({
        message: "OK",
        products: data.products,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        products: data.products,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    }
  } else {
    productData = await sql.Product.findAll();
    if (productData.length > 0) {
      return res.status(200).json({
        message: "OK",
        products: productData,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        products: productData,
      });
    }
  }
};

let getRelateProduct = async (req, res) => {
  let { id } = req.params;

  let resault = [];
  resault = await sql.Product.findAll({
    where: {
      id: {
        [Op.ne]: id,
      },
    },
  });

  return res.status(200).json({
    relateProducts: resault,
  });
};

let getProductById = async (req, res) => {
  let { id } = req.params;

  let product = {};
  product = await sql.Product.findOne({
    where: {
      id: id,
    },
  });

  return res.status(200).json({
    products: product,
  });
};

let createNewProduct = async (req, res) => {
  let { product_name, description, price, quantity } = req.body;

  let image = req.file.filename;

  await sql.Product.create({
    product_name: product_name,
    description: description,
    price: price,
    quantity: quantity,
    image: image,
    status: "Stocking",
  });

  return res.status(200).json({
    message: "Create success",
  });
};

let updateProduct = async (req, res) => {
  let { product_name, description, price, quantity, id } = req.body;
  if (!req.file) {
    await sql.Product.update(
      {
        product_name: product_name,
        description: description,
        price: price,
        quantity: quantity,
      },
      {
        where: {
          id: id,
        },
      }
    );
  } else {
    let images = req.file.filename;

    let product = {};
    product = await sql.Product.findOne({
      where: {
        id: id,
      },
    });
    product = product.get({ plain: true });
    fs.unlinkSync(`./asset/images/fruits/${product.image}`);

    await sql.Product.update(
      {
        product_name: product_name,
        description: description,
        price: price,
        quantity: quantity,
        image: images,
      },
      {
        where: {
          id: id,
        },
      }
    );
  }

  return res.status(200).json({
    message: "Update success",
  });
};

let deleteProduct = async (req, res) => {
  let productId = req.params.id;

  if (!productId) {
    return res.status(200).json({
      message: "Missing required params",
    });
  }

  let product = {};
  product = await sql.Product.findOne({
    where: {
      id: productId,
    },
  });
  product = product.get({ plain: true });
  fs.unlinkSync(`./asset/images/fruits/${product.image}`);

  await sql.Product.destroy({
    where: {
      id: productId,
    },
  });

  return res.status(200).json({
    message: "Delete success",
  });
};

let searchProductByName = async (req, res) => {
  let { nameKeyword } = req.body;

  let productsByName = await sql.Product.findAll({
    where: {
      product_name: {
        [Op.like]: `%${nameKeyword}%`,
      },
    },
  });

  if (productsByName) {
    return res.status(200).json({
      message: "OK",
      search_product: productsByName,
    });
  } else {
    return res.status(200).json({
      message: "Fail",
      search_product: productsByName,
    });
  }
};

let getAllNews = async (req, res) => {
  let newsData = [];
  if (req.query.page && req.query.limit) {
    let page = +req.query.page;
    let limit = +req.query.limit;
    let offset = (page - 1) * limit;
    const { count, rows } = await sql.New.findAndCountAll({
      offset: offset,
      limit: limit,
    });
    let data = {
      totalRows: count,
      totalPages: Math.ceil(count / limit),
      news: rows,
    };
    if (data.news.length > 0) {
      return res.status(200).json({
        message: "OK",
        news: data.news,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        news: data.news,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    }
  } else {
    newsData = await sql.New.findAll();
    if (newsData.length > 0) {
      return res.status(200).json({
        message: "OK",
        news: newsData,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        news: newsData,
      });
    }
  }
};

let getNewsById = async (req, res) => {
  let { id } = req.params;

  let resault = {};
  resault = await sql.New.findOne({
    where: {
      id: id,
    },
  });
  return res.status(200).json({
    news: resault,
  });
};

let createNewNews = async (req, res) => {
  let { title, content, created_at } = req.body;

  let image = req.file.filename;

  await sql.New.create({
    title: title,
    content: content,
    created_at: created_at,
    author: "Admin",
    image: image,
  });

  return res.status(200).json({
    message: "Create success",
  });
};

let updateNews = async (req, res) => {
  let { title, content, id } = req.body;

  if (!req.file) {
    await sql.New.update(
      {
        title: title,
        content: content,
      },
      {
        where: {
          id: id,
        },
      }
    );
  } else {
    let images = req.file.filename;

    let news = {};
    news = await sql.New.findOne({
      where: {
        id: id,
      },
    });
    news = news.get({ plain: true });
    fs.unlinkSync(`./asset/images/news/${news.image}`);

    await sql.New.update(
      {
        title: title,
        content: content,
        image: images,
      },
      {
        where: {
          id: id,
        },
      }
    );
  }

  return res.status(200).json({
    message: "Update success",
  });
};

let deleteNews = async (req, res) => {
  let newsId = req.params.id;

  if (!newsId) {
    return res.status(200).json({
      message: "Missing required params",
    });
  }

  let news = {};
  news = await sql.New.findOne({
    where: {
      id: newsId,
    },
  });
  news = news.get({ plain: true });
  fs.unlinkSync(`./asset/images/news/${news.image}`);

  await sql.New.destroy({
    where: {
      id: newsId,
    },
  });

  return res.status(200).json({
    message: "Delete success",
  });
};

let searchNewsByDate = async (req, res) => {
  let { dateKeywordFormat } = req.body;

  let newsByDate = await sql.New.findAll({
    where: {
      created_at: {
        [Op.like]: `%${dateKeywordFormat}%`,
      },
    },
  });

  if (newsByDate) {
    return res.status(200).json({
      message: "OK",
      search_news: newsByDate,
    });
  } else {
    return res.status(200).json({
      message: "Fail",
      search_news: newsByDate,
    });
  }
};

let getAllContacts = async (req, res) => {
  let contactData = [];
  if (req.query.page && req.query.limit) {
    let page = +req.query.page;
    let limit = +req.query.limit;
    let offset = (page - 1) * limit;
    const { count, rows } = await sql.Contact.findAndCountAll({
      offset: offset,
      limit: limit,
    });
    let data = {
      totalRows: count,
      totalPages: Math.ceil(count / limit),
      contacts: rows,
    };
    if (data.contacts.length > 0) {
      return res.status(200).json({
        message: "OK",
        contacts: data.contacts,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        contacts: data.contacts,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    }
  } else {
    contactData = await sql.Contact.findAll();
    if (contactData.length > 0) {
      return res.status(200).json({
        message: "OK",
        contacts: contactData,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        contacts: contactData,
      });
    }
  }
};

let searchContactsByDate = async (req, res) => {
  let { dateKeywordFormat } = req.body;

  let contactByDate = await sql.Contact.findAll({
    where: {
      created_at: {
        [Op.like]: `%${dateKeywordFormat}%`,
      },
    },
  });

  if (contactByDate) {
    return res.status(200).json({
      message: "OK",
      search_contacts: contactByDate,
    });
  } else {
    return res.status(200).json({
      message: "Fail",
      search_contacts: contactByDate,
    });
  }
};

let deleteContact = async (req, res) => {
  let contactId = req.params.id;

  if (!contactId) {
    return res.status(200).json({
      message: "Missing required params",
    });
  }

  await sql.Contact.destroy({
    where: {
      id: contactId,
    },
  });

  return res.status(200).json({
    message: "Delete success",
  });
};

let sendEmailToCustomer = async (req, res) => {
  try {
    let send = await EmailService.sendEmail(req.body);
    return res.status(200).json({
      mailData: send,
      message: "Send success",
    });
  } catch (error) {
    console.log(error);
    return res.status(200).json({
      message: "Error from server",
    });
  }
};

let searchProductByStatus = async (req, res) => {
  let { productSoldoutStatus, productStockingStatus } = req.body;

  let productsByStatus = await sql.Product.findAll({
    where: {
      [Op.or]: [
        { status: { [Op.like]: `%${productSoldoutStatus}%` } },
        { status: { [Op.like]: `%${productStockingStatus}%` } },
      ],
    },
  });

  if (productsByStatus) {
    return res.status(200).json({
      message: "OK",
      search_product_by_status: productsByStatus,
    });
  } else {
    return res.status(200).json({
      message: "Fail",
      search_product_by_status: productsByStatus,
    });
  }
};

let updateStatusProduct = async (req, res) => {
  let { status, id } = req.body;

  await sql.Product.update(
    {
      status: status,
    },
    {
      where: {
        id: id,
      },
    }
  );

  return res.status(200).json({
    message: "Update success",
  });
};

let getAllOrders = async (req, res) => {
  let ordersData = [];

  if (req.query.page && req.query.limit) {
    let page = +req.query.page;
    let limit = +req.query.limit;
    let offset = (page - 1) * limit;
    const { count, rows } = await sql.Order.findAndCountAll({
      offset: offset,
      limit: limit,
      include: [
        { model: sql.Product, as: "productOrderData" },
        { model: sql.User, as: "userOrderData" },
      ],
    });
    let data = {
      totalRows: count,
      totalPages: Math.ceil(count / limit),
      orders: rows,
    };
    if (data.orders.length > 0) {
      return res.status(200).json({
        message: "OK",
        orders: data.orders,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        orders: data.orders,
        totalPages: data.totalPages,
        totalRows: data.totalRows,
      });
    }
  } else {
    ordersData = await sql.Order.findAll();
    if (ordersData.length > 0) {
      return res.status(200).json({
        message: "OK",
        orders: ordersData,
      });
    } else {
      return res.status(200).json({
        message: "Not found",
        orders: ordersData,
      });
    }
  }
};

let deleteOrder = async (req, res) => {
  let { orderId } = req.params;

  if (!orderId) {
    return res.status(200).json({
      message: "Missing required params",
    });
  }

  await sql.Order.destroy({
    where: {
      id: orderId,
    },
  });

  return res.status(200).json({
    message: "Delete success",
  });
};

let searchOrdersByDate = async (req, res) => {
  let { dateKeywordFormat } = req.body;

  let orderByDate = await sql.Order.findAll({
    where: {
      date: {
        [Op.like]: `%${dateKeywordFormat}%`,
      },
    },
    include: [
      { model: sql.Product, as: "productOrderData" },
      { model: sql.User, as: "userOrderData" },
    ],
  });

  if (orderByDate) {
    return res.status(200).json({
      message: "OK",
      search_orders: orderByDate,
    });
  } else {
    return res.status(200).json({
      message: "Fail",
      search_orders: orderByDate,
    });
  }
};

let getTotalOrder = async (req, res) => {
  let resault = [];
  resault = await sql.Order.findAll({
    include: [{ model: sql.Product, as: "productOrderData" }],
  });

  return res.status(200).json({
    message: "OK",
    totalOrders: resault,
  });
};

let getTotalOrderByPendingStatus = async (req, res) => {
  let resault = [];
  resault = await sql.Order.findAll({
    where: {
      status: "Shipping in progress",
    },
  });

  return res.status(200).json({
    message: "OK",
    pendingRequest: resault,
  });
};

let getTotalUser = async (req, res) => {
  let resault = [];
  resault = await sql.User.findAll({
    where: {
      role: "CUSTOMER",
    },
  });

  return res.status(200).json({
    message: "OK",
    totalUsers: resault,
  });
};

module.exports = {
  getAllProduct,
  createNewProduct,
  updateProduct,
  deleteProduct,
  getAllNews,
  createNewNews,
  updateNews,
  deleteNews,
  getAllContacts,
  deleteContact,
  sendEmailToCustomer,
  getNewsById,
  getProductById,
  getRelateProduct,
  searchProductByName,
  searchNewsByDate,
  searchProductByStatus,
  updateStatusProduct,
  searchContactsByDate,
  getAllOrders,
  deleteOrder,
  searchOrdersByDate,
  getTotalOrder,
  getTotalUser,
  getTotalOrderByPendingStatus,
};
