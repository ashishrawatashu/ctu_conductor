abstract class TripStopApi{
  Future<dynamic> tripStotApi(
      String tripCode,
      String empCode,
      String closingKM,
      String amountFare,
      String amountToll,
      String amountParking,
      String amountOther,
      String receiptNo,
      String imei,
      String token);
}