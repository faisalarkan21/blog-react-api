import express from 'express';
import * as db from '../lib/db';
import * as auth from '../lib/auth';
import * as helper from '../lib/helper';

const router = express.Router();


router.get('/', async (req, res) => {
  const { rows } = await db.query(`
  SELECT users.user_id, username, password, email, 
  created_on, last_login, account_role.role_id, account_role.grant_date
  FROM public.users inner join public.account_role 
  on public.users.user_id = public.account_role.user_id;`);

  const result = helper.reformatObjectRows(rows);

  res.send(result);
});

router.post('/login', async (req, res) => {
  const { password, email } = req.body;
  const { rows } = await db.query('select * from users where email = $1', [email]);
  if (rows[0]) {
    if (rows[0].password === auth.getHash(password)) {
      const token = auth.getToken();
      console.log(token);
      res.status(200).send(Object.assign({ token }, { rows }));
    }
  }
  return res.send(404).send(rows[0]);
});

router.get('/:id', async (req, res) => {
  const { id } = req.params;
  // console.log(id);
  const { rows } = await db.query(`
  SELECT users.user_id, username, password, email, 
  created_on, last_login, account_role.role_id, account_role.grant_date
  FROM public.users inner join public.account_role 
  on users.user_id = account_role.user_id where users.user_id = $1`, [id]);

  console.log(rows);

  const result = helper.reformatObjectRows(rows);

  res.send(result[0]);
});

router.post('/create-user', async (req, res) => {
  const {
    username, email, password, roleId
  } = req.body;

  const resultHash = await auth.getHash(password);


  const result = await db.insertRows(
    'users(username, email, password, created_on)',
    'values($1, $2, $3, $4)  RETURNING user_id', [username, email, resultHash, currentDate], res
  );

  await db.insertRows(
    'account_role(user_id,role_id,grant_date)',
    'values($1, $2, $3)', [result[0].user_id, roleId, currentDate], res
  );

  await result.client.query('COMMIT');
  return res.sendStatus(200);
});


export default router;

