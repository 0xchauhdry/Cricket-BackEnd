import { Router } from 'express';
import matchController from '../Controllers/matchController.js';
const app = Router();

app.use('/match', matchController);

export default app;
