import { AddMatch as AddMatchCore } from '../Core/match.js';

async function Add(req, res) {
    try {
        const data = await AddMatchCore(req);
        res.json(data);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}
  

export const AddMatch = Add;