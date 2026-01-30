List<String> dbTables = [
  // USERS
  '''
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT,
    password TEXT,
    headquarters_id INTEGER,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (headquarters_id) REFERENCES headquarters(id)
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
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // SOGI
  '''
  CREATE TABLE IF NOT EXISTS sogi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // BELTS
  '''
  CREATE TABLE IF NOT EXISTS belts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // SOGI_BELTS
  '''
  CREATE TABLE IF NOT EXISTS sogi_belts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sogi_id INTEGER,
    belts_id INTEGER,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (sogi_id) REFERENCES sogi(id),
    FOREIGN KEY (belts_id) REFERENCES belts(id)
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
    genere TEXT,
    weight REAL,
    size REAL,
    headquarters_id INTEGER,
    belts_id INTEGER,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (headquarters_id) REFERENCES headquarters(id),
    FOREIGN KEY (belts_id) REFERENCES belts(id)
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
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // JUDGE
  '''
  CREATE TABLE IF NOT EXISTS judge (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    names TEXT,
    surnames TEXT,
    number_id TEXT,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // TOURNAMENT_JUDGE
  '''
  CREATE TABLE IF NOT EXISTS tournament_judge (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tournament_id INTEGER,
    judge_id INTEGER,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (tournament_id) REFERENCES tournament(id),
    FOREIGN KEY (judge_id) REFERENCES judge(id)
  )
  ''',

  // GRUB
  '''
  CREATE TABLE IF NOT EXISTS grub (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1
  )
  ''',

  // INSCRIPTION
  '''
  CREATE TABLE IF NOT EXISTS inscription (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_start TEXT,
    students_id INTEGER,
    tournaments_id INTEGER,
    grub_id INTEGER,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (students_id) REFERENCES students(id),
    FOREIGN KEY (tournaments_id) REFERENCES tournament(id),
    FOREIGN KEY (grub_id) REFERENCES grub(id)
  )
  ''',

  // VERSUS
  '''
  CREATE TABLE IF NOT EXISTS versus (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    inscription_id_1 INTEGER,
    inscription_id_2 INTEGER,
    grub_id INTEGER,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (inscription_id_1) REFERENCES inscription(id),
    FOREIGN KEY (inscription_id_2) REFERENCES inscription(id),
    FOREIGN KEY (grub_id) REFERENCES grub(id)
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
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
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
    inscription_id INTEGER,
    score_id INTEGER,
    last_date TEXT DEFAULT CURRENT_TIMESTAMP,
    sync_status INTEGER DEFAULT 0,
    is_active INTEGER DEFAULT 1,
    FOREIGN KEY (inscription_id) REFERENCES inscription(id),
    FOREIGN KEY (score_id) REFERENCES score(id)
  )
  ''',
];
