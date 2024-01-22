import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class CountryPickerUtils {
  void pickCountry(BuildContext context, VoidCallback setStateCallback, Function(Country) onSelect) async {
     showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              flagSize: 25,
                              backgroundColor: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.borderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.secondaryColor,
                                      width: 2.0),
                                ),
                              ),
                            ),
                            favorite: ['NP'],
                            showPhoneCode: false,
                            onSelect: onSelect
                            );
      
  }
}
