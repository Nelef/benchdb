const express = require('express');
const mariadb = require('mariadb/callback');
const app = express();

app.listen('8080', () => {
	console.log('Server Started');
});

var dbc = mariadb.createConnection({
    host: "localhost",
    database: "benchdb",
    user: "root",
    password: "root"
});

dbc.connect((err) => {
	if (err) throw err;
	console.log('Database Connected');
});

app.get('/select', (req, res) => {
	// NOTE: template literal 사용시 backticks ` (grave accents) 사용. (따옴표 아님 주의)
	//       키보드 esc 아래, ~ (Shift 안 누르고 입력), 1 왼쪽
	// 예제 http://localhost:8080/select?id=1
	var query = `SELECT * FROM cpu WHERE id=${req.query.id}`;
	//console.log(query);
	dbc.query(query, (err, result, fields)=> {
		if (err) return;
		res.send(result);
	});
});

app.get('/', (req, res) => {
	var query = `SELECT * FROM cpu`;
	//console.log(query);
	dbc.query(query, (err, result, fields)=> {
		if (err) return console.log(err);
		res.send(result);
	});
});

app.get('/cpu', (req, res) => {
	var query = `SELECT * FROM cpu`;
	//var query = `SELECT id, model, gen, single_bench, multi_bench FROM cpu`;
	//console.log(query);
	dbc.query(query, (err, result, fields)=> {
		if (err) return console.log(err);
		res.send(result);
	});
});

app.get('/gpu', (req, res) => {
	var query = `SELECT * FROM gpu`;
	//var query = `SELECT id, model, gen, bench FROM gpu`;
	//console.log(query);
	dbc.query(query, (err, result, fields)=> {
		if (err) return console.log(err);
		res.send(result);
	});
});

app.get('/apu', (req, res) => {
	var query = `SELECT * FROM apu;`;
	//var query = `SELECT id, model, gen, single_bench, multi_bench FROM apu`;
	//console.log(query);
	dbc.query(query, (err, result, fields)=> {
		if (err) return console.log(err);
		res.send(result);
	});
});

// app.get('/all', (req, res) => {
// 	var query = `SELECT * FROM cpu`;

// 	dbc.query(query, (err, result, fields)=> {
// 		if (err) return console.log(err);
// 		res.send(result);
// 	});
	
// 	var query = `SELECT * FROM cpu`;

// 	dbc.query(query, (err, result, fields)=> {
// 		if (err) return console.log(err);
// 		res.send(result);
// 	});
// });

app.get('/image_query', (req, res) => {
	var query = `SELECT image FROM cpu 	 id=${req.query.id}`;
	dbc.query(query, (err, result, fields)=> {
		if (err) throw err;

		if (result[0]) {
			//console.log(__dirname + "images/" + result[0].image);
			res.sendFile(__dirname + "/images/" + result[0].image);
		}
		else
			res.send(404, "Not Found");
	});
});

app.use('/image', express.static('benchdb/images'));

//---------------------------------------
app.use(express.urlencoded());
//app.use(express.json());

app.use('/chart', express.static('benchdb/chart.html'));

 