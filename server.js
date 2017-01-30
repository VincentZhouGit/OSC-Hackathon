var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); 
app.set('view engine', 'ejs');

app.get('/', (req, res) => {
    res.render("index");
});

app.get('/dashboardHome', (req, res) => {
    res.render("dashboardHome");
});

app.get('/dashboardApproved', (req, res) => {
    res.render("dashboardApproved");
});




app.get('/registry', (req, res) => {
    res.render("registry");
});

app.get('/analytics_page1', (req, res) => {
    res.render("analyticsPage1");
});

app.get('/analytics_page2', (req, res) => {
    res.render("analyticsPage2");
});

app.get('/analytics_page3', (req, res) => {
    res.render("analyticsPage3");
});

app.get('/analytics_page4', (req, res) => {
    res.render("analyticsPage4");
});


app.post('/file-upload', (req, res) => {
    console.log("reach here");
    console.log(req.body);
//     var body = req.body;
// console.log("Name: " + body.name + ", Company: " + body.company + ", Email: " + body.email + ", Address: " + body.address + ", City: " + body.city + ", Country: " + body.country);
// res.render("index");
});

app.get('/POC', (req, res) => {
    res.render("POC");
});




app.use(express.static('public'));

var server = app.listen(8080, () => {
  var host = server.address().address;
  var port = server.address().port;
  console.log("Listening at http://%s:%s", host, port);
});

var io = require('./server-sockets').listen(server);
