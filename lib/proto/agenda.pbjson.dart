// This is a generated file - do not edit.
//
// Generated from agenda.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use agendaRequestDescriptor instead')
const AgendaRequest$json = {
  '1': 'AgendaRequest',
  '2': [
    {
      '1': 'gn_agenda_naam',
      '3': 1,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'gnAgendaNaam',
      '17': true
    },
    {
      '1': 'param_voorletters',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'paramVoorletters',
      '17': true
    },
    {
      '1': 'param_aantal',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'paramAantal',
      '17': true
    },
    {
      '1': 'para_datum_vanaf',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'paraDatumVanaf',
      '17': true
    },
    {
      '1': 'para_datum_tm',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'paraDatumTm',
      '17': true
    },
    {
      '1': 'param_agenda_kamer',
      '3': 6,
      '4': 1,
      '5': 5,
      '9': 5,
      '10': 'paramAgendaKamer',
      '17': true
    },
  ],
  '8': [
    {'1': '_gn_agenda_naam'},
    {'1': '_param_voorletters'},
    {'1': '_param_aantal'},
    {'1': '_para_datum_vanaf'},
    {'1': '_para_datum_tm'},
    {'1': '_param_agenda_kamer'},
  ],
};

/// Descriptor for `AgendaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agendaRequestDescriptor = $convert.base64Decode(
    'Cg1BZ2VuZGFSZXF1ZXN0EikKDmduX2FnZW5kYV9uYWFtGAEgASgFSABSDGduQWdlbmRhTmFhbY'
    'gBARIwChFwYXJhbV92b29ybGV0dGVycxgCIAEoBUgBUhBwYXJhbVZvb3JsZXR0ZXJziAEBEiYK'
    'DHBhcmFtX2FhbnRhbBgDIAEoBUgCUgtwYXJhbUFhbnRhbIgBARItChBwYXJhX2RhdHVtX3Zhbm'
    'FmGAQgASgJSANSDnBhcmFEYXR1bVZhbmFmiAEBEicKDXBhcmFfZGF0dW1fdG0YBSABKAlIBFIL'
    'cGFyYURhdHVtVG2IAQESMQoScGFyYW1fYWdlbmRhX2thbWVyGAYgASgFSAVSEHBhcmFtQWdlbm'
    'RhS2FtZXKIAQFCEQoPX2duX2FnZW5kYV9uYWFtQhQKEl9wYXJhbV92b29ybGV0dGVyc0IPCg1f'
    'cGFyYW1fYWFudGFsQhMKEV9wYXJhX2RhdHVtX3ZhbmFmQhAKDl9wYXJhX2RhdHVtX3RtQhUKE1'
    '9wYXJhbV9hZ2VuZGFfa2FtZXI=');

@$core.Deprecated('Use agendaAfspraakDescriptor instead')
const AgendaAfspraak$json = {
  '1': 'AgendaAfspraak',
  '2': [
    {'1': 'naam', '3': 1, '4': 1, '5': 9, '10': 'naam'},
    {'1': 'geslacht', '3': 2, '4': 1, '5': 9, '10': 'geslacht'},
    {'1': 'deb_nr', '3': 3, '4': 1, '5': 5, '9': 0, '10': 'debNr', '17': true},
    {
      '1': 'deb_cod',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'debCod',
      '17': true
    },
    {
      '1': 'agenda_datum_a',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'agendaDatumA',
      '17': true
    },
    {
      '1': 'agenda_tijd_begin',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'agendaTijdBegin',
      '17': true
    },
    {
      '1': 'agenda_tijd_eind',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'agendaTijdEind',
      '17': true
    },
    {
      '1': 'agenda_reden',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'agendaReden',
      '17': true
    },
    {
      '1': 'agenda_kamer',
      '3': 9,
      '4': 1,
      '5': 5,
      '9': 6,
      '10': 'agendaKamer',
      '17': true
    },
    {
      '1': 'f_agenda_id',
      '3': 10,
      '4': 1,
      '5': 5,
      '9': 7,
      '10': 'fAgendaId',
      '17': true
    },
    {
      '1': 'behandelaar',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 8,
      '10': 'behandelaar',
      '17': true
    },
    {
      '1': 'status',
      '3': 12,
      '4': 1,
      '5': 5,
      '9': 9,
      '10': 'status',
      '17': true
    },
    {
      '1': 'medewerker_nr',
      '3': 13,
      '4': 1,
      '5': 5,
      '9': 10,
      '10': 'medewerkerNr',
      '17': true
    },
    {
      '1': 'medewerker_voornaam',
      '3': 14,
      '4': 1,
      '5': 9,
      '9': 11,
      '10': 'medewerkerVoornaam',
      '17': true
    },
    {
      '1': 'medewerker_achternaam',
      '3': 15,
      '4': 1,
      '5': 9,
      '9': 12,
      '10': 'medewerkerAchternaam',
      '17': true
    },
    {
      '1': 'aantal_vervolg_afspraken',
      '3': 16,
      '4': 1,
      '5': 3,
      '9': 13,
      '10': 'aantalVervolgAfspraken',
      '17': true
    },
  ],
  '8': [
    {'1': '_deb_nr'},
    {'1': '_deb_cod'},
    {'1': '_agenda_datum_a'},
    {'1': '_agenda_tijd_begin'},
    {'1': '_agenda_tijd_eind'},
    {'1': '_agenda_reden'},
    {'1': '_agenda_kamer'},
    {'1': '_f_agenda_id'},
    {'1': '_behandelaar'},
    {'1': '_status'},
    {'1': '_medewerker_nr'},
    {'1': '_medewerker_voornaam'},
    {'1': '_medewerker_achternaam'},
    {'1': '_aantal_vervolg_afspraken'},
  ],
};

