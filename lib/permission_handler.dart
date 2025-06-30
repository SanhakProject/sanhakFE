import 'package:permission_handler/permission_handler.dart';

Future<void> requestMicPermission() async {
  final status = await Permission.microphone.request();
  if (status != PermissionStatus.granted) {
    print("마이크 권한 거부됨");
  }
}