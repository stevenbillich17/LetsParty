/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  $LibAssetsFontsGen get fonts => const $LibAssetsFontsGen();
  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();
}

class $LibAssetsFontsGen {
  const $LibAssetsFontsGen();

  /// File path: lib/assets/fonts/KeeponTruckin.ttf
  String get keeponTruckin => 'lib/assets/fonts/KeeponTruckin.ttf';

  /// List of all assets
  List<String> get values => [keeponTruckin];
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/create_party.svg
  String get createParty => 'lib/assets/images/create_party.svg';

  /// File path: lib/assets/images/my-invites.svg
  String get myInvites => 'lib/assets/images/my-invites.svg';

  /// File path: lib/assets/images/party-games.svg
  String get partyGames => 'lib/assets/images/party-games.svg';

  /// File path: lib/assets/images/party_people.svg
  String get partyPeople => 'lib/assets/images/party_people.svg';

  /// File path: lib/assets/images/people-dancing.svg
  String get peopleDancing => 'lib/assets/images/people-dancing.svg';

  /// File path: lib/assets/images/settings.svg
  String get settings => 'lib/assets/images/settings.svg';

  /// List of all assets
  List<String> get values => [
        createParty,
        myInvites,
        partyGames,
        partyPeople,
        peopleDancing,
        settings
      ];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
