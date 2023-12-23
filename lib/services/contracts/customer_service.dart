import 'package:amaga/models/api_data_reponse.dart';
import 'package:amaga/models/customer.dart';

abstract class CustomerService {
  Future<ApiDataResponse<List<Customer>>> getCustomers(String token);
}
