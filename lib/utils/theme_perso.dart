import 'package:flutter/material.dart';

// Système de configuration visuelle centralisée pour l'application
// Architecture statique abstraite dédiée à la définition des paramètres d'apparence
abstract class ThemePerso {
  // Configuration esthétique optimisée pour les environnements lumineux
  static final ThemeData modeClair = ThemeData(
    // Définition du système chromatique basé sur une couleur génératrice
    colorScheme: ColorScheme.fromSeed(
      // Teinte fondamentale déterminant la palette dérivée
      seedColor: Colors.white,
      // Couleur principale pour les éléments interactifs et d'accentuation
      primary: Colors.lightGreen,
      // Couleur secondaire complémentaire à l'identité visuelle
      secondary: Colors.orange,
      // Couleur tertiaire pour les indicateurs et décorations spécifiques
      tertiary: Colors.green,
      // Palette standardisée pour la signalisation des états d'erreur
      error: Colors.red,
    ),

    // Activation des composants et principes de Material Design version 3
    useMaterial3: true,

    // Personnalisation spécifique de la barre d'application supérieure
    appBarTheme: const AppBarTheme(
      // Couleur d'arrière-plan distinctive pour l'élément d'en-tête
      backgroundColor: Colors.purple,
      // Couleur des éléments textuels et iconographiques de premier plan
      foregroundColor: Colors.white,
      // Alignement centralisé pour une présentation visuellement équilibrée
      centerTitle: true,
    ),

    // Système typographique complet avec hiérarchie visuelle structurée
    textTheme: const TextTheme(
      // Style dédié aux titres principaux des sections majeures
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),

      // Formatage pour les titres de niveau intermédiaire
      titleMedium: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      // Configuration pour les titres de niveau tertiaire
      titleSmall: TextStyle(
        color: Colors.black54,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      // Style pour les en-têtes significatifs de contenu
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),

      // Format des en-têtes de niveau intermédiaire
      headlineMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),

      // Configuration pour les en-têtes mineurs
      headlineSmall: TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),

      // Style pour les contenus textuels étendus et paragraphes
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),

      // Format standard pour le corps de texte principal
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),

      // Configuration pour les textes secondaires et annotations
      bodySmall: TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  // Configuration alternative spécialisée pour les contextes d'affichage nocturne
  static final ThemeData modeSombre = ThemeData(
    // Système chromatique adapté aux environnements faiblement éclairés
    colorScheme: ColorScheme.fromSeed(
      // Teinte fondamentale pour la génération de la palette sombre
      seedColor: Colors.black,
      // Couleur principale préservant la cohérence thématique
      primary: Colors.purple,
      // Couleur secondaire maintenue pour l'unité visuelle
      secondary: Colors.orange,
      // Couleur tertiaire conservant sa fonction indicatrice
      tertiary: Colors.green,
      // Palette d'erreur standardisée commune aux deux modes
      error: Colors.red,
    ),

    // Intégration complète des normes Material Design 3
    useMaterial3: true,

    // Personnalisation spécifique de l'en-tête en contexte sombre
    appBarTheme: const AppBarTheme(
      // Couleur d'arrière-plan adaptée au contraste inversé
      backgroundColor: Colors.pink,
      // Éléments de premier plan assurant la lisibilité
      foregroundColor: Colors.white,
      // Conservation de l'alignement central pour l'homogénéité
      centerTitle: true,
    ),

    // Hiérarchie typographique optimisée pour la lecture en mode sombre
    textTheme: const TextTheme(
      // Style des titres principaux avec contraste inversé
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),

      // Formatage des titres intermédiaires en contexte sombre
      titleMedium: TextStyle(
        color: Colors.white70,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      // Configuration des titres mineurs avec transparence contrôlée
      titleSmall: TextStyle(
        color: Colors.white54,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      // Style des en-têtes significatifs avec palette adaptée
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),

      // Format des en-têtes intermédiaires en mode sombre
      headlineMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),

      // Configuration des en-têtes mineurs avec gradation de luminosité
      headlineSmall: TextStyle(
        color: Colors.white54,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),

      // Style pour les contenus textuels étendus en arrière-plan sombre
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),

      // Format standard du corps de texte en contraste inversé
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),

      // Configuration des textes secondaires avec transparence adaptée
      bodySmall: TextStyle(
        color: Colors.white54,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
