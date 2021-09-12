// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async' show Future, Stream;
import 'dart:convert' show Encoding;

import 'resolve_none.dart'
    if (dart.library.html) 'resolve_html.dart'
    if (dart.library.io) 'resolve_io.dart';

import 'resource_loader.dart';

/// Base resource implementation.
class Resource {
  // Default implementation of a generic `Resource` class.
  //
  // Actually exposed `Resource` interfaces uses this as implementation,
  // but expose a different `Resource` class with plaform-dependent statics.
  // Requires a loader to be provided.

  /// Loading strategy for the resource.
  final ResourceLoader _loader;

  /// The URI of the resource.
  final dynamic _uri;

  /// Creates a resource object with the given [uri] as location.
  ///
  /// The [uri] must be either a [Uri] or a [String] containing a valid URI.
  /// If the string is not a valid URI, using any of the functions on
  /// the resource object will fail.
  ///
  /// The URI may be relative, in which case it will be resolved
  /// against [Uri.base] before being used.
  ///
  /// The URI may use the `package` scheme,
  /// which is supported if the platform can load files at runtime at all.
  /// Other schemes may also be supported where possible.
  ///
  /// If [loader] is provided, it is used to load absolute non-package URIs.
  /// Package: URIs are resolved to a non-package URI before being loaded, so
  /// the loader doesn't have to support package: URIs, nor does it need to
  /// support relative URI references.
  /// If [loader] is omitted, a default implementation is used which supports
  /// as many of `http`, `https`, `file` and `data` as are available on the
  /// current platform.
  const Resource(uri, {ResourceLoader loader})
      : _uri = uri,
        _loader = loader ?? const DefaultLoader();

  /// The location URI of this resource.
  ///
  /// This is a [Uri] of the `uri` parameter given to the constructor.
  /// If the parameter was a string that did not contain a valid URI,
  /// reading `uri` will fail.
  Uri get uri => (_uri is String) ? Uri.parse(_uri) : (_uri as Uri);

  /// Reads the resource content as a stream of bytes.
  Stream<List<int>> openRead() async* {
    var uri = await uriResolved;
    yield* _loader.openRead(uri);
  }

  /// Reads the resource content as a single list of bytes.
  Future<List<int>> readAsBytes() async {
    var uri = await uriResolved;
    return _loader.readAsBytes(uri);
  }

  /// Reads the resource content as a string.
  ///
  /// The content is decoded into a string using an [Encoding].
  /// If no encoding is provided, an encoding is chosen depending on the
  /// protocol and/or available metadata.
  Future<String> readAsString({Encoding encoding}) async {
    var uri = await uriResolved;
    return _loader.readAsString(uri, encoding: encoding);
  }

  Future<Uri> get uriResolved => _ResolvedURIs.resolveURI(uri);
}

class _ResolvedURIs {
  static final Map<Uri, Uri> _resolvedURIs = {};

  static Future<Uri> resolveURI(Uri uri) async {
    var resolvedURI = _resolvedURIs[uri];
    if (resolvedURI != null) return resolvedURI;

    resolvedURI = await resolveUri(uri);
    _resolvedURIs[uri] = resolvedURI;

    return resolvedURI;
  }
}
