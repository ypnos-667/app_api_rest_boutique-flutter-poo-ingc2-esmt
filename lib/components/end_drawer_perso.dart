import 'package:flutter/material.dart';

// Composant de navigation latérale personnalisé avec architecture extensible
// L'état interne permet des évolutions dynamiques futures
class EndDrawerPerso extends StatefulWidget {
  const EndDrawerPerso({super.key});

  @override
  State<EndDrawerPerso> createState() => _EndDrawerPersoState();
}

class _EndDrawerPersoState extends State<EndDrawerPerso> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Conteneur avec défilement pour s'adapter aux nombreuses options
      child: ListView(
        children: [
          // Section d'en-tête avec hauteur fixe pour une présence visuelle marquée
          SizedBox(
            height: 120,
            child: DrawerHeader(
              // Couleur d'arrière-plan harmonisée avec le thème applicatif
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              // Titre identifiant la fonctionnalité du panneau
              child: const Text(
                "Navigation Principale",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Première option menant à l'interface d'accueil
          ListTile(
            // Représentation visuelle symbolique de la destination
            leading: const Icon(Icons.home),
            // Application de la couleur tertiaire définie dans le thème
            tileColor: Theme.of(context).colorScheme.tertiary,
            // Libellé descriptif de la fonctionnalité
            title: const Text("Tableau de bord"),
            // Action déclenchée au contact : navigation avec nettoyage complet
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-accueil",
                (route) => false, // Élimination totale de l'historique
              );
            },
          ),

          // Séparateur visuel améliorant la lisibilité des sections
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),

          // Option permettant d'accéder à l'outil de comptage
          ListTile(
            leading: const Icon(Icons.countertops),
            tileColor: Theme.of(context).colorScheme.tertiary,
            title: const Text("Module Compteur"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-compteur",
                (route) => false,
              );
            },
          ),

          // Second séparateur structurel
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),

          // Interface d'affichage et modification des données personnelles
          ListTile(
            leading: const Icon(Icons.person),
            tileColor: Theme.of(context).colorScheme.tertiary,
            title: const Text("Gestion du Profil"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-details-profil",
                (route) => false,
              );
            },
          ),

          // Troisième séparateur visuel
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),

          // Accès au système de catalogue et transactions
          ListTile(
            leading: const Icon(Icons.shop),
            tileColor: Theme.of(context).colorScheme.tertiary,
            title: const Text("Catalogue Produits"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/page-boutique",
                (route) => false,
              );
            },
          ),

          // Séparateur final pour délimiter la fin des options
          Divider(color: Theme.of(context).colorScheme.tertiary, thickness: 2),
        ],
      ),
    );
  }
}
