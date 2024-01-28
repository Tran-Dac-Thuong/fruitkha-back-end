var jwt = require("jsonwebtoken");
const EmailService = require("../service/EmailService.js");

const fs = require("fs");
const sql = require("../models/index.js");
const { Op } = require("sequelize");
var bcrypt = require("bcryptjs");
const OpenAI = require("openai").OpenAI;

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

const salt = bcrypt.genSaltSync(10);

let registerUser = async (req, res) => {
  let { firstName, lastName, email, password, authProvider, avatar } = req.body;

  if (!firstName || !lastName || !email || !password) {
    return res.status(500).json({
      message: "Missing input",
    });
  }

  let user = {};
  user = await sql.User.findOne({
    where: {
      email: email,
    },
  });

  user === null ? {} : (user = user.get({ plain: true }));

  if (user !== null) {
    return res.status(200).json({
      errCode: 1,
      message: "Email has already exist",
    });
  }

  let hashPassword = bcrypt.hashSync(password, salt);

  await sql.User.create({
    first_name: firstName,
    last_name: lastName,
    email: email,
    password: hashPassword,
    role: "CUSTOMER",
    auth_provider: authProvider,
    avatar: avatar,
  });

  return res.status(200).json({
    errCode: 0,
    message: "Register success!",
  });
};

let loginUser = async (req, res) => {
  let { email, password } = req.body;
  if (!email || !password) {
    return res.status(500).json({
      message: "Missing input",
    });
  }

  let user = {};
  user = await sql.User.findOne({
    where: {
      email: email,
    },
  });
  user === null ? {} : (user = user.get({ plain: true }));

  if (user !== null) {
    let checkPass = bcrypt.compareSync(password, user.password);
    if (checkPass === true) {
      let token = jwt.sign(
        {
          id: user.id,
          firstName: user.first_name,
          lastName: user.last_name,
          email: user.email,
          role: user.role,
          auth_provider: user.auth_provider,
          avatar: user.avatar,
        },
        "jwtSecret"
      );

      return res.status(200).json({
        errCode: 0,
        token: token,
        currentUser: user,
        message: "Login success!",
      });
    }
  }

  return res.status(200).json({
    errCode: 1,
    message: "Invalid email or password",
  });
};

let checkCookie = (req, res, next) => {
  let token = req.headers["access-token"];
  if (!token) {
    return res.status(200).json({
      message: "You are not have token!",
    });
  } else {
    jwt.verify(token, "jwtSecret", (err, decoded) => {
      if (err) {
        return res.status(200).json({
          message: "Fail",
        });
      } else {
        return res.status(200).json({
          message: "Success",
          id: decoded.id,
          avatar: decoded.avatar,
          auth_provider: decoded.auth_provider,
          username: decoded.firstName + " " + decoded.lastName,
          firstName: decoded.firstName,
          lastName: decoded.lastName,
          email: decoded.email,
          role: decoded.role,
        });
      }
    });
  }
};

let logoutUser = (req, res) => {
  return res.status(200).json({
    errCode: 0,
    message: "Logout success!",
  });
};

let sendMailToResetPassword = async (req, res) => {
  let { email } = req.body;

  let user = {};
  user = await sql.User.findOne({
    where: {
      email: email,
    },
  });
  user = user.get({ plain: true });

  if (user === null) {
    return res.status(200).json({
      errCode: 1,
      message: "This email is not registered",
    });
  }

  let token = jwt.sign(
    {
      id: user.id,
    },
    "secretKey",
    { expiresIn: "1d" }
  );

  let userId = user.id;

  await EmailService.sendEmailToResetPassword(userId, email, token);

  return res.status(200).json({
    errCode: 0,
    message: "Send mail success!",
  });
};

let resetPassword = async (req, res) => {
  let { id, token } = req.params;
  let { password } = req.body;

  jwt.verify(token, "secretKey", async (err, decoded) => {
    if (err) {
      return res.status(200).json({
        message: "Fail",
      });
    } else {
      let hashPassword = bcrypt.hashSync(password, salt);
      await sql.User.update(
        {
          password: hashPassword,
        },
        {
          where: {
            id: id,
          },
        }
      );
      return res.status(200).json({
        message: "Reset success",
      });
    }
  });
};

