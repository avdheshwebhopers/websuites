import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Data/response/status.dart';
import '../../data/models/responseModels/dashboard/db_transactions_response_model.dart';
import '../../data/repositories/repositories.dart';


class HomeScreenTransactionsViewmodel extends GetxController {
  final _api = Repositories();

  final transactionList = DBLatestTransactionResponseModel().obs;
  final rxStatus = Status.loading.obs;
  RxString error = ''.obs;

  void setRxStatus (Status _value) => rxStatus.value = _value;
  void setTransactionList (DBLatestTransactionResponseModel _value) => transactionList.value = _value;
  void setError (String _value) =>  error.value = _value;


  Future<void> Db_transactions(BuildContext, context) async {

    _api.dbTransactionApi().then((value){
      setRxStatus(Status.completed);
      setTransactionList(value);

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxStatus(Status.error);
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}
