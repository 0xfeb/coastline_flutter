abstract class AppSetup {
  void setupAll() {
    setupPath();
    setupDatabase();
    setupWebInterface();
    setupFont();
    setupColors();
    setup3thLibs();
    setupAppConfigure();
  }

  void setupPath();
  void setupDatabase();
  void setupWebInterface();
  void setupFont();
  void setupColors();
  void setup3thLibs();
  void setupAppConfigure();
}
