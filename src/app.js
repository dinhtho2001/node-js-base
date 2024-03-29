import express, { json, urlencoded } from 'express';
import morgan from 'morgan';
import swaggerUi from 'swagger-ui-express';
//import swaggerSpec from './config/swagger.config.js';
//import swaggerDocument from '../swagger.json' assert { type: "json" };
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

sequelize.sync({ alter: true })
	.then(() => {
		console.log('Tables created!');
 	})
	.catch((err) => {
		console.log('Table creation failed:', err);
	});

app.use(json());
app.use(urlencoded({
	extended: false
}));

//app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
app.use('/api', router);

// middleware
app.use(morgan('dev'));

// app.use(
// 	'/api-docs',
// 	swaggerUi.serve,
// 	swaggerUi.setup(swaggerDocument)
// );

app.listen(process.env.PORT || port, function () {
	console.log("A Node Js API is listening at address http://localhost:%s", port)
});
