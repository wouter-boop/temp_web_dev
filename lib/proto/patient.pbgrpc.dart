// This is a generated file - do not edit.
//
// Generated from patient.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'patient.pb.dart' as $0;

export 'patient.pb.dart';

@$pb.GrpcServiceName('odontium.PatientService')
class PatientServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PatientServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.PatientResponse> getPatient(
    $0.PatientRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPatient, request, options: options);
  }

  $grpc.ResponseFuture<$0.PatientResponse> createPatient(
    $0.CreatePatientRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createPatient, request, options: options);
  }

  // method descriptors

  static final _$getPatient =
      $grpc.ClientMethod<$0.PatientRequest, $0.PatientResponse>(
          '/odontium.PatientService/getPatient',
          ($0.PatientRequest value) => value.writeToBuffer(),
          $0.PatientResponse.fromBuffer);
  static final _$createPatient =
      $grpc.ClientMethod<$0.CreatePatientRequest, $0.PatientResponse>(
          '/odontium.PatientService/createPatient',
          ($0.CreatePatientRequest value) => value.writeToBuffer(),
          $0.PatientResponse.fromBuffer);
}

@$pb.GrpcServiceName('odontium.PatientService')
abstract class PatientServiceBase extends $grpc.Service {
  $core.String get $name => 'odontium.PatientService';

  PatientServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PatientRequest, $0.PatientResponse>(
        'getPatient',
        getPatient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PatientRequest.fromBuffer(value),
        ($0.PatientResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreatePatientRequest, $0.PatientResponse>(
        'createPatient',
        createPatient_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreatePatientRequest.fromBuffer(value),
        ($0.PatientResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PatientResponse> getPatient_Pre($grpc.ServiceCall $call,
      $async.Future<$0.PatientRequest> $request) async {
    return getPatient($call, await $request);
  }

  $async.Future<$0.PatientResponse> getPatient(
      $grpc.ServiceCall call, $0.PatientRequest request);

  $async.Future<$0.PatientResponse> createPatient_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreatePatientRequest> $request) async {
    return createPatient($call, await $request);
  }

  $async.Future<$0.PatientResponse> createPatient(
      $grpc.ServiceCall call, $0.CreatePatientRequest request);
}
