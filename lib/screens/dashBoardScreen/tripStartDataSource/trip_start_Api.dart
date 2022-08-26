abstract class TripStartApi{
  Future<dynamic> tripStartApi(
      String tripCode,
      String empCode,
      String plateformeNo,
      String openingKM,
      String imei,
      String token);
}