import 'package:riverpod/riverpod.dart';
import 'package:riverpod_tutorial/data/data_model.dart';
import 'package:riverpod_tutorial/data/get_data.dart';

class DataProvider {
  static final getDataList = FutureProvider<List<DataModel>>((ref) async {
    List<DataModel> dataList = await GetData().getData();
    return dataList;
  });
}
