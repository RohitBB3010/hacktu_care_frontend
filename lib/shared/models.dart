import 'package:copy_with_extension/copy_with_extension.dart';

part 'models.g.dart';

@CopyWith()
class Message {
  final String role;
  final String message;

  Message({required this.role, required this.message});
}
