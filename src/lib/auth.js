import jwt from 'jsonwebtoken';
import Crypto from 'crypto-js';

const getToken = () => jwt.sign({ coba: 'yeahcoba' }, 'rahasia', { expiresIn: '1h' });

/*
@ Written by Faisal Arkan

Author Note :
https://code.google.com/archive/p/crypto-js/

I made a mistake when I named this implementation SHA-3.
It should be named Keccak[c=2d]. Each of the SHA-3 functions is based on an instance of the Keccak algorithm,
which NIST selected as the winner of the SHA-3 competition,
but those SHA-3 functions won't produce hashes identical to Keccak.
*/

const getHash = password => Crypto.SHA3(password, { outputLength: 512 }).toString();

export { getToken, getHash };

