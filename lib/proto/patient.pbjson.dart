// This is a generated file - do not edit.
//
// Generated from patient.proto.

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

@$core.Deprecated('Use patientRequestDescriptor instead')
const PatientRequest$json = {
  '1': 'PatientRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `PatientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientRequestDescriptor =
    $convert.base64Decode('Cg5QYXRpZW50UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use createPatientRequestDescriptor instead')
const CreatePatientRequest$json = {
  '1': 'CreatePatientRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'naam', '3': 2, '4': 1, '5': 9, '10': 'naam'},
    {
      '1': 'leeftijd',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'leeftijd',
      '17': true
    },
  ],
  '8': [
    {'1': '_leeftijd'},
  ],
};

/// Descriptor for `CreatePatientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPatientRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQYXRpZW50UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSEgoEbmFhbRgCIAEoCVIEbm'
    'FhbRIfCghsZWVmdGlqZBgDIAEoBUgAUghsZWVmdGlqZIgBAUILCglfbGVlZnRpamQ=');

@$core.Deprecated('Use patientResponseDescriptor instead')
const PatientResponse$json = {
  '1': 'PatientResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'naam', '3': 2, '4': 1, '5': 9, '10': 'naam'},
    {
      '1': 'leeftijd',
      '3': 3,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'leeftijd',
      '17': true
    },
  ],
  '8': [
    {'1': '_leeftijd'},
  ],
};

/// Descriptor for `PatientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patientResponseDescriptor = $convert.base64Decode(
    'Cg9QYXRpZW50UmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhIKBG5hYW0YAiABKAlSBG5hYW0SHw'
    'oIbGVlZnRpamQYAyABKAVIAFIIbGVlZnRpamSIAQFCCwoJX2xlZWZ0aWpk');