/// Descriptor for `AgendaAfspraak`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agendaAfspraakDescriptor = $convert.base64Decode(
    'Cg5BZ2VuZGFBZnNwcmFhaxISCgRuYWFtGAEgASgJUgRuYWFtEhoKCGdlc2xhY2h0GAIgASgJUg'
    'hnZXNsYWNodBIaCgZkZWJfbnIYAyABKAVIAFIFZGViTnKIAQESHAoHZGViX2NvZBgEIAEoCUgB'
    'UgZkZWJDb2SIAQESKQoOYWdlbmRhX2RhdHVtX2EYBSABKAlIAlIMYWdlbmRhRGF0dW1BiAEBEi'
    '8KEWFnZW5kYV90aWpkX2JlZ2luGAYgASgJSANSD2FnZW5kYVRpamRCZWdpbogBARItChBhZ2Vu'
    'ZGFfdGlqZF9laW5kGAcgASgJSARSDmFnZW5kYVRpamRFaW5kiAEBEiYKDGFnZW5kYV9yZWRlbh'
    'gIIAEoCUgFUgthZ2VuZGFSZWRlbogBARImCgxhZ2VuZGFfa2FtZXIYCSABKAVIBlILYWdlbmRh'
    'S2FtZXKIAQESIwoLZl9hZ2VuZGFfaWQYCiABKAVIB1IJZkFnZW5kYUlkiAEBEiUKC2JlaGFuZG'
    'VsYWFyGAsgASgJSAhSC2JlaGFuZGVsYWFyiAEBEhsKBnN0YXR1cxgMIAEoBUgJUgZzdGF0dXOI'
    'AQESKAoNbWVkZXdlcmtlcl9uchgNIAEoBUgKUgxtZWRld2Vya2VyTnKIAQESNAoTbWVkZXdlcm'
    'tlcl92b29ybmFhbRgOIAEoCUgLUhJtZWRld2Vya2VyVm9vcm5hYW2IAQESOAoVbWVkZXdlcmtl'
    'cl9hY2h0ZXJuYWFtGA8gASgJSAxSFG1lZGV3ZXJrZXJBY2h0ZXJuYWFtiAEBEj0KGGFhbnRhbF'
    '92ZXJ2b2xnX2Fmc3ByYWtlbhgQIAEoA0gNUhZhYW50YWxWZXJ2b2xnQWZzcHJha2VuiAEBQgkK'
    'B19kZWJfbnJCCgoIX2RlYl9jb2RCEQoPX2FnZW5kYV9kYXR1bV9hQhQKEl9hZ2VuZGFfdGlqZF'
    '9iZWdpbkITChFfYWdlbmRhX3RpamRfZWluZEIPCg1fYWdlbmRhX3JlZGVuQg8KDV9hZ2VuZGFf'
    'a2FtZXJCDgoMX2ZfYWdlbmRhX2lkQg4KDF9iZWhhbmRlbGFhckIJCgdfc3RhdHVzQhAKDl9tZW'
    'Rld2Vya2VyX25yQhYKFF9tZWRld2Vya2VyX3Zvb3JuYWFtQhgKFl9tZWRld2Vya2VyX2FjaHRl'
    'cm5hYW1CGwoZX2FhbnRhbF92ZXJ2b2xnX2Fmc3ByYWtlbg==');

@$core.Deprecated('Use agendaResponseDescriptor instead')
const AgendaResponse$json = {
  '1': 'AgendaResponse',
  '2': [
    {
      '1': 'afspraken',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.agenda.AgendaAfspraak',
      '10': 'afspraken'
    },
  ],
};

/// Descriptor for `AgendaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agendaResponseDescriptor = $convert.base64Decode(
    'Cg5BZ2VuZGFSZXNwb25zZRI0CglhZnNwcmFrZW4YASADKAsyFi5hZ2VuZGEuQWdlbmRhQWZzcH'
    'JhYWtSCWFmc3ByYWtlbg==');
