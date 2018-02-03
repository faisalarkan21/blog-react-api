
import { momentFormat } from '../lib/moment-config';

export const reformatObjectRows = (rows) => {
  rows.forEach((item) => {
    item.grant_date = momentFormat(item.grant_date, 'dddd, MMMM YYYY');
    item.created_on = momentFormat(item.created_on, 'dddd, MMMM YYYY');
    item.last_login = momentFormat(item.last_login, 'dddd, MMM YYYY, h:mm:ss a');
    item.last_modified = momentFormat(item.last_modified, 'dddd, MMM YYYY, h:mm:ss a');
    item.role_id = item.role_id === (1 || 'Administrator') ? 'Administrator' : 'Penulis';
  });
  return rows;
};

