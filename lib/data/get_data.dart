import 'package:dio/dio.dart';
import 'package:riverpod_tutorial/data/data_model.dart';

class GetData {
  Future<List<DataModel>> getData() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    List resposeList = response.data;
    List<DataModel> dataList =
        resposeList.map((e) => DataModel.fromJson(e)).toList();
    return dataList;
  }
}
