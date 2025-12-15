// Classe de regroupement des valeurs immuables utilisées à travers l'application
// La nature abstraite empêche toute instanciation, préservant son rôle utilitaire
abstract class AppConstants {
  // Identifiant textuel principal présent dans l'en-tête et les métadonnées système
  static const String appName = 'INGC ESMT - Plateforme Éducative';

  // Numéro de version suivant la convention semver (major.minor.patch)
  static const String versionAppli = "1.0.0";

  // Constante numérique définissant le délai maximal des requêtes réseau (millisecondes)
  static const int timeoutReseau = 30000;

  // URL de base pour les appels API vers les services externes
  static const String baseUrlApi = "https://api.ingc-esmt.sn/v1";

  // Nombre maximal d'éléments affichés dans les listes paginées
  static const int paginationLimite = 20;

  // Identifiant unique du fournisseur pour les services de géolocalisation
  static const String fournisseurCarte = "google_maps";

  // Format standardisé pour l'affichage des dates dans l'interface
  static const String formatDateAffichage = "dd/MM/yyyy HH:mm";

  // Version minimale du SDK requise pour le fonctionnement optimal
  static const double sdkMinimumVersion = 2.18;
}
