import '../exception/http_exception.dart';
import '../handle_exception.dart';
import 'loading.dart';

Future blockLoading(
  Function() block, {
  bool showLoading = true,
  bool Function(HttpException)? onError,
}) async {
  try {
    await loading(block, isShowLoading: showLoading);
  } catch (e) {
    handleException(HttpException.from(e), onError: onError);
  }
  return;
}
