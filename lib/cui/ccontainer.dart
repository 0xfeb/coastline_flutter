import 'package:flutter/cupertino.dart';

BorderRadiusGeometry borderRadius(
    {double all,
    double top,
    double bottom,
    double left,
    double right,
    double leftTop,
    double leftBottom,
    double rightTop,
    double rightBottom}) {
  Radius topLeft = Radius.circular(leftTop ?? left ?? top ?? all ?? 0);
  Radius topRight = Radius.circular(rightTop ?? right ?? top ?? all ?? 0);
  Radius bottomLeft = Radius.circular(leftBottom ?? left ?? bottom ?? all ?? 0);
  Radius bottomRight =
      Radius.circular(rightBottom ?? right ?? bottom ?? all ?? 0);
  return BorderRadius.only(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight);
}

class CContainer {
  Decoration _decoration;
  Decoration _forgroundDecoration;
  Key _key;
  AlignmentGeometry _alignmentGeometry;
  EdgeInsetsGeometry _edgeInsetsGeometry;
  double _width;
  double _height;
  BoxConstraints _boxConstraints;
  EdgeInsetsGeometry _margin;
  Matrix4 _transform;
  AlignmentGeometry _transformAlignment;
  Clip _clip;

  CContainer decorationBox(
      {Color color,
      DecorationImage image,
      BoxBorder border,
      BorderRadiusGeometry borderRadius,
      List<BoxShadow> boxShadow,
      Gradient gradient,
      BlendMode backgroundBlendMode,
      BoxShape shape}) {
    _decoration = BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape);
    return this;
  }

  CContainer decorationShape(
      {Color color,
      DecorationImage image,
      Gradient gradient,
      List<BoxShadow> shadows,
      ShapeBorder shape}) {
    _decoration = ShapeDecoration(
        shape: shape,
        color: color,
        image: image,
        gradient: gradient,
        shadows: shadows);
    return this;
  }

  CContainer decorationBoxForground(
      {Color color,
      DecorationImage image,
      BoxBorder border,
      BorderRadiusGeometry borderRadius,
      List<BoxShadow> boxShadow,
      Gradient gradient,
      BlendMode backgroundBlendMode,
      BoxShape shape}) {
    _forgroundDecoration = BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape);
    return this;
  }

  CContainer decorationShapeForground(
      {Color color,
      DecorationImage image,
      Gradient gradient,
      List<BoxShadow> shadows,
      ShapeBorder shape}) {
    _forgroundDecoration = ShapeDecoration(
        shape: shape,
        color: color,
        image: image,
        gradient: gradient,
        shadows: shadows);
    return this;
  }

  CContainer key(Key k) {
    _key = k;
    return this;
  }

  CContainer alignment(AlignmentGeometry a) {
    _alignmentGeometry = a;
    return this;
  }

  CContainer padding(EdgeInsetsGeometry e) {
    _edgeInsetsGeometry = e;
    return this;
  }

  CContainer width(double w) {
    _width = w;
    return this;
  }

  CContainer height(double h) {
    _height = h;
    return this;
  }

  CContainer containts(BoxConstraints bc) {
    _boxConstraints = bc;
    return this;
  }

  CContainer margin(EdgeInsetsGeometry e) {
    _margin = e;
    return this;
  }

  CContainer transform(Matrix4 m) {
    _transform = m;
    return this;
  }

  CContainer transformAlignment(AlignmentGeometry ag) {
    _transformAlignment = ag;
    return this;
  }

  CContainer clip(Clip c) {
    _clip = c;
    return this;
  }

  Container get empty {
    return Container(
      key: _key,
      alignment: _alignmentGeometry,
      foregroundDecoration: _forgroundDecoration,
      padding: _edgeInsetsGeometry,
      width: _width,
      height: _height,
      constraints: _boxConstraints,
      margin: _margin,
      transform: _transform,
      transformAlignment: _transformAlignment,
      clipBehavior: _clip ?? Clip.none,
      decoration: _decoration,
    );
  }

  Container child(Widget c) {
    return Container(
      key: _key,
      alignment: _alignmentGeometry,
      foregroundDecoration: _forgroundDecoration,
      padding: _edgeInsetsGeometry,
      width: _width,
      height: _height,
      constraints: _boxConstraints,
      margin: _margin,
      transform: _transform,
      transformAlignment: _transformAlignment,
      clipBehavior: _clip ?? Clip.none,
      decoration: _decoration,
      child: c,
    );
  }
}
