import 'package:flutter/material.dart';

class _ClipRect extends CustomClipper<Rect> {
  final Rect Function(Size) clip;

  _ClipRect(this.clip);

  @override
  Rect getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class _ClipRRect extends CustomClipper<RRect> {
  final RRect Function(Size) clip;

  _ClipRRect(this.clip);

  @override
  RRect getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return true;
  }
}

class _ClipRound extends CustomClipper<Rect> {
  final Rect Function(Size) clip;

  _ClipRound(this.clip);

  @override
  Rect getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class _ClipPath extends CustomClipper<Path> {
  final Path Function(Size) clip;

  _ClipPath(this.clip);

  @override
  Path getClip(Size size) {
    return clip(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

// >>> 切割组件 >>>
extension ClipWidget on Widget {
  ClipRect _clipRectCustom(
      {Key? key,
      CustomClipper<Rect>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  ClipRect clipRect({Rect Function(Size)? clip}) {
    return _clipRectCustom(clipper: clip == null ? null : _ClipRect(clip));
  }

  ClipRRect _clipRRectCustom(
      {Key? key,
      double borderRadius = 5.0,
      CustomClipper<RRect>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipRRect(
      key: key,
      borderRadius: BorderRadius.circular(5.0),
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  ClipRRect clipRRect({RRect Function(Size)? clip, double borderRadius = 4}) {
    return _clipRRectCustom(
        clipper: clip == null ? null : _ClipRRect(clip),
        borderRadius: borderRadius);
  }

  ClipOval _clipRoundCustom(
      {Key? key,
      CustomClipper<Rect>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  ClipOval clipRound({Rect Function(Size)? clip}) {
    return _clipRoundCustom(clipper: clip == null ? null : _ClipRound(clip));
  }

  ClipPath _clipPathCustom(
      {Key? key,
      CustomClipper<Path>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipPath(
      key: key,
      clipBehavior: clipBehavior,
      clipper: clipper,
      child: this,
    );
  }

  ClipPath clipPath(Path Function(Size) clip) {
    return _clipPathCustom(clipper: _ClipPath(clip));
  }
}
