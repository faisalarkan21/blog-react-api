import express from 'express';

import * as db from '../lib/db';
import { currentDate } from '../lib/date';

const router = express.Router();

router.get('/', async (req, res) => {
  const getStatus = await db.testConnect();
  console.log(getStatus);
  res.send({ message: 'Hey i\'m faisal arkan, if you see this, everything works fine. ᕦ(ò_óˇ)ᕤ', database: getStatus });
});


export default router;

