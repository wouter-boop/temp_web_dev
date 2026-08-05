// This is a generated file - do not edit.
//
// Generated from agenda.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class AgendaRequest extends $pb.GeneratedMessage {
  factory AgendaRequest({
    $core.int? gnAgendaNaam,
    $core.int? paramVoorletters,
    $core.int? paramAantal,
    $core.String? paraDatumVanaf,
    $core.String? paraDatumTm,
    $core.int? paramAgendaKamer,
  }) {
    final result = create();
    if (gnAgendaNaam != null) result.gnAgendaNaam = gnAgendaNaam;
    if (paramVoorletters != null) result.paramVoorletters = paramVoorletters;
    if (paramAantal != null) result.paramAantal = paramAantal;
    if (paraDatumVanaf != null) result.paraDatumVanaf = paraDatumVanaf;
    if (paraDatumTm != null) result.paraDatumTm = paraDatumTm;
    if (paramAgendaKamer != null) result.paramAgendaKamer = paramAgendaKamer;
    return result;
  }

  AgendaRequest._();

  factory AgendaRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgendaRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgendaRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'agenda'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'gnAgendaNaam')
    ..aI(2, _omitFieldNames ? '' : 'paramVoorletters')
    ..aI(3, _omitFieldNames ? '' : 'paramAantal')
    ..aOS(4, _omitFieldNames ? '' : 'paraDatumVanaf')
    ..aOS(5, _omitFieldNames ? '' : 'paraDatumTm')
    ..aI(6, _omitFieldNames ? '' : 'paramAgendaKamer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgendaRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgendaRequest copyWith(void Function(AgendaRequest) updates) =>
      super.copyWith((message) => updates(message as AgendaRequest))
          as AgendaRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgendaRequest create() => AgendaRequest._();
  @$core.override
  AgendaRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgendaRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgendaRequest>(create);
  static AgendaRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gnAgendaNaam => $_getIZ(0);
  @$pb.TagNumber(1)
  set gnAgendaNaam($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGnAgendaNaam() => $_has(0);
  @$pb.TagNumber(1)
  void clearGnAgendaNaam() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get paramVoorletters => $_getIZ(1);
  @$pb.TagNumber(2)
  set paramVoorletters($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParamVoorletters() => $_has(1);
  @$pb.TagNumber(2)
  void clearParamVoorletters() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get paramAantal => $_getIZ(2);
  @$pb.TagNumber(3)
  set paramAantal($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParamAantal() => $_has(2);
  @$pb.TagNumber(3)
  void clearParamAantal() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get paraDatumVanaf => $_getSZ(3);
  @$pb.TagNumber(4)
  set paraDatumVanaf($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParaDatumVanaf() => $_has(3);
  @$pb.TagNumber(4)
  void clearParaDatumVanaf() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get paraDatumTm => $_getSZ(4);
  @$pb.TagNumber(5)
  set paraDatumTm($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParaDatumTm() => $_has(4);
  @$pb.TagNumber(5)
  void clearParaDatumTm() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get paramAgendaKamer => $_getIZ(5);
  @$pb.TagNumber(6)
  set paramAgendaKamer($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParamAgendaKamer() => $_has(5);
  @$pb.TagNumber(6)
  void clearParamAgendaKamer() => $_clearField(6);
}

class AgendaAfspraak extends $pb.GeneratedMessage {
  factory AgendaAfspraak({
    $core.String? naam,
    $core.String? geslacht,
    $core.int? debNr,
    $core.String? debCod,
    $core.String? agendaDatumA,
    $core.String? agendaTijdBegin,
    $core.String? agendaTijdEind,
    $core.String? agendaReden,
    $core.int? agendaKamer,
    $core.int? fAgendaId,
    $core.String? behandelaar,
    $core.int? status,
    $core.int? medewerkerNr,
    $core.String? medewerkerVoornaam,
    $core.String? medewerkerAchternaam,
    $fixnum.Int64? aantalVervolgAfspraken,
  }) {
    final result = create();
    if (naam != null) result.naam = naam;
    if (geslacht != null) result.geslacht = geslacht;
    if (debNr != null) result.debNr = debNr;
    if (debCod != null) result.debCod = debCod;
    if (agendaDatumA != null) result.agendaDatumA = agendaDatumA;
    if (agendaTijdBegin != null) result.agendaTijdBegin = agendaTijdBegin;
    if (agendaTijdEind != null) result.agendaTijdEind = agendaTijdEind;
    if (agendaReden != null) result.agendaReden = agendaReden;
    if (agendaKamer != null) result.agendaKamer = agendaKamer;
    if (fAgendaId != null) result.fAgendaId = fAgendaId;
    if (behandelaar != null) result.behandelaar = behandelaar;
    if (status != null) result.status = status;
    if (medewerkerNr != null) result.medewerkerNr = medewerkerNr;
    if (medewerkerVoornaam != null)
      result.medewerkerVoornaam = medewerkerVoornaam;
    if (medewerkerAchternaam != null)
      result.medewerkerAchternaam = medewerkerAchternaam;
    if (aantalVervolgAfspraken != null)
      result.aantalVervolgAfspraken = aantalVervolgAfspraken;
    return result;
  }

  AgendaAfspraak._();

  factory AgendaAfspraak.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgendaAfspraak.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgendaAfspraak',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'agenda'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'naam')
    ..aOS(2, _omitFieldNames ? '' : 'geslacht')
    ..aI(3, _omitFieldNames ? '' : 'debNr')
    ..aOS(4, _omitFieldNames ? '' : 'debCod')
    ..aOS(5, _omitFieldNames ? '' : 'agendaDatumA')
    ..aOS(6, _omitFieldNames ? '' : 'agendaTijdBegin')
    ..aOS(7, _omitFieldNames ? '' : 'agendaTijdEind')
    ..aOS(8, _omitFieldNames ? '' : 'agendaReden')
    ..aI(9, _omitFieldNames ? '' : 'agendaKamer')
    ..aI(10, _omitFieldNames ? '' : 'fAgendaId')
    ..aOS(11, _omitFieldNames ? '' : 'behandelaar')
    ..aI(12, _omitFieldNames ? '' : 'status')
    ..aI(13, _omitFieldNames ? '' : 'medewerkerNr')
    ..aOS(14, _omitFieldNames ? '' : 'medewerkerVoornaam')
    ..aOS(15, _omitFieldNames ? '' : 'medewerkerAchternaam')
    ..aInt64(16, _omitFieldNames ? '' : 'aantalVervolgAfspraken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgendaAfspraak clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgendaAfspraak copyWith(void Function(AgendaAfspraak) updates) =>
      super.copyWith((message) => updates(message as AgendaAfspraak))
          as AgendaAfspraak;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgendaAfspraak create() => AgendaAfspraak._();
  @$core.override
  AgendaAfspraak createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgendaAfspraak getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgendaAfspraak>(create);
  static AgendaAfspraak? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get naam => $_getSZ(0);
  @$pb.TagNumber(1)
  set naam($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNaam() => $_has(0);
  @$pb.TagNumber(1)
  void clearNaam() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get geslacht => $_getSZ(1);
  @$pb.TagNumber(2)
  set geslacht($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGeslacht() => $_has(1);
  @$pb.TagNumber(2)
  void clearGeslacht() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get debNr => $_getIZ(2);
  @$pb.TagNumber(3)
  set debNr($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDebNr() => $_has(2);
  @$pb.TagNumber(3)
  void clearDebNr() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get debCod => $_getSZ(3);
  @$pb.TagNumber(4)
  set debCod($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDebCod() => $_has(3);
  @$pb.TagNumber(4)
  void clearDebCod() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get agendaDatumA => $_getSZ(4);
  @$pb.TagNumber(5)
  set agendaDatumA($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAgendaDatumA() => $_has(4);
  @$pb.TagNumber(5)
  void clearAgendaDatumA() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get agendaTijdBegin => $_getSZ(5);
  @$pb.TagNumber(6)
  set agendaTijdBegin($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAgendaTijdBegin() => $_has(5);
  @$pb.TagNumber(6)
  void clearAgendaTijdBegin() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get agendaTijdEind => $_getSZ(6);
  @$pb.TagNumber(7)
  set agendaTijdEind($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAgendaTijdEind() => $_has(6);
  @$pb.TagNumber(7)
  void clearAgendaTijdEind() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get agendaReden => $_getSZ(7);
  @$pb.TagNumber(8)
  set agendaReden($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAgendaReden() => $_has(7);
  @$pb.TagNumber(8)
  void clearAgendaReden() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get agendaKamer => $_getIZ(8);
  @$pb.TagNumber(9)
  set agendaKamer($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAgendaKamer() => $_has(8);
  @$pb.TagNumber(9)
  void clearAgendaKamer() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get fAgendaId => $_getIZ(9);
  @$pb.TagNumber(10)
  set fAgendaId($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFAgendaId() => $_has(9);
  @$pb.TagNumber(10)
  void clearFAgendaId() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get behandelaar => $_getSZ(10);
  @$pb.TagNumber(11)
  set behandelaar($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasBehandelaar() => $_has(10);
  @$pb.TagNumber(11)
  void clearBehandelaar() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get status => $_getIZ(11);
  @$pb.TagNumber(12)
  set status($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get medewerkerNr => $_getIZ(12);
  @$pb.TagNumber(13)
  set medewerkerNr($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasMedewerkerNr() => $_has(12);
  @$pb.TagNumber(13)
  void clearMedewerkerNr() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get medewerkerVoornaam => $_getSZ(13);
  @$pb.TagNumber(14)
  set medewerkerVoornaam($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasMedewerkerVoornaam() => $_has(13);
  @$pb.TagNumber(14)
  void clearMedewerkerVoornaam() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get medewerkerAchternaam => $_getSZ(14);
  @$pb.TagNumber(15)
  set medewerkerAchternaam($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasMedewerkerAchternaam() => $_has(14);
  @$pb.TagNumber(15)
  void clearMedewerkerAchternaam() => $_clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get aantalVervolgAfspraken => $_getI64(15);
  @$pb.TagNumber(16)
  set aantalVervolgAfspraken($fixnum.Int64 value) => $_setInt64(15, value);
  @$pb.TagNumber(16)
  $core.bool hasAantalVervolgAfspraken() => $_has(15);
  @$pb.TagNumber(16)
  void clearAantalVervolgAfspraken() => $_clearField(16);
}

class AgendaResponse extends $pb.GeneratedMessage {
  factory AgendaResponse({
    $core.Iterable<AgendaAfspraak>? afspraken,
  }) {
    final result = create();
    if (afspraken != null) result.afspraken.addAll(afspraken);
    return result;
  }

  AgendaResponse._();

  factory AgendaResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgendaResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgendaResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'agenda'),
      createEmptyInstance: create)
    ..pPM<AgendaAfspraak>(1, _omitFieldNames ? '' : 'afspraken',
        subBuilder: AgendaAfspraak.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgendaResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgendaResponse copyWith(void Function(AgendaResponse) updates) =>
      super.copyWith((message) => updates(message as AgendaResponse))
          as AgendaResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgendaResponse create() => AgendaResponse._();
  @$core.override
  AgendaResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgendaResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgendaResponse>(create);
  static AgendaResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AgendaAfspraak> get afspraken => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
