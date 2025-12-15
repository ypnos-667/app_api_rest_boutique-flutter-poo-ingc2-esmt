import 'package:app_api_reste_boutique/pages/compteur_page.dart';
import 'package:app_api_reste_boutique/pages/page_accueil.dart';
import 'package:flutter/material.dart';

// Système de gestion centralisée des chemins de navigation applicatifs
// Architecture abstraite garantissant une utilisation exclusivement statique
abstract class Routeur {
  // Définition du point d'entrée principal présenté au lancement de l'application
  // Les tirets sont effectivement supportés dans la syntaxe des identifiants de route
  static const String routeInitiale = "/page-compteur";

  // Déclaration exhaustive des associations entre identifiants de navigation
  // et leurs constructeurs d'interface correspondants
  static final Map<String, WidgetBuilder> routes = {
    // Association de l'identifiant "/page-compteur" avec le widget interactif de comptage
    "/page-compteur": (context) => const PageCompteur(),

    // Association de l'identifiant "/page-accueil" avec l'interface principale de données
    "/page-accueil": (context) => const PageAccueil(),

    // Exemple d'extension future - route pour l'interface de profil utilisateur
    // "/page-profil": (context) => const PageProfil(),

    // Exemple d'extension future - route pour les paramètres de configuration
    // "/page-parametres": (context) => const PageParametres(),
  };

  // Méthode utilitaire pour la validation de l'existence d'une route déclarée
  static bool routeExiste(String identifiantRoute) {
    return routes.containsKey(identifiantRoute);
  }

  // Méthode pour obtenir le constructeur d'une route avec gestion d'erreur
  static WidgetBuilder? obtenirConstructeurRoute(String identifiantRoute) {
    return routes[identifiantRoute];
  }

  // Constante définissant le comportement par défaut pour les routes inconnues
  static const String routeSecours = "/page-accueil";
}
