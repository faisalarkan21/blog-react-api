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
  console.log(rows);
  if (rows[0]) {
    if (rows[0].password === auth.getHash(password)) {
      const token = auth.getToken();
      console.log(token);
      return res.send(Object.assign({ token }, { rows }));
    }
  }
  return res.status(404).send([]);
});

router.get('/:id', async (req, res) => {
  const { id } = req.params;

  const { rowCount, rows } = await db.query(`
  SELECT users.user_id, username, password, email, 
  created_on, last_login, account_role.role_id, account_role.grant_date
  FROM public.users inner join public.account_role 
  on users.user_id = account_role.user_id where users.user_id = $1`, [id]);

  if (rowCount !== 0) {
    res.send(rows[0]);
  }

  res.sendStatus(404);
});


router.post('/create-user', async (req, res) => {
  const {
    name, email, password
  } = req.body;

  const resultHash = await auth.getHash(password);
  console.log(password);


  const result = await db.insertRows(
    'users(username, email, password, created_on)',
    'values($1, $2, $3, $4)  RETURNING user_id',
    [name, email, resultHash, new Date()], res
  );

  /**
   * @constant role_id always 2 that means not administrator
   */

  await db.insertRows(
    'account_role(user_id,role_id,grant_date)',
    'values($1, $2, $3)', [result[0].user_id, 2, new Date()], res
  );

  await result.client.query('COMMIT');
  return res.sendStatus(200);
});


router.post('/update/:id', async (req, res) => {
  const { id } = req.params;

  const {
    username, email, role_id
  } = req.body;

  const roleCode = role_id === 'Administrator' ? 1 : 2;

  const result = await db.updateRows(`users SET username=($1), 
                email=($2) WHERE user_id = ($3)`, [username, email, id]);

  db.updateRows(`account_role
                SET role_id=($1) WHERE user_id = ($2)`, [roleCode, id]);

  await result.client.query('COMMIT');
  return res.sendStatus(200);
});

router.post('/delete/:id', async (req, res) => {
  const { id } = req.params;

  const { rowCount } = await db.query('DELETE FROM users WHERE user_id=($1)', [id]);

  if (rowCount !== 0) {
    return res.sendStatus(200);
  }
  return res.sendStatus(404);
});


export default router;

