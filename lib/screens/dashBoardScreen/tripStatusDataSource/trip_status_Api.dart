abstract class TripStatusApi{
  Future<dynamic> tripStatusApi(
      String tripCode,
      String empCode,
      String imei,
      String token);
}
