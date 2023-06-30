import express, { json } from 'express';
import router from './Router/index.js';
import bodyparser from 'body-parser';
import cors from 'cors';
import { config } from 'dotenv';

config();
const app = express();
const { urlencoded, json : _json } = bodyparser;

app.use(urlencoded({ extended:  true, limit: '50mb' }));
app.use(_json({limit: '50mb'}));
app.use(cors());
app.use(json());
app.use(router);

app.listen(process.env.PORT, () => {
    console.log(`listening to port: ${process.env.PORT}`);
})