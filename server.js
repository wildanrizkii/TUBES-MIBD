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

// Tampilan Validasi ADMIN
app.get('/Validasi', function(req, res){
    const sql = "SELECT * FROM pesanan"
    db.query(sql, (err, result) => {
        const validasi = JSON.parse(JSON.stringify(result))
        res.render("Validasi", {validasi: validasi })
    })
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
    const {username, password, nama, email, noHp, role, alamat, noRek} = req.body
    const insertSql = `INSERT INTO Pengguna (username, password, nama, email, noHp, role, alamat, noRek) VALUES ('${username}', '${password}', '${nama}', '${email}', '${noHp}', '${role}', '${alamat}', '${noRek}');`
    db.query(insertSql, (err, result) => {
        if (err) throw err
        res.redirect("KelolaAkun")
    })
})

// Validasi ADMIN



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

app.get('/edit/:id', async (req, res) => {
    const {id} = req.params
    db.query(`SELECT * FROM Pengguna WHERE id_pengguna = ${id}`, (err, res) => {
        res.render('KelolaAkun')
    });
});
app.post('/edit/:id', async (req, res) => {
    const {id} = req.params
    const {username, password, nama, email, noHp, role, alamat, noRek} = req.body
    console.log(req.body)
    db.query(`UPDATE Pengguna SET username = '${username}', password = '${password}', nama = '${nama}', email = '${email}', noHp = '${noHp}', role = '${role}', alamat = '${alamat}', noRek = '${noRek}' WHERE id_pengguna = ${id}`, (err, rs) => {
        if (!err)
            res.redirect('/KelolaAkun')
        else {
            console.log(err);
        }
    });
});

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