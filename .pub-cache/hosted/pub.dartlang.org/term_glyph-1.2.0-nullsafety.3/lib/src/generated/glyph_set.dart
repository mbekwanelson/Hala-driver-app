// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Don't modify this file by hand! It's generated by tool/generate.dart.

/// A class that provides access to every configurable glyph.
///
/// This is provided as a class so that individual chunks of code can choose
/// between [ascii] and [unicode] glyphs. For example:
///
/// ```dart
/// import 'package:term_glyph/term_glyph.dart' as glyph;
///
/// /// Adds a vertical line to the left of [text].
/// ///
/// /// If [unicode] is `true`, this uses Unicode for the line. If it's
/// /// `false`, this uses plain ASCII characters. If it's `null`, it
/// /// defaults to [glyph.ascii].
/// void addVerticalLine(String text, {bool unicode}) {
///   var glyphs =
///       (unicode ?? !glyph.ascii) ? glyph.unicodeGlyphs : glyph.asciiGlyphs;
///
///   return text
///       .split('\n')
///       .map((line) => '${glyphs.verticalLine} $line')
///       .join('\n');
/// }
/// ```
abstract class GlyphSet {
  /// Returns [glyph] if [this] supports Unicode glyphs and [alternative]
  /// otherwise.
  String glyphOrAscii(String glyph, String alternative);

  /// A bullet point.
  String get bullet;

  /// A left-pointing arrow.
  ///
  /// Note that the Unicode arrow glyphs may overlap with adjacent characters in some
  /// terminal fonts, and should generally be surrounding by spaces.
  String get leftArrow;

  /// A right-pointing arrow.
  ///
  /// Note that the Unicode arrow glyphs may overlap with adjacent characters in some
  /// terminal fonts, and should generally be surrounding by spaces.
  String get rightArrow;

  /// An upwards-pointing arrow.
  String get upArrow;

  /// A downwards-pointing arrow.
  String get downArrow;

  /// A two-character left-pointing arrow.
  String get longLeftArrow;

  /// A two-character right-pointing arrow.
  String get longRightArrow;

  /// A horizontal line that can be used to draw a box.
  String get horizontalLine;

  /// A vertical line that can be used to draw a box.
  String get verticalLine;

  /// The upper left-hand corner of a box.
  String get topLeftCorner;

  /// The upper right-hand corner of a box.
  String get topRightCorner;

  /// The lower left-hand corner of a box.
  String get bottomLeftCorner;

  /// The lower right-hand corner of a box.
  String get bottomRightCorner;

  /// An intersection of vertical and horizontal box lines.
  String get cross;

  /// A horizontal box line with a vertical line going up from the middle.
  String get teeUp;

  /// A horizontal box line with a vertical line going down from the middle.
  String get teeDown;

  /// A vertical box line with a horizontal line going left from the middle.
  String get teeLeft;

  /// A vertical box line with a horizontal line going right from the middle.
  String get teeRight;

  /// The top half of a vertical box line.
  String get upEnd;

  /// The bottom half of a vertical box line.
  String get downEnd;

  /// The left half of a horizontal box line.
  String get leftEnd;

  /// The right half of a horizontal box line.
  String get rightEnd;

  /// A bold horizontal line that can be used to draw a box.
  String get horizontalLineBold;

  /// A bold vertical line that can be used to draw a box.
  String get verticalLineBold;

  /// The bold upper left-hand corner of a box.
  String get topLeftCornerBold;

  /// The bold upper right-hand corner of a box.
  String get topRightCornerBold;

  /// The bold lower left-hand corner of a box.
  String get bottomLeftCornerBold;

  /// The bold lower right-hand corner of a box.
  String get bottomRightCornerBold;

  /// An intersection of bold vertical and horizontal box lines.
  String get crossBold;

  /// A bold horizontal box line with a vertical line going up from the middle.
  String get teeUpBold;

  /// A bold horizontal box line with a vertical line going down from the middle.
  String get teeDownBold;

  /// A bold vertical box line with a horizontal line going left from the middle.
  String get teeLeftBold;

  /// A bold vertical box line with a horizontal line going right from the middle.
  String get teeRightBold;

  /// The top half of a bold vertical box line.
  String get upEndBold;

  /// The bottom half of a bold vertical box line.
  String get downEndBold;

  /// The left half of a bold horizontal box line.
  String get leftEndBold;

  /// The right half of a bold horizontal box line.
  String get rightEndBold;

  /// A double horizontal line that can be used to draw a box.
  String get horizontalLineDouble;

  /// A double vertical line that can be used to draw a box.
  String get verticalLineDouble;

  /// The double upper left-hand corner of a box.
  String get topLeftCornerDouble;

  /// The double upper right-hand corner of a box.
  String get topRightCornerDouble;

  /// The double lower left-hand corner of a box.
  String get bottomLeftCornerDouble;

  /// The double lower right-hand corner of a box.
  String get bottomRightCornerDouble;

  /// An intersection of double vertical and horizontal box lines.
  String get crossDouble;

  /// A double horizontal box line with a vertical line going up from the middle.
  String get teeUpDouble;

  /// A double horizontal box line with a vertical line going down from the middle.
  String get teeDownDouble;

  /// A double vertical box line with a horizontal line going left from the middle.
  String get teeLeftDouble;

  /// A double vertical box line with a horizontal line going right from the middle.
  String get teeRightDouble;

  /// A dashed horizontal line that can be used to draw a box.
  String get horizontalLineDoubleDash;

  /// A bold dashed horizontal line that can be used to draw a box.
  String get horizontalLineDoubleDashBold;

  /// A dashed vertical line that can be used to draw a box.
  String get verticalLineDoubleDash;

  /// A bold dashed vertical line that can be used to draw a box.
  String get verticalLineDoubleDashBold;

  /// A dashed horizontal line that can be used to draw a box.
  String get horizontalLineTripleDash;

  /// A bold dashed horizontal line that can be used to draw a box.
  String get horizontalLineTripleDashBold;

  /// A dashed vertical line that can be used to draw a box.
  String get verticalLineTripleDash;

  /// A bold dashed vertical line that can be used to draw a box.
  String get verticalLineTripleDashBold;

  /// A dashed horizontal line that can be used to draw a box.
  String get horizontalLineQuadrupleDash;

  /// A bold dashed horizontal line that can be used to draw a box.
  String get horizontalLineQuadrupleDashBold;

  /// A dashed vertical line that can be used to draw a box.
  String get verticalLineQuadrupleDash;

  /// A bold dashed vertical line that can be used to draw a box.
  String get verticalLineQuadrupleDashBold;
}