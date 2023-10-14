// ignore_for_file: file_names

abstract class IVtuService {
  Future payAirtime(String network, amount, number);
  Future payData(String network, plan, number, planName);
  Future getDataValues(String network);
  //Cable services
  Future<String> validateCable(String account, service, planId, int months);
  Future listCable(String account, service, planId, customerName);
  Future payCable(String account, service, planId, customerName);
  //Internet services
  Future<String> internetValidate(
    String account,
    type,
  );
  Future<int?> listOfBundles(
    String account,
    type,
  );
  Future payInternet(
    String account,
    type,
  );
  //Education
  Future getEpin();
  Future rechargeEpin(String id, ref, int qty);
  Future retrieveEpin(String transId);

  //Electricity
  Future validateElectricity(String meterNumber, meterType, amount, service);
  Future payElectricity(String meterNumber, meterType, amount, service,
      productCode, info, customerName);

  //Fund betting
  Future getBets();
  Future validateBet(String betId, customerId);
  Future payBet(String betId, customerId, amount, customerName);

  //Get Transport
  Future getTransport();
}
