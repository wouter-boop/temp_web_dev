// This is a generated file - do not edit.
//
// Generated from agenda.proto.

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

import 'agenda.pb.dart' as $0;

export 'agenda.pb.dart';

@$pb.GrpcServiceName('agenda.AgendaService')
class AgendaServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AgendaServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AgendaResponse> getAgendaAfspraken(
    $0.AgendaRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAgendaAfspraken, request, options: options);
  }

  $grpc.ResponseFuture<$0.AgendaResponse> getAgendaAfsprakenCached(
    $0.AgendaRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAgendaAfsprakenCached, request,
        options: options);
  }

  // method descriptors

  static final _$getAgendaAfspraken =
      $grpc.ClientMethod<$0.AgendaRequest, $0.AgendaResponse>(
          '/agenda.AgendaService/GetAgendaAfspraken',
          ($0.AgendaRequest value) => value.writeToBuffer(),
          $0.AgendaResponse.fromBuffer);
  static final _$getAgendaAfsprakenCached =
      $grpc.ClientMethod<$0.AgendaRequest, $0.AgendaResponse>(
          '/agenda.AgendaService/GetAgendaAfsprakenCached',
          ($0.AgendaRequest value) => value.writeToBuffer(),
          $0.AgendaResponse.fromBuffer);
}

@$pb.GrpcServiceName('agenda.AgendaService')
abstract class AgendaServiceBase extends $grpc.Service {
  $core.String get $name => 'agenda.AgendaService';

  AgendaServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AgendaRequest, $0.AgendaResponse>(
        'GetAgendaAfspraken',
        getAgendaAfspraken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AgendaRequest.fromBuffer(value),
        ($0.AgendaResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AgendaRequest, $0.AgendaResponse>(
        'GetAgendaAfsprakenCached',
        getAgendaAfsprakenCached_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AgendaRequest.fromBuffer(value),
        ($0.AgendaResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AgendaResponse> getAgendaAfspraken_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AgendaRequest> $request) async {
    return getAgendaAfspraken($call, await $request);
  }

  $async.Future<$0.AgendaResponse> getAgendaAfspraken(
      $grpc.ServiceCall call, $0.AgendaRequest request);

  $async.Future<$0.AgendaResponse> getAgendaAfsprakenCached_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AgendaRequest> $request) async {
    return getAgendaAfsprakenCached($call, await $request);
  }

  $async.Future<$0.AgendaResponse> getAgendaAfsprakenCached(
      $grpc.ServiceCall call, $0.AgendaRequest request);
}
