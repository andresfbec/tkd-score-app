const Set<String> fieldsHeadquarters = {
  'id',
  'name',
  'address',
  'city',
  'phone',
};

const Set<String> fieldsUsers = {
  'id',
  'username',
  'headquartersId'
};

const Set<String> fieldsTournaments = {
  'id',
  'name',
  'location',
  'date_start',
  'date_end',
  'status',
};

const Set<String> fieldsJudge = {
  'id',
  'names',
  'surnames',
  'numberId',
};

//  '''
//   CREATE TABLE IF NOT EXISTS judge (
//     id INTEGER PRIMARY KEY AUTOINCREMENT,
//     names TEXT,
//     surnames TEXT,
//     numberId TEXT,
//     createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
//     updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
//     synchronized INTEGER DEFAULT 0,
//     is_active INTEGER DEFAULT 1
//   )
//   ''',