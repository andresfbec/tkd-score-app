// constantes relacionadas a la base de datos
class DatabaseConstants {
  // Name
  static const String databaseName = 'tkd_.db';

  // Version of database incrementation in every change of the structure
  static const int databaseVersion = 1;

  // Configuration of backups (if needed in the future)
  static const int maBackupFiles = 10;
  static const String backupPrefiz = 'backup_';
  static const String backupExtension = '.db';
}
