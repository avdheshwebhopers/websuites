import 'package:get/get.dart';
import '../../../../../data/network/base_api_services.dart';

class LeadSourceController extends GetxController {
  final BaseApiServices _apiService;

  LeadSourceController({required BaseApiServices apiService}) : _apiService = apiService;

  // Observable variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var leadSources = <Map<String, dynamic>>[].obs;
  var filteredLeadSources = <Map<String, dynamic>>[].obs; // To hold filtered sources
  var selectedSource = Rxn<Map<String, dynamic>>(); // Store a single selected source

  // Fetch lead sources from the API
  Future<void> fetchLeadSources(String url) async {
    isLoading(true);
    errorMessage('');
    try {
      dynamic response = await _apiService.getApi(url);
      if (response is List) {
        leadSources.assignAll(response.cast<Map<String, dynamic>>());
      } else if (response is Map && response.containsKey('data')) {
        leadSources.assignAll((response['data'] as List).cast<Map<String, dynamic>>());
      } else {
        throw Exception('Unexpected response format');
      }
      // Initialize filteredLeadSources with all lead sources after fetching
      filteredLeadSources.assignAll(leadSources);
    } catch (e) {
      errorMessage('Failed to fetch lead sources: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  // Set the selected lead source
  void setSelectedSource(dynamic sourceId) {
    final source = leadSources.firstWhere((s) => s['id'] == sourceId, orElse: () => {});
    if (source.isNotEmpty) {
      selectedSource.value = source;
    } else {
      selectedSource.value = null; // Clear selection if not found
    }
  }

  // Clear the selected source
  void clearSelection() {
    selectedSource.value = null;
  }

  // Method to filter lead sources based on user input
  void filterLeadSources(String query) {
    if (query.isEmpty) {
      filteredLeadSources.assignAll(leadSources); // Show all sources if query is empty
    } else {
      filteredLeadSources.assignAll(
        leadSources.where((source) =>
            (source['name'] ?? '').toLowerCase().contains(query.toLowerCase())
        ).toList(),
      );
    }
  }
}