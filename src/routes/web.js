const express = require("express");
const APIController = require("../controller/adminController.js");
const HomeController = require("../controller/userController.js");
let router = express.Router();
const multer = require("multer");
const path = require("path");

const storageFruits = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "asset/images/fruits");
  },
  filename: (req, file, cb) => {
    cb(
      null,
      file.fieldname + "_" + Date.now() + path.extname(file.originalname)
    );
  },
});

const storageNews = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "asset/images/news");
  },
  filename: (req, file, cb) => {
    cb(
      null,
      file.fieldname + "_" + Date.now() + path.extname(file.originalname)
    );
  },
});

const storageUsers = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "asset/images/users");
  },
  filename: (req, file, cb) => {
    cb(
      null,
      file.fieldname + "_" + Date.now() + path.extname(file.originalname)
    );
  },
});

const uploadFruits = multer({
  storage: storageFruits,
});

const uploadNews = multer({
  storage: storageNews,
});

const uploadUsers = multer({
  storage: storageUsers,
});

router.get("/products", APIController.getAllProduct);

router.get("/products/:id", APIController.getProductById);

router.get("/relate-products/:id", APIController.getRelateProduct);

router.post(
  "/create-product",
  uploadFruits.single("image"),
  APIController.createNewProduct
);
router.put(
  "/update-product",
  uploadFruits.single("image"),
  APIController.updateProduct
);

router.delete("/delete-product/:id", APIController.deleteProduct);
router.post("/search-product-by-name", APIController.searchProductByName);

router.post("/search-product-by-status", APIController.searchProductByStatus);

router.post("/search-product-by-price", HomeController.searchProductByPrice);

router.post("/add-to-cart", HomeController.addToCart);

router.post("/place-order", HomeController.placeOrder);

router.get("/get-cart-items/:userId", HomeController.getCartItemsByUserId);

router.delete("/remove-from-cart/:cartId", HomeController.removeFromCart);

router.put("/update-status-product", APIController.updateStatusProduct);

router.get("/news", APIController.getAllNews);

router.get("/news/:id", APIController.getNewsById);

router.post(
  "/create-news",
  uploadNews.single("image"),
  APIController.createNewNews
);
router.put(
  "/update-news",
  uploadNews.single("image"),
  APIController.updateNews
);

router.delete("/delete-news/:id", APIController.deleteNews);

router.post("/search-news-by-date", APIController.searchNewsByDate);

router.post("/search-contacts-by-date", APIController.searchContactsByDate);

router.get("/contacts", APIController.getAllContacts);

router.delete("/delete-contact/:id", APIController.deleteContact);

router.post("/send-email", APIController.sendEmailToCustomer);

router.post("/register-user", HomeController.registerUser);
router.post("/login-user", HomeController.loginUser);

router.get("/check-cookie", HomeController.checkCookie);

router.get("/logout", HomeController.logoutUser);

router.post("/forgot-password", HomeController.sendMailToResetPassword);
router.post("/reset-password/:id/:token", HomeController.resetPassword);

router.put(
  "/update-profile",
  uploadUsers.single("image"),
  HomeController.saveProfile
);

router.get("/some-news", HomeController.getSomeNews);

router.get("/recent-news", HomeController.getRecentNews);

router.post("/send-contact", HomeController.sendContact);

router.post("/send-email-subscribe", HomeController.sendMailToSubscribe);

router.get("/orders", APIController.getAllOrders);

router.get("/get-orders-by-user/:userId", HomeController.getAllOrdersByUserId);

router.delete("/delete-order/:orderId", APIController.deleteOrder);

router.post("/search-orders-by-date", APIController.searchOrdersByDate);

router.put("/update-status-order", HomeController.updateStatusOrder);

router.get("/get-current-user/:userId", HomeController.getCurrentUserById);

router.post("/payment-momo", HomeController.momoPaymentController);

router.post("/send-comment", HomeController.sendComment);

router.get("/get-all-comments/:newId", HomeController.getAllCommentsByNewId);

router.get("/get-total-orders", APIController.getTotalOrder);

router.get("/get-total-users", APIController.getTotalUser);

router.get("/get-total-pending", APIController.getTotalOrderByPendingStatus);

router.delete("/delete-comment/:commentId", HomeController.deleteComment);

router.put("/update-comment", HomeController.updateComment);

router.post("/chat-with-ai", HomeController.chatBotAI);

module.exports = router;
