const nodemailer = require("nodemailer");
require("dotenv").config();

let sendEmail = async (dataSend) => {
  // create reusable transporter object using the default SMTP transport
  let transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: process.env.EMAIL_APP, // generated ethereal user
      pass: process.env.EMAIL_APP_PASSWORD, // generated ethereal password
    },
  });

  // send mail with defined transport object
  let info = await transporter.sendMail({
    from: '"Fruitkha-Fresh Fruits Online" <hoangdeptraibodoiqua4321@gmail.com>', // sender address
    to: dataSend.cusEmail, // list of receivers
    subject: "Answer customer questions", // Subject line
    html: `<p>Dear User,</p>
    <p>We have received your question.</p>
    <p>Our answer is ${dataSend.answer}.</p>
    <p>Thank you for using our service.</p>
    <p>Regards,</p>
    <p>Fruitkha Team</p>`, // html body
  });
};

let sendEmailToResetPassword = async (userId, email, token) => {
  // create reusable transporter object using the default SMTP transport
  let transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: process.env.EMAIL_APP, // generated ethereal user
      pass: process.env.EMAIL_APP_PASSWORD, // generated ethereal password
    },
  });

  // send mail with defined transport object
  let info = await transporter.sendMail({
    from: '"Fruitkha-Fresh Fruits Online" <hoangdeptraibodoiqua4321@gmail.com>', // sender address
    to: email, // list of receivers
    subject: "Replacement login information at Fruitkha", // Subject line
    html: `<p>Dear User,</p>
    <p>A request to reset the password for your account has been made at Fruitkha.</p>
    <p>You may now log in by clicking this link or copying and pasting it to your browser:</p>
    <p>https://fruitkha-three.vercel.app/reset-password/${userId}/${token}</p>
    <p>NOTE: This link can only be used once to log in and will lead you to a page where you can set your password. It expires after one day and nothing will happen if it's not used.</p>
    <p>Regards,</p>
    <p>Fruitkha Team</p>`, // html body
  });
};

let sendMailToSubscribe = async (email) => {
  // create reusable transporter object using the default SMTP transport
  let transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: process.env.EMAIL_APP, // generated ethereal user
      pass: process.env.EMAIL_APP_PASSWORD, // generated ethereal password
    },
  });

  // send mail with defined transport object
  let info = await transporter.sendMail({
    from: '"Fruitkha-Fresh Fruits Online" <hoangdeptraibodoiqua4321@gmail.com>', // sender address
    to: email, // list of receivers
    subject: "Get the latest updates", // Subject line
    html: `<p>Dear User,</p>
    <p>You have subscribed to our mailing list.</p>
    <p>You will receive the latest updates from us.</p>
    <p>Thank you for using our service.</p>
    <p>Regards,</p>
    <p>Fruitkha Team</p>`, // html body
  });
};

module.exports = {
  sendEmail: sendEmail,
  sendEmailToResetPassword: sendEmailToResetPassword,
  sendMailToSubscribe: sendMailToSubscribe,
};
