List<String> dbTables = [
  // USERS
  '''
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE,
    password TEXT,
    headquarterId INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (headquarterId) REFERENCES headquarters(id)
  )
  ''',

  // HEADQUARTERS
  '''
  CREATE TABLE IF NOT EXISTS headquarters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT,
    city TEXT,
    phone TEXT,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // SOGI
  '''
  CREATE TABLE IF NOT EXISTS sogi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // BELTS
  '''
  CREATE TABLE IF NOT EXISTS belts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // SOGI_BELTS
  '''
  CREATE TABLE IF NOT EXISTS sogi_belts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sogiId INTEGER,
    beltsId INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (sogiId) REFERENCES sogi(id),
    FOREIGN KEY (beltsId) REFERENCES belts(id)
  )
  ''',

  // STUDENTS
  '''
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    names TEXT,
    surnames TEXT,
    type_identify TEXT,
    number_id TEXT,
    age INTEGER,
    gender TEXT,
    weight REAL,
    size REAL,
    headquarterId INTEGER,
    beltId INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (headquarterId) REFERENCES headquarters(id),
    FOREIGN KEY (beltId) REFERENCES belts(id)
  )
  ''',

  // TOURNAMENT
  '''
  CREATE TABLE IF NOT EXISTS tournament (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    location TEXT,
    date_start TEXT,
    date_end TEXT,
    status TEXT,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // JUDGE
  '''
  CREATE TABLE IF NOT EXISTS judge (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    names TEXT,
    surnames TEXT,
    numberId TEXT,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // TOURNAMENT_JUDGE
  '''
  CREATE TABLE IF NOT EXISTS tournament_judge (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tournamentId INTEGER,
    judgeId INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (tournamentId) REFERENCES tournament(id),
    FOREIGN KEY (judgeId) REFERENCES judge(id)
  )
  ''',

  // GRUB
  '''
  CREATE TABLE IF NOT EXISTS grub (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // INSCRIPTION
  '''
  CREATE TABLE IF NOT EXISTS inscription (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_start TEXT,
    studentId INTEGER,
    tournamentId INTEGER,
    grubId INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (studentId) REFERENCES students(id),
    FOREIGN KEY (tournamentId) REFERENCES tournament(id),
    FOREIGN KEY (grubId) REFERENCES grub(id)
  )
  ''',

  // VERSUS
  '''
  CREATE TABLE IF NOT EXISTS versus (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    inscription1 INTEGER,
    inscription2 INTEGER,
    grubId INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (studentId1) REFERENCES inscription(studentId),
    FOREIGN KEY (studentId2) REFERENCES inscription(studentId),
    FOREIGN KEY (grubId) REFERENCES grub(id)
  )
  ''',

  // SCORE
  '''
  CREATE TABLE IF NOT EXISTS score (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    score_1 REAL,
    score_2 REAL,
    judge_id INTEGER,
    versus_id INTEGER,
    sogi_1 INTEGER,
    sogi_2 INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (judge_id) REFERENCES judge(id),
    FOREIGN KEY (versus_id) REFERENCES versus(id),
    FOREIGN KEY (sogi_1) REFERENCES sogi(id),
    FOREIGN KEY (sogi_2) REFERENCES sogi(id)
  )
  ''',

  // WINNER
  '''
  CREATE TABLE IF NOT EXISTS winner (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    inscriptionId INTEGER,
    scoreId INTEGER,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    updatedAt TEXT DEFAULT CURRENT_TIMESTAMP,
    synchronized INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (inscriptionId) REFERENCES inscription(id),
    FOREIGN KEY (scoreId) REFERENCES score(id)
  )
  ''',
];
