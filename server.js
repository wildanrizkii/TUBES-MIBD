import express from 'express'
import mysql from 'mysql'
import BodyParser from 'body-parser'
import cookieParser from 'cookie-parser'

import path from 'path'
const app = express();

app.use(BodyParser.urlencoded({ extended: true}))

app.set("view engine", "ejs")
app.set("views", "views")
app.use(express.static(path.resolve('public')));

const db = mysql.createConnection({
    host : "localhost",
    database : "db_mibd",
    user : "root",
    password : "",
})


app.get('/', function(req, res){
    res.render('Login')
})
app.get('/SignUp', function(req, res){
    res.render('SignUp')
})
app.get('/Login', function(req, res){
    res.render('Login')
})
app.post('/KelolaAkun', function(req, res){
    res.redirect('KelolaAkun')
})

// Tampilan Kelola Akun ADMIN
app.get('/KelolaAkun', function(req, res){
    
    const sql = "SELECT * FROM Pengguna"
    db.query(sql, (err, result) => {
        const users = JSON.parse(JSON.stringify(result))
        res.render("KelolaAkun", {users: users })
    })
})
app.get('/Validasi', function(req, res){
    res.render('Validasi')
})
app.get('/CekStatus', function(req, res){
    res.render('CekStatus')
})
app.get('/UbahStatus', function(req, res){
    res.render('UbahStatus')
})

// Kelola Akun ADMIN
app.post("/tambah", (req, res) => {
    console.log(req.params)
    const {username, password, nama, email, noHp, role, alamat} = req.body
    const insertSql = `INSERT INTO Pengguna (username, password, nama, email, noHp, role, alamat) VALUES ('${username}', '${password}', '${nama}', '${email}', '${noHp}', '${role}', '${alamat}');`
    db.query(insertSql, (err, result) => {
        if (err) throw err
        res.redirect("KelolaAkun")
    })
})

// SignUp User
app.post("/signup", (req, res) => {
    console.log(req.params)
    const {username, password, nama, email, noHp, alamat} = req.body
    const insertSql = `INSERT INTO Pengguna (username, password, nama, email, noHp, role, alamat) VALUES ('${username}', '${password}', '${nama}', '${email}', '${noHp}', 'user', '${alamat}');`
    db.query(insertSql, (err, result) => {
        if (err) throw err
        res.redirect("/")
    })
})

// Update Akun ADMIN

app.get('/update/:id', function(req, res){
    const {id} = req.params
    const editSql = `SELECT * FROM Pengguna WHERE id = ${id}`
    db.query(editSql, (err, result) => {
        if (err)
            throw err
        return
    })
})

app.post("/update/:id", (req, res) => {
    
    const {id} = req.params
    console.log(id)
    const {username, password, nama, email, noHp, role, alamat} = req.body
    
    const updateSql = `UPDATE Pengguna SET? WHERE id_pengguna = ${id}`
    db.query(updateSql, (err, result) => {
        if (err) throw err
        res.render("KelolaAkun")
    })
})
app.get('/ModelBaju', function(req, res){
    res.render('ModelBaju')
})

app.get('/deleteAkun/:id', async (req,res) => {
    
    const {id} = req.params
    console.log(id)
    const deleteSql = `DELETE FROM Pengguna WHERE id_pengguna = ${id}`
    db.query(deleteSql, (err, result) => {
        if (err)
            throw err
        return
    })
    res.redirect('/KelolaAkun')
})  

app.listen(8000);