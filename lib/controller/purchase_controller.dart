import 'package:my_own_api/services/api_service.dart';

class PurchaseController {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>?> fetchPurchaseDetails(String url) async {
    try {
      final purchaseDetails = await _apiService.postPurchaseDetails(url);
      if (purchaseDetails != null) {
        print(purchaseDetails); // Debugging purpose
        return purchaseDetails;
      } else {
        throw Exception("No purchase details returned");
      }
    } catch (e) {
      print("Error in controller: $e");
      return null;
    }
  }
}
