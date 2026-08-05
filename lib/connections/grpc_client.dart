import 'package:grpc/grpc.dart';
import '../proto/agenda.pbgrpc.dart';

class AgendaGrpcClient {
  static AgendaGrpcClient? _instance;

  late final ClientChannel _channel;
  late final AgendaServiceClient _stub;

  AgendaGrpcClient._internal({
    required String host,
    int port = 50051,
    bool useTls = false,
  }) {
    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: useTls
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
        // Keeps TCP connection alive in the background
        keepAlive: const ClientKeepAliveOptions(
          pingInterval: Duration(seconds: 30),
          timeout: Duration(seconds: 10),
          permitWithoutCalls: true,
        ),
      ),
    );

    _stub = AgendaServiceClient(_channel);
  }

  static AgendaGrpcClient init({
    required String host,
    int port = 50051,
    bool useTls = false,
  }) {
    _instance ??= AgendaGrpcClient._internal(
      host: host,
      port: port,
      useTls: useTls,
    );
    return _instance!;
  }

  static AgendaGrpcClient get instance {
    if (_instance == null) {
      throw StateError(
        'AgendaGrpcClient.init(...)',
      );
    }
    return _instance!;
  }


  Future<void> warmUpConnection() async {
    try {
      await getAgendaAfspraken(paramAantal: 0).timeout(
        const Duration(seconds: 2),
      );
    } catch (_) {
    }
  }

  Future<List<AgendaAfspraak>> getAgendaAfspraken({
    int? gnAgendaNaam,
    int? paramVoorletters,
    int? paramAantal,
    String? paraDatumVanaf,
    String? paraDatumTm,
    int? paramAgendaKamer,
  }) async {
    final request = AgendaRequest();

    if (gnAgendaNaam != null) request.gnAgendaNaam = gnAgendaNaam;
    if (paramVoorletters != null) request.paramVoorletters = paramVoorletters;
    if (paramAantal != null) request.paramAantal = paramAantal;
    if (paraDatumVanaf != null) request.paraDatumVanaf = paraDatumVanaf;
    if (paraDatumTm != null) request.paraDatumTm = paraDatumTm;
    if (paramAgendaKamer != null) request.paramAgendaKamer = paramAgendaKamer;

    try {
      final response = await _stub.getAgendaAfspraken(
        request,
        options: CallOptions(timeout: const Duration(seconds: 10)),
      );

      return response.afspraken;
    } on GrpcError catch (e) {
      print('gRPC Error [${e.codeName}]: ${e.message}');
      rethrow;
    } catch (e) {
      print('Error agenda: $e');
      rethrow;
    }
  }

  static Future<void> dispose() async {
    await _instance?._channel.shutdown();
    _instance = null;
  }
}