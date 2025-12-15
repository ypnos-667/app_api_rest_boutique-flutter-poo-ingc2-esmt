import 'package:app_api_reste_boutique/components/end_drawer_perso.dart';
import 'package:flutter/material.dart';

// Interface interactive dédiée à la manipulation d'un compteur numérique
// L'état interne nécessite l'utilisation d'un StatefulWidget
class PageCompteur extends StatefulWidget {
  const PageCompteur({super.key});

  @override
  State<PageCompteur> createState() => _PageCompteurState();
}

class _PageCompteurState extends State<PageCompteur> {
  // Variable d'état stockant la valeur numérique courante du compteur
  int _compteur = 0;

  @override
  Widget build(BuildContext context) {
    // Journalisation de l'activité de reconstruction pour analyse des performances
    print(
      "Reconstruction de l'interface du compteur - Valeur actuelle: $_compteur",
    );

    return Scaffold(
      // Intégration du système de navigation latéral standard
      endDrawer: const EndDrawerPerso(),

      // En-tête avec paramétrage visuel cohérent avec le thème applicatif
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Text('Module de Comptage Numérique'),
      ),

      // Zone principale organisée autour d'un conteneur central
      body: Center(
        child: Container(
          // Délimitation périphérique pour structurer l'espace visuel
          margin: const EdgeInsets.all(10),

          // Adaptation dynamique à la largeur disponible de l'écran
          width: MediaQuery.of(context).size.width,

          // Définition des caractéristiques esthétiques du cadre
          decoration: BoxDecoration(
            // Bordure colorée suivant la palette principale
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 3,
            ),
            // Adoucissement des angles pour une apparence moderne
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),

          // Organisation verticale des éléments d'interface
          child: Column(
            // Centrage vertical de tous les composants enfants
            mainAxisAlignment: MainAxisAlignment.center,

            // Occupation maximale de l'espace vertical disponible
            mainAxisSize: MainAxisSize.max,

            // Collection des widgets affichés dans la colonne
            children: [
              // Libellé descriptif de la valeur affichée
              Text(
                "Valeur courante du compteur :",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 15),

              // Affichage principal de la valeur numérique actuelle
              Text(
                _compteur.toString(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 25),

              // Instructions opérationnelles pour l'utilisateur
              Text(
                "Utilisez le bouton d'action flottant pour augmenter la valeur",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

      // Contrôle d'interaction principal positionné au-dessus du contenu
      floatingActionButton: FloatingActionButton(
        // Déclencheur d'action au contact utilisateur
        onPressed: () {
          // Notification du framework pour mise à jour de l'interface
          setState(() {
            // Modification incrémentielle de la variable d'état
            _compteur++;
          });

          // Enregistrement de l'opération dans les logs système
          print(
            "Opération d'incrémentation exécutée - Nouvelle valeur: $_compteur",
          );
        },

        // Représentation visuelle de la fonction d'addition
        child: const Icon(Icons.add_circle_outline, size: 30),

        // Paramétrage esthétique optionnel
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
      ),

      // Positionnement personnalisé du bouton d'action
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
