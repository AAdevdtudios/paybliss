import 'package:get/get.dart';

import '../networks_model.dart';

class NetworksProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Networks.fromJson(map);
      if (map is List)
        return map.map((item) => Networks.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Networks?> getNetworks(int id) async {
    final response = await get('networks/$id');
    return response.body;
  }

  Future<Response<Networks>> postNetworks(Networks networks) async =>
      await post('networks', networks);
  Future<Response> deleteNetworks(int id) async => await delete('networks/$id');
}
