import 'package:ecommerce_app/features/shopping%20address/models/address.dart';

class AddressRepository {
  List<Address> getAddress() {

    return const [
      Address(
        id: '1',
        label: 'Home', 
        fullAddress: '5 Racecourse, Nakuru', 
        city: 'Nakuru City', 
        county: 'Nakuru', 
        zipcode: '20100',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        label: 'Office', 
        fullAddress: '554 Mawanga, Nakuru', 
        city: 'Nakuru City', 
        county: 'Nakuru', 
        zipcode: '20100',
        isDefault: false,
        type: AddressType.office,
      )
    ];
  }

  Address? getDefaultAddress() {
    return getAddress().firstWhere(
      (address)=> address.isDefault,
      orElse: () => getAddress().first,
    );
  }
}