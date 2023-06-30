import { Router } from 'express';
import { AddMatch } from '../Services/matchService.js';
let router = Router();

router.post('/add', AddMatch);

export default router;