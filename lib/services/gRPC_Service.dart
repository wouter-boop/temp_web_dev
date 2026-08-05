import 'package:grpc/grpc.dart';
// For defaultTargetPlatform

import '../proto/patient.pbgrpc.dart';

class PatientGrpcService {
  late ClientChannel _channel;
  late PatientServiceClient _client;

  PatientGrpcService() {
    String host = 'localhost';

    _channel = ClientChannel(
      host,
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _client = PatientServiceClient(_channel);
  }

  Future<PatientResponse> createPatient({
    required String id,
    required String naam,
    int? leeftijd,
  }) async {
    final request = CreatePatientRequest()
      ..id = id
      ..naam = naam;

    if (leeftijd != null) {
      request.leeftijd = leeftijd;
    }
    return await _client.createPatient(request);
  }

  Future<PatientResponse> getPatient(String id) async {
    final request = PatientRequest()..id = id;
    return await _client.getPatient(request);
  }

  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}
