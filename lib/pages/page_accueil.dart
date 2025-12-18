import 'dart:convert';
import 'package:app_api_reste_boutique/components/end_drawer_perso.dart';
import 'package:app_api_reste_boutique/services/api_services.dart';
import 'package:flutter/material.dart';

// Interface principale affichant des données dynamiques récupérées via API
// Utilisation de StatefulWidget pour gérer les états de chargement et les données
class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  // Structure de stockage des informations utilisateurs obtenues du serveur
  List<Map<String, dynamic>> data = [];

  // Indicateur de progression pour les opérations asynchrones
  bool _isLoading = false;

  // Méthode d'initialisation exécutée une fois lors de la création du composant
  @override
  void initState() {
    super.initState();

    // Initialisation du service de communication avec l'API externe
    final apiServices = ApiServices();

    // Activation de l'indicateur visuel de chargement
    _isLoading = true;

    // Exécution de la requête HTTP pour récupérer les données distantes
    apiServices
        .getData("https://jsonplaceholder.typicode.com/users")
        .then((result) {
          // Journalisation du résultat brut pour analyse et débogage
          print(jsonEncode(result));

          // Mise à jour synchrone de l'interface utilisateur
          setState(() {
            // Désactivation de l'indicateur de progression
            _isLoading = false;

            // Transformation et stockage des données reçues
            data = List<Map<String, dynamic>>.from(result);
          });
        })
        .catchError((error) {
          // Gestion des erreurs potentielles lors de l'appel API
          setState(() {
            _isLoading = false;
          });
          print("Erreur lors du chargement des données: $error");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Intégration du système de navigation latéral personnalisé
      endDrawer: const EndDrawerPerso(),

      // Barre d'outils supérieure avec paramètres visuels adaptatifs
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Text("Tableau de bord principal"),
      ),

      // Zone d'affichage du contenu avec gestion des états multiples
      body: Center(
        child: SafeArea(
          bottom: true,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  // Délimitation périphérique pour aérer la présentation
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,

                  // Cadrage décoratif avec bordures thématiques
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  // Logique conditionnelle d'affichage selon l'état du système
                  child: data.isNotEmpty
                      ? ListView.separated(
                          // Construction dynamique de chaque élément utilisateur
                          itemBuilder: (context, index) {
                            return ListTile(
                              // Avatar généré algorithmiquement selon l'identifiant
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/150?img=${data[index]["id"]}",
                                ),
                                radius: 30,
                              ),
                              // Affichage de l'identité principale
                              title: Text(
                                data[index]["name"]?.toString() ??
                                    'Non spécifié',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // Information de contact secondaire
                              subtitle: Text(
                                data[index]["email"]?.toString() ??
                                    'Email non disponible',
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          },
                          // Séparateur visuel entre les entrées de la liste
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Theme.of(context).colorScheme.tertiary,
                              thickness: 4,
                              height: 1,
                            );
                          },
                          // Détermination du nombre d'éléments à afficher
                          itemCount: data.length,
                        )
                      : Center(
                          // Message contextuel en l'absence de données
                          child: Text(
                            "Aucune donnée disponible pour l'affichage",
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
        ),
      ),
    );
  }
}