let saveProfile = async (req, res) => {
  let { firstName, lastName, id } = req.body;
  if (!req.file) {
    await sql.User.update(
      {
        first_name: firstName,
        last_name: lastName,
      },
      {
        where: {
          id: id,
        },
      }
    );
  } else {
    let avatars = req.file.filename;

    let user = {};
    user = await sql.User.findOne({
      where: {
        id: id,
      },
    });
    user = user.get({ plain: true });

    if (user.avatar === null || user.avatar === "undefined") {
      await sql.User.update(
        {
          first_name: firstName,
          last_name: lastName,
          avatar: avatars,
        },
        {
          where: {
            id: id,
          },
        }
      );
    } else {
      fs.unlinkSync(`./asset/images/users/${user.avatar}`);

      await sql.User.update(
        {
          first_name: firstName,
          last_name: lastName,
          avatar: avatars,
        },
        {
          where: {
            id: id,
          },
        }
      );
    }
  }

  let user = {};
  user = await sql.User.findOne({
    where: {
      id: id,
    },
  });
  user = user.get({ plain: true });

  let token = jwt.sign(
    {
      id: user.id,
      firstName: user.first_name,
      lastName: user.last_name,
      email: user.email,
      role: user.role,
      auth_provider: user.auth_provider,
      avatar: user.avatar,
    },
    "jwtSecret"
  );

  return res.status(200).json({
    errCode: 0,
    token: token,
    message: "Save profile success!",
  });
};

let getSomeNews = async (req, res) => {
  let resault = [];
  resault = await sql.New.findAll({ limit: 3 });

  return res.status(200).json({
    someNews: resault,
  });
};

let getRecentNews = async (req, res) => {
  let resault = [];
  resault = await sql.New.findAll({ limit: 5 });

  return res.status(200).json({
    recentNews: resault,
  });
};

let sendMailToSubscribe = async (req, res) => {
  let { email } = req.body;
  await EmailService.sendMailToSubscribe(email);

  return res.status(200).json({
    errCode: 0,
    message: "Subscribe success",
  });
};

let sendContact = async (req, res) => {
  let {
    contactName,
    contactEmail,
    contactSubject,
    contactMessage,
    contactPhone,
    contactCreateAt,
  } = req.body;

  await sql.Contact.create({
    customer_email: contactEmail,
    customer_name: contactName,
    subject: contactSubject,
    message: contactMessage,
    phone: contactPhone,
    created_at: contactCreateAt,
  });
  return res.status(200).json({
    errCode: 0,
    message: "Submit success",
  });
};

let searchProductByPrice = async (req, res) => {
  let { range } = req.body;

  let productsByPrice = await sql.Product.findAll({
    where: {
      price: range,
    },
  });

  if (productsByPrice) {
    return res.status(200).json({
      message: "OK",
      search_product: productsByPrice,
    });
  } else {
    return res.status(200).json({
      message: "Fail",
      search_product: productsByPrice,
    });
  }
};

let addToCart = async (req, res) => {
  let { productId, userId, newQuantity } = req.body;

  let cart = {};
  cart = await sql.Cart.findOne({
    where: {
      product_id: productId,
      user_id: userId,
    },
  });

  if (cart !== null) {
    cart = cart.get({ plain: true });

    let addQuantity = cart.quantity + newQuantity;

    await sql.Cart.update(
      {
        quantity: addQuantity,
      },
      {
        where: {
          id: cart.id,
        },
      }
    );

    return res.status(200).json({
      message: "OK",
    });
  } else {
    await sql.Cart.create({
      quantity: newQuantity,
      product_id: productId,
      user_id: userId,
    });
    return res.status(200).json({
      message: "OK",
    });
  }
};

