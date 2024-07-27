import 'package:http/http.dart' as http;
import 'package:pingo_news/app_config.dart';
import 'package:pingo_news/design_system/dialog/brand_dialog.dart';
import 'package:pingo_news/route/navigation_service.dart';
import 'package:pingo_news/util/enum/network_status.dart';

abstract class NetworkClient {
  static Future<http.Response?> get({required String endPoint}) async {
    var response = await http.get(Uri.parse('{$appDomain$endPoint}'),
        headers: {'Authorization': apiKey});
    if (response.statusCode == NetworkStatus.status200.statusCode) {
      return response;
    } else if (response.statusCode == NetworkStatus.status400.statusCode) {
      try {
        BrandDialog.showDialogs(
            context: NavigationService.scaffoldMessengerKey.currentContext!,
            message: NetworkStatus.status400.message);
      } catch (e) {
        rethrow;
      }
    } else if (response.statusCode == NetworkStatus.status401.statusCode) {
      try {
        BrandDialog.showDialogs(
            context: NavigationService.scaffoldMessengerKey.currentContext!,
            message: NetworkStatus.status401.message);
      } catch (e) {
        rethrow;
      }
    } else if (response.statusCode == NetworkStatus.status429.statusCode) {
      try {
        BrandDialog.showDialogs(
            context: NavigationService.scaffoldMessengerKey.currentContext!,
            message: NetworkStatus.status429.message);
      } catch (e) {
        rethrow;
      }
    } else if (response.statusCode == NetworkStatus.status500.statusCode) {
      try {
        BrandDialog.showDialogs(
            context: NavigationService.scaffoldMessengerKey.currentContext!,
            message: NetworkStatus.status500.message);
      } catch (e) {
        rethrow;
      }
    }

    return null;
  }
}
