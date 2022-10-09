const { select } = require("@nodejscart/mysql-query-builder");
const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const md5 = require("md5");
const jwt = require("jsonwebtoken");
const now = Date.now();
// import * as dotenv from 'dotenv';
// dotenv.config()

require("dotenv").config();
// console.log(process.env)

const app = express();
const PORT = process.env.APP_PORT;
// parse application/json
app.use(bodyParser.json());

const config = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
};
//create database connection
const conn = mysql.createConnection(config);
// console.log(config);

//connect to database
conn.connect((err) => {
  // if(err) throw err;
  if (err) {
    return console.error("error: " + err.message);
  }
  console.log("Mysql Connected...");
});

// router

app.get("/", (req, res) => {
  res.setHeader("content-type", "application/json");
  res.send(
    JSON.stringify({
      status: 200,
      error: null,
      message: "user services is available",
    })
  );
});

app.get("/mahasiswa/:userId", async (req, res) => {
  const userId = req.params.userId;
  let sql =
    "SELECT * FROM users u inner join mahasiswa m on m.user_id=u.user_id WHERE u.user_id='" +
    userId +
    "'";
  conn.query(sql, (err, results) => {
    if (err) throw err;
    if (results.length <= 0) {
      data = { status: 200, error: "Tidak ada data ditemukan", response: [] };
      returnApi(res, data);
    } else {
      data = { status: 200, error: null, response: results[0] };
      returnApi(res, data);
    }
  });
});

app.get("/dosen/:userId", async (req, res) => {
  const userId = req.params.userId;
  let sql =
    "SELECT * FROM users u inner join dosen m on m.user_id=u.user_id WHERE u.user_id='" +
    userId +
    "'";
  conn.query(sql, (err, results) => {
    if (err) throw err;
    if (results.length <= 0) {
      data = { status: 200, error: "Tidak ada data ditemukan", response: [] };
      returnApi(res, data);
    } else {
      data = { status: 200, error: null, response: results[0] };
      returnApi(res, data);
    }
  });
});

// functions
function returnApi(res, data) {
  res.setHeader("content-type", "application/json");
  res.send(JSON.stringify(data));
}

function verify(token) {
  const payload = jwt.verify(token, process.env.JWT_SECRET_KEY);
  if (payload.exp - now > 0) {
    return {
      status: true,
      msg: "Tuken sudah sesuai",
      data: payload,
    };
  } else {
    return {
      status: false,
      msg: "token sudah tidak berlaku.",
      data: [],
    };
  }
}

function createJwt(userId) {
  let jwtSecretKey = process.env.JWT_SECRET_KEY;
  let data = {
    iat: now,
    exp: now + 1000 * 60 * 60 * 24, // satu hari (24 jam)
    // exp:now, // satu hari (24 jam)
    userId,
  };
  const token = jwt.sign(data, jwtSecretKey);
  return token;
}

//Server listening
app.listen(PORT, () => {
  console.log("Server started on port " + PORT + "...");
});
