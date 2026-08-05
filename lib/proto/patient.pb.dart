// This is a generated file - do not edit.
//
// Generated from patient.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PatientRequest extends $pb.GeneratedMessage {
  factory PatientRequest({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  PatientRequest._();

  factory PatientRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PatientRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PatientRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'odontium'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PatientRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PatientRequest copyWith(void Function(PatientRequest) updates) =>
      super.copyWith((message) => updates(message as PatientRequest))
          as PatientRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PatientRequest create() => PatientRequest._();
  @$core.override
  PatientRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PatientRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PatientRequest>(create);
  static PatientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class CreatePatientRequest extends $pb.GeneratedMessage {
  factory CreatePatientRequest({
    $core.String? id,
    $core.String? naam,
    $core.int? leeftijd,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (naam != null) result.naam = naam;
    if (leeftijd != null) result.leeftijd = leeftijd;
    return result;
  }

  CreatePatientRequest._();

  factory CreatePatientRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePatientRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePatientRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'odontium'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'naam')
    ..aI(3, _omitFieldNames ? '' : 'leeftijd')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePatientRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePatientRequest copyWith(void Function(CreatePatientRequest) updates) =>
      super.copyWith((message) => updates(message as CreatePatientRequest))
          as CreatePatientRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePatientRequest create() => CreatePatientRequest._();
  @$core.override
  CreatePatientRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePatientRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePatientRequest>(create);
  static CreatePatientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get naam => $_getSZ(1);
  @$pb.TagNumber(2)
  set naam($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNaam() => $_has(1);
  @$pb.TagNumber(2)
  void clearNaam() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get leeftijd => $_getIZ(2);
  @$pb.TagNumber(3)
  set leeftijd($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeeftijd() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeeftijd() => $_clearField(3);
}

class PatientResponse extends $pb.GeneratedMessage {
  factory PatientResponse({
    $core.String? id,
    $core.String? naam,
    $core.int? leeftijd,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (naam != null) result.naam = naam;
    if (leeftijd != null) result.leeftijd = leeftijd;
    return result;
  }

  PatientResponse._();

  factory PatientResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PatientResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PatientResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'odontium'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'naam')
    ..aI(3, _omitFieldNames ? '' : 'leeftijd')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PatientResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PatientResponse copyWith(void Function(PatientResponse) updates) =>
      super.copyWith((message) => updates(message as PatientResponse))
          as PatientResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PatientResponse create() => PatientResponse._();
  @$core.override
  PatientResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PatientResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PatientResponse>(create);
  static PatientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get naam => $_getSZ(1);
  @$pb.TagNumber(2)
  set naam($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNaam() => $_has(1);
  @$pb.TagNumber(2)
  void clearNaam() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get leeftijd => $_getIZ(2);
  @$pb.TagNumber(3)
  set leeftijd($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeeftijd() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeeftijd() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