let getCartItemsByUserId = async (req, res) => {
  let { userId } = req.params;

  let cartsByUserId = [];
  cartsByUserId = await sql.Cart.findAll({
    where: {
      user_id: userId,
    },
    include: [{ model: sql.Product, as: "productCartData" }],
  });

  return res.status(200).json({
    message: "OK",
    carts: cartsByUserId,
  });
};

let removeFromCart = async (req, res) => {
  let { cartId } = req.params;

  await sql.Cart.destroy({
    where: {
      id: cartId,
    },
  });

  return res.status(200).json({
    message: "Remove success",
  });
};

let placeOrder = async (req, res) => {
  let { userId, productId, quantity, paymentMethod, status, totalCost, date } =
    req.body;

  await sql.Order.create({
    user_id: userId,
    product_id: productId,
    quantity: quantity,
    payment_method: paymentMethod,
    status: status,
    total_cost: totalCost,
    date: date,
  });
  return res.status(200).json({
    errCode: 0,
    message: "OK",
  });
};

let getAllOrdersByUserId = async (req, res) => {
  let { userId } = req.params;

  let ordersByUserId = [];
  ordersByUserId = await sql.Order.findAll({
    where: {
      user_id: userId,
    },
    include: [{ model: sql.Product, as: "productOrderData" }],
  });
  if (ordersByUserId.length > 0) {
    return res.status(200).json({
      message: "OK",
      orders: ordersByUserId,
    });
  } else {
    return res.status(200).json({
      message: "Not found",
    });
  }
};

let getCurrentUserById = async (req, res) => {
  let { userId } = req.params;

  let currentUser = {};
  currentUser = await sql.User.findOne({
    where: {
      id: userId,
    },
    attributes: {
      exclude: ["password"],
    },
  });

  if (currentUser !== null) {
    currentUser = currentUser.get({ plain: true });

    return res.status(200).json({
      message: "OK",
      currentUser: currentUser,
    });
  } else {
    return res.status(200).json({
      message: "Not found",
      currentUser: {},
    });
  }
};

