// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddPostStateCWProxy {
  AddPostState title(String? title);

  AddPostState postBody(String? postBody);

  AddPostState tag(String? tag);

  AddPostState postImage(PlatformFile? postImage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddPostState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddPostState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddPostState call({
    String? title,
    String? postBody,
    String? tag,
    PlatformFile? postImage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddPostState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddPostState.copyWith.fieldName(...)`
class _$AddPostStateCWProxyImpl implements _$AddPostStateCWProxy {
  const _$AddPostStateCWProxyImpl(this._value);

  final AddPostState _value;

  @override
  AddPostState title(String? title) => this(title: title);

  @override
  AddPostState postBody(String? postBody) => this(postBody: postBody);

  @override
  AddPostState tag(String? tag) => this(tag: tag);

  @override
  AddPostState postImage(PlatformFile? postImage) => this(postImage: postImage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddPostState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddPostState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddPostState call({
    Object? title = const $CopyWithPlaceholder(),
    Object? postBody = const $CopyWithPlaceholder(),
    Object? tag = const $CopyWithPlaceholder(),
    Object? postImage = const $CopyWithPlaceholder(),
  }) {
    return AddPostState(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      postBody: postBody == const $CopyWithPlaceholder()
          ? _value.postBody
          // ignore: cast_nullable_to_non_nullable
          : postBody as String?,
      tag: tag == const $CopyWithPlaceholder()
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as String?,
      postImage: postImage == const $CopyWithPlaceholder()
          ? _value.postImage
          // ignore: cast_nullable_to_non_nullable
          : postImage as PlatformFile?,
    );
  }
}

extension $AddPostStateCopyWith on AddPostState {
  /// Returns a callable class that can be used as follows: `instanceOfAddPostState.copyWith(...)` or like so:`instanceOfAddPostState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddPostStateCWProxy get copyWith => _$AddPostStateCWProxyImpl(this);
}
