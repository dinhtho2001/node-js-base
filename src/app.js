import express, { json, urlencoded } from 'express';
import morgan from 'morgan';
import cors from "cors";
import router from './routes/index.js';
import { sequelize } from './db/index.js';

const app = express();
const port = 8000;

app.use(cors());

sequelize.authenticate()
	.then(() => {
		console.log('Connection has been established successfully.');
	})
	.catch(err => {
		console.error('Unable to connect to the database:', err);
	});


app.use(json());
app.use(urlencoded({
	extended: false
}));

app.use('/api', router);

// middleware
app.use(morgan('dev'));

app.listen(process.env.PORT || port, function () {
	console.log("A Node Js API is listening at address http://localhost:%s", port)
});
