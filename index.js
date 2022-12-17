const {select} = require("@nodejscart/mysql-query-builder");
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

app.get("/user/:userId", async (req, res) => {
  let userData = {};
  const userId = req.params.userId;
  let sql =
    "SELECT * FROM users WHERE user_id='" +
    userId +
    "'";
  conn.query(sql, (err, results) => {
    if (err) throw err;
    if (results.length <= 0) {
      data = {status: 200, error: "Tidak ada data ditemukan", response: []};
      returnApi(res, data);
    } else {
      switch (String(results[0].user_type)) {
        case "1":
          let sql1 =
            "SELECT * FROM users u inner join mahasiswa m on m.user_id=u.user_id WHERE u.user_id='" +
            userId +
            "'";
          conn.query(sql1, (err, results) => {
            if (err) throw err;
            if (results.length <= 0) {
              data = {status: 200, error: "Tidak ada data ditemukan", response: []};
              returnApi(res, data);
            } else {
              data = {status: 200, error: null, response: results[0]};
              returnApi(res, data);
            }
          });
          break;

        case "2":
          let sql2 =
            "SELECT * FROM users u inner join dosen m on m.user_id=u.user_id WHERE u.user_id='" +
            userId +
            "'";
          conn.query(sql2, (err, results) => {
            if (err) throw err;
            if (results.length <= 0) {
              data = {status: 200, error: "Tidak ada data ditemukan", response: []};
              returnApi(res, data);
            } else {
              data = {status: 200, error: null, response: results[0]};
              returnApi(res, data);
            }
          });
          break;

        default:
          data = {status: 200, error: "Tidak ada data ditemukan", response: []};
          returnApi(res, data);
          break;
      }
    }
  });
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
      data = {status: 200, error: "Tidak ada data ditemukan", response: []};
      returnApi(res, data);
    } else {
      data = {status: 200, error: null, response: results[0]};
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
      data = {status: 200, error: "Tidak ada data ditemukan", response: []};
      returnApi(res, data);
    } else {
      data = {status: 200, error: null, response: results[0]};
      returnApi(res, data);
    }
  });
});

// GET Mahasiswa
app.get("/mahasiswa", async (req, res) => {

  let where = "";
  let query = req.query;

  const keys = Object.keys(query);
  for (let i of keys) {
    const r = query[i];
    where = where + " AND " + i + " like '%" + r + "%'";
  }

  if (query.lenght == 0) {
    sql =
      "SELECT * FROM mahasiswa";
  } else {
    sql =
      "SELECT * FROM mahasiswa where 1" + where;
  }
  conn.query(sql, (err, results) => {
    if (err) throw err;
    if (results.length <= 0) {
      data = {status: 404, error: "Tidak ada data ditemukan", response: []};
      returnApi(res, 404, data);
    } else {
      data = {status: 200, error: null, response: results};
      returnApi(res, 200, data);
    }
  });
});

// functions
function returnApi(res, statusCode, data) {
  res.setHeader("content-type", "application/json");
  res.status(statusCode);
  res.send(JSON.stringify(data));
}

//Server listening
app.listen(PORT, () => {
  console.log("Server started on port " + PORT + "...");
});
