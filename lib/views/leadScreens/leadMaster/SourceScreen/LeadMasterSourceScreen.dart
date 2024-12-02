import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../viewModels/leadScreens/leadMasters/source/lead_masters_source_viewModel.dart';
import '../../../../utils/appColors/app_colors.dart';

class SourceTab extends StatefulWidget {
  const SourceTab({Key? key}) : super(key: key);

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  final LeadMastersSourceViewmodel sourceViewModel = Get.put(LeadMastersSourceViewmodel());
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Only fetch data if not already loaded
    if (sourceViewModel.sourceData.isEmpty) {
      fetchData();
    }
  }

  Future<void> fetchData() async {
    await sourceViewModel.leadMasterSource(context);
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AllColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AllColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AllColors.mediumPurple),
        ),
      ),
      onChanged: (value) {
        // Implement search functionality here
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchField(),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              // Check loading state
              if (sourceViewModel.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (sourceViewModel.sourceData.isEmpty) {
                return const Center(child: Text('No source data available'));
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('S.No', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Created Date', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    sourceViewModel.sourceData.length,
                        (index) {
                      final source = sourceViewModel.sourceData[index];
                      return DataRow(
                        cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(Text(source.name ?? '')),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0x1F47BD82),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                source.status ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF47BD82),
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text(source.createdAt ?? '')),
                          DataCell(
                            IconButton(
                              icon: const Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                // Handle edit action
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
