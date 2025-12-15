import 'dart:convert';
import 'package:http/http.dart' as http;

// Service centralisé de communication avec les API externes
// Implémentation du pattern Singleton pour garantir une instance unique
class ApiServices {
  // Instance statique unique de la classe suivant le pattern Singleton
  static final ApiServices _instance = ApiServices._internal();

  // Constructeur privé empêchant l'instanciation directe depuis l'extérieur
  ApiServices._internal();

  // Factory constructor garantissant le retour systématique de l'instance unique
  factory ApiServices() => _instance;

  // Méthode asynchrone d'extraction de données depuis une ressource HTTP externe
  // Retourne un objet dynamique contenant les informations structurées
  Future<dynamic> getData(String url) async {
    try {
      // Exécution de la requête HTTP GET avec gestion du timeout implicite
      final response = await http.get(Uri.parse(url));

      // Vérification du code de statut HTTP pour déterminer le succès de l'opération
      if (response.statusCode == 200) {
        // Décodage de la réponse JSON en structure de données Dart native
        return jsonDecode(response.body);
      } else {
        // Génération d'une exception explicite en cas d'échec de la requête
        throw Exception(
          "Échec de récupération des données distantes. "
          "Code d'erreur HTTP: ${response.statusCode}. "
          "Description: ${response.reasonPhrase}",
        );
      }
    } catch (e, stackTrace) {
      // Journalisation détaillée des exceptions pour le débogage technique
      print("Exception survenue lors de la communication API: $e");
      print("Trace d'exécution complète: $stackTrace");

      // Propagation de l'exception pour permettre une gestion ultérieure
      rethrow;
    }
  }
}
