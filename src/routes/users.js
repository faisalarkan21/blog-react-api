import express from 'express';
import * as db from '../lib/db';
import { currentDate } from '../lib/date';

const router = express.Router();


router.get('/', async (req, res) => {
  const { rows } = await db.query('SELECT * FROM users');
  res.send(rows);
});

router.get('/:id', async (req, res) => {
  const { id } = req.params;
  const { rows } = await db.query('select * from users where user_id = $1', [id]);
  res.send(rows);
});

router.post('/create-user', async (req, res) => {
  const {
    username, email, password, roleId
  } = req.body;

  const result = await db.insertRows(
    'users(username, email, password, created_on)',
    'values($1, $2, $3, $4)  RETURNING user_id', [username, email, password, currentDate], res
  );

  console.log(result);

  await db.insertRows(
    'account_role(user_id,role_id,grant_date)',
    'values($1, $2, $3)', [result[0].user_id, roleId, currentDate], res
  );

  await result.client.query('COMMIT');
  return res.sendStatus(200);
});


export default router;

