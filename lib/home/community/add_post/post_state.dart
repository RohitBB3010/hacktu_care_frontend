import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';

part 'post_state.g.dart';

@CopyWith()
class AddPostState {
  String? title;
  String? postBody;
  String? tag;
  PlatformFile? postImage;

  AddPostState({this.title, this.postBody, this.tag, this.postImage});
}
