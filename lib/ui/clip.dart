import 'package:flutter/material.dart';

extension ClipWidget on Widget {
  ClipRect clipRect(
      {Key? key,
      CustomClipper<Rect>? clipper,
      Clip clipBehavior = Clip.hardEdge}) {
    return ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
    );
  }

  ClipRRect clipRRect(
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

  ClipOval clipRound(
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
}
