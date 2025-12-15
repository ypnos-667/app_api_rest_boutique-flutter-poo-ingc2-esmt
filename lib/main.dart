import 'package:app_api_reste_boutique/pages/page_accueil.dart';
import 'package:app_api_reste_boutique/utils/app_constantes.dart';
import 'package:app_api_reste_boutique/utils/routeur.dart';
import 'package:app_api_reste_boutique/utils/theme_perso.dart';
import 'package:flutter/material.dart';

// Point d'entrée principal exécutant le framework Flutter
void main() {
  // Lancement de l'application avec le widget racine comme point de départ
  runApp(const MonAppli());
}

// Widget racine définissant la structure fondamentale de l'application
// Nature Stateless car sa configuration demeure invariable durant l'exécution
class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  // Méthode de construction de l'arborescence d'interface utilisateur
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Identifiant textuel utilisé par le système pour les notifications
      title: AppConstants.appName,

      // Suppression de l'étiquette de débogage dans les versions de développement
      debugShowCheckedModeBanner: false,

      // Configuration du comportement d'adaptation chromatique automatique
      // L'application s'aligne dynamiquement sur les préférences système
      themeMode: ThemeMode.system,

      // Définition du schéma visuel pour les environnements lumineux
      theme: ThemePerso.modeClair,

      // Configuration alternative pour les contextes d'affichage nocturne
      darkTheme: ThemePerso.modeSombre,

      // Détermination du point d'entrée visuel au démarrage de l'application
      initialRoute: Routeur.routeInitiale,

      // Stratégie de gestion des requêtes de navigation non déclarées
      // Évite les interruptions brutales de l'expérience utilisateur
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          // Redirection systématique vers l'interface d'accueil principale
          builder: (context) => const PageAccueil(),
        );
      },

      // Intégration du système de navigation centralisé prédéfini
      routes: Routeur.routes,

      // Configuration optionnelle de la localisation pour l'internationalisation
      // locale: const Locale('fr', 'SN'), // Exemple pour le français du Sénégal

      // Désactivation des animations de transition par défaut (optionnel)
      // theme: ThemeData(platform: TargetPlatform.android),
    );
  }
}
