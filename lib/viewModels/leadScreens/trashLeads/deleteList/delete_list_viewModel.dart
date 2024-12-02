import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/responseModels/leads/trashLeads/deleteList/delete_list_response_model.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/requestModels/trash/delete_list/delete_list.dart';
import '../../../../data/repositories/repositories.dart';

class TrashDeleteListViewModel extends GetxController {
  final Repositories api = Repositories();
  final RxBool loading = false.obs;
  final RxList<Item> leads = <Item>[].obs;
  final Rx<Meta?> meta = Rx<Meta?>(null);

  // Add refresh controller if needed
  final RxBool isLoadingMore = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  // This variable will hold the search term
  String searchTerm = '';

  @override
  void onInit() {
    super.onInit();
    fetchTrashDeleteList();
  }

  Future<void> fetchTrashDeleteList({
    int page = 1,
    int limit = 5,
    String? search,
  }) async {
    try {
      if (page == 1) {
        loading.value = true;
        hasError.value = false;
        errorMessage.value = '';
      } else {
        isLoadingMore.value = true;
      }

      final requestModel = DeleteListRequestModel(
        page: page,
        limit: limit,
        search: search,
      );

      final DeleteListResponseModel response = await api.trashDeleteListApi(requestModel.toJson());

      debugPrint('Response Trash Delete List: ${response.toJson()}');

      if (response.items != null) {
        if (page == 1) {
          leads.clear();
        }

        // Safely add new items
        final newItems = response.items!;
        leads.addAll(newItems);

        // Update metadata
        meta.value = response.meta;

        // Reset error states
        hasError.value = false;
        errorMessage.value = '';
      } else {
        debugPrint('No items found in response');
        if (page == 1) {
          leads.clear();
        }
      }
    } catch (error) {
      hasError.value = true;
      errorMessage.value = error.toString();
      debugPrint('Error fetching trash leads: $error');
      Utils.snackbarFailed('Failed to fetch leads: ${error.toString()}');
    } finally {
      if (page == 1) {
        loading.value = false;
      } else {
        isLoadingMore.value = false;
      }
    }
  }

  Future<void> refresh() async {
    await fetchTrashDeleteList(page: 1);
  }

  Future<void> loadMoreLeads() async {
    if (isLoadingMore.value || loading.value) return;

    final currentPage = meta.value?.currentPage ?? 0;
    final totalPages = meta.value?.totalPages ?? 0;

    if (currentPage < totalPages) {
      await fetchTrashDeleteList(
        page: currentPage + 1,
        limit: meta.value?.itemsPerPage ?? 15,
      );
    }
  }

  bool get canLoadMore {
    if (meta.value == null) return false;
    return (meta.value!.currentPage ?? 0) < (meta.value!.totalPages ?? 0);
  }

  void searchLeads(String? searchTerm) {
    this.searchTerm = searchTerm ?? ''; // Save the search term
    fetchTrashDeleteList(search: this.searchTerm, page: 1);
  }

  // Getter for filtered leads based on the current search term
  List<Item> get filteredLeads {
    if (searchTerm.isEmpty) {
      return leads; // Return all leads if no search term
    }
    return leads.where((lead) => lead.firstName?.toLowerCase().contains(searchTerm.toLowerCase()) ?? false).toList();
  }

  @override
  void onClose() {
    // Clean up if needed
    super.onClose();
  }
}
