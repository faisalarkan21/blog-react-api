
import { momentFormat } from '../lib/moment-config';

export const reformatObjectRows = (rows) => {
  rows.forEach((item) => {
    item.grant_date = momentFormat(item.grant_date, 'MMMM Do YYYY');
    item.created_on = momentFormat(item.created_on, 'MMMM Do YYYY');
    item.role_id = item.role_id === (1 || 'Administrator') ? 'Administrator' : 'Penulis';
  });
  return rows;
};

