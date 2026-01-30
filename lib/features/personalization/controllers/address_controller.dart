import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_store/common/widgets/loaders/circular_loader.dart';
import 'package:safar_store/common/widgets/texts/section_heading.dart';
import 'package:safar_store/data/repositories/address/address_repository.dart';
import 'package:safar_store/features/personalization/models/address_model.dart';
import 'package:safar_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:safar_store/utils/constants/sizes.dart';
import 'package:safar_store/utils/helpers/cloud_helper_function.dart';
import 'package:safar_store/utils/helpers/network_manager.dart';
import 'package:safar_store/utils/popups/full_screen_loader.dart';
import 'package:safar_store/utils/popups/snackbar_helpers.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// Variables
  final _repository = Get.put(AddressRepository());
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = false.obs;

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  /// Function to add new address of the user
  Future<void> addNewAddress() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Storing Address...');

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Create Address Model
      AddressModel address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        postalCode: postalCode.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
        dateTime: DateTime.now(),
      );

      // save Address
      String addressId = await _repository.addAddress(address);

      // Update Address id
      address.id = addressId;

      // Update selected address
      selectAddress(address);

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Refresh Addresses Data
      refreshData.toggle();

      //Show success message
      USnackBarHelpers.successSnackBar(
        title: 'Congratulation',
        message: 'Your address has been saved successfully!',
      );

      // Reset Fields
      resetFormFields();

      // Go Back
      Navigator.pop(Get.context!);
      Navigator.pop(Get.context!);
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }

  /// Function to get all address of specific user
  Future<List<AddressModel>> getAllAddresses() async {
    try {
      List<AddressModel> addresses = await _repository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (address) => address.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
      return [];
    }
  }

  // Function to select address
  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Start Loading
      Get.defaultDialog(
        title: '',
        onWillPop: () async => false,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: UCircularLoader(),
      );

      // Un-Select the already selected address
      if (selectedAddress.value.id.isNotEmpty) {
        await _repository.updateSelectedField(selectedAddress.value.id, false);
      }

      // assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the selected address to true in the firebase
      await _repository.updateSelectedField(selectedAddress.value.id, true);

      // Go Back
      Get.back();
    } catch (e) {
      Get.back();
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }

  // Function to show bottom sheet to select address
  Future<void> selectNewAddressBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(USizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(title: 'Select Address', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),
              FutureBuilder(
                future: getAllAddresses(),
                builder: (context, snapshot) {
                  // Handle Error, Loading, Empty States
                  final widget = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                  );
                  if (widget != null) return widget;

                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: USizes.spaceBtwItems),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => USingleAddress(
                      address: snapshot.data![index],
                      onTap: () {
                        selectedAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to reset all fields of the form
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();

    addressFormKey.currentState!.reset();
  }
}