let updateStatusOrder = async (req, res) => {
  let { status, id } = req.body;

  await sql.Order.update(
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

let momoPaymentController = async (req, res) => {
  let { cost } = req.body;

  //https://developers.momo.vn/#/docs/en/aiov2/?id=payment-method
  //parameters
  var partnerCode = "MOMO";
  var accessKey = "F8BBA842ECF85";
  var secretkey = "K951B6PE1waDMi640xX08PD3vg6EkVlz";
  var requestId = partnerCode + new Date().getTime();
  var orderId = requestId;
  var orderInfo = "pay with MoMo";
  var redirectUrl = "https://fruitkha-three.vercel.app";
  var ipnUrl = "https://fruitkha-three.vercel.app";
  // var ipnUrl = redirectUrl = "https://webhook.site/454e7b77-f177-4ece-8236-ddf1c26ba7f8";
  var amount = cost;
  var requestType = "payWithATM";
  // var requestType = "captureWallet";
  var extraData = ""; //pass empty value if your merchant does not have stores

  //before sign HMAC SHA256 with format
  //accessKey=$accessKey&amount=$amount&extraData=$extraData&ipnUrl=$ipnUrl&orderId=$orderId&orderInfo=$orderInfo&partnerCode=$partnerCode&redirectUrl=$redirectUrl&requestId=$requestId&requestType=$requestType
  var rawSignature =
    "accessKey=" +
    accessKey +
    "&amount=" +
    amount +
    "&extraData=" +
    extraData +
    "&ipnUrl=" +
    ipnUrl +
    "&orderId=" +
    orderId +
    "&orderInfo=" +
    orderInfo +
    "&partnerCode=" +
    partnerCode +
    "&redirectUrl=" +
    redirectUrl +
    "&requestId=" +
    requestId +
    "&requestType=" +
    requestType;
  //puts raw signature
  console.log("--------------------RAW SIGNATURE----------------");
  console.log(rawSignature);
  //signature
  const crypto = require("crypto");
  var signature = crypto
    .createHmac("sha256", secretkey)
    .update(rawSignature)
    .digest("hex");
  console.log("--------------------SIGNATURE----------------");
  console.log(signature);

  //json object send to MoMo endpoint
  const requestBody = JSON.stringify({
    partnerCode: partnerCode,
    accessKey: accessKey,
    requestId: requestId,
    amount: amount,
    orderId: orderId,
    orderInfo: orderInfo,
    redirectUrl: redirectUrl,
    ipnUrl: ipnUrl,
    extraData: extraData,
    requestType: requestType,
    signature: signature,
    lang: "en",
  });
  //Create the HTTPS objects
  const https = require("https");
  const options = {
    hostname: "test-payment.momo.vn",
    port: 443,
    path: "/v2/gateway/api/create",
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Content-Length": Buffer.byteLength(requestBody),
    },
  };
  //Send the request and get the response
  const reqMomo = https.request(options, (resMomo) => {
    console.log(`Status: ${resMomo.statusCode}`);
    console.log(`Headers: ${JSON.stringify(resMomo.headers)}`);
    resMomo.setEncoding("utf8");
    resMomo.on("data", (body) => {
      console.log("Body: ");
      console.log(body);
      console.log("payUrl: ");
      console.log(JSON.parse(body).payUrl);
      return res.status(200).json({
        message: "OK",
        payUrl: JSON.parse(body).payUrl,
      });
    });

    resMomo.on("end", () => {
      console.log("No more data in response.");
    });
  });

  reqMomo.on("error", (e) => {
    console.log(`problem with request: ${e.message}`);
  });
  // write data to request body
  console.log("Sending....");
  reqMomo.write(requestBody);
  reqMomo.end();
};

let getAllCommentsByNewId = async (req, res) => {
  let { newId } = req.params;

  let commentData = [];

  commentData = await sql.Comment.findAll({
    where: {
      news_id: newId,
    },
    include: [
      {
        model: sql.User,
        as: "userCommentData",
        attributes: {
          exclude: ["password"],
        },
      },
    ],
  });
  if (commentData.length > 0) {
    return res.status(200).json({
      message: "OK",
      comments: commentData,
    });
  } else {
    return res.status(200).json({
      message: "Not found",
      comments: commentData,
    });
  }
};

let sendComment = async (req, res) => {
  let { comment, newsId, userId, created_at } = req.body;
  await sql.Comment.create({
    user_id: userId,
    news_id: newsId,
    content: comment,
    created_at: created_at,
  });

  return res.status(200).json({
    message: "OK",
  });
};

let updateComment = async (req, res) => {
  let { editContent, commentId } = req.body;

  await sql.Comment.update(
    {
      content: editContent,
    },
    {
      where: {
        id: commentId,
      },
    }
  );

  return res.status(200).json({
    message: "Update success",
  });
};

let deleteComment = async (req, res) => {
  let { commentId } = req.params;

  if (!commentId) {
    return res.status(200).json({
      message: "Missing required params",
    });
  }

  await sql.Comment.destroy({
    where: {
      id: commentId,
    },
  });

  return res.status(200).json({
    message: "Delete success",
  });
};

let chatBotAI = async (req, res) => {
  try {
    let prompt = req.body.message;

    let chatCompletion = await openai.chat.completions.create({
      messages: [{ role: "user", content: prompt }],
      model: "gpt-3.5-turbo",
    });

    return res.status(200).json({
      errCode: 0,
      chatBotMessage: chatCompletion.choices[0].message.content,
    });
  } catch (error) {
    console.error(error);
  }
};

module.exports = {
  registerUser,
  loginUser,
  checkCookie,
  logoutUser,
  sendMailToResetPassword,
  resetPassword,
  saveProfile,
  getSomeNews,
  sendMailToSubscribe,
  getRecentNews,
  sendContact,
  searchProductByPrice,
  addToCart,
  getCartItemsByUserId,
  removeFromCart,
  placeOrder,
  getAllOrdersByUserId,
  getCurrentUserById,
  updateStatusOrder,
  momoPaymentController,
  sendComment,
  getAllCommentsByNewId,
  updateComment,
  deleteComment,
  chatBotAI,
};
