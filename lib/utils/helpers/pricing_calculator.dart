class UPricingCalculator {
  /// -- Calculate Total Price --
  /// This method calculates the final amount the user has to pay.
  /// It adds the Subtotal + Tax Amount + Shipping Cost.
  static double calculateTotalPrice(double subTotal, String location) {
    // 1. Get the tax rate (e.g., 0.10 for 10%) based on the location
    double taxRate = getTaxRateForLocation(location);

    // 2. Calculate the actual tax amount (e.g., 100 * 0.10 = 10)
    double taxAmount = subTotal * taxRate;

    // 3. Get the shipping cost based on the location
    double shippingCost = getShippingCost(location);

    // 4. Sum everything together to get the final total
    double totalPrice = subTotal + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate Shipping Cost (String) --
  /// Returns the shipping cost formatted as a String (e.g., "20.00")
  /// for display in the UI text widgets.
  static String calculateShippingCost(double subTotal, String location) {
    double shippingCost = getShippingCost(location);
    // Convert double to string with 2 decimal places
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate Tax (String) --
  /// Returns the calculated tax amount formatted as a String (e.g., "10.00")
  /// for display in the UI text widgets.
  static String calculateTax(double subTotal, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;
    // Convert double to string with 2 decimal places
    return taxAmount.toStringAsFixed(2);
  }

  /// -- Get Tax Rate --
  /// Returns the tax percentage as a decimal.
  /// Currently hardcoded to 10% (0.10) for all locations.
  /// You can update logic here later to handle different states/countries.
  static double getTaxRateForLocation(String location) {
    return 0.10; // 10% Tax Rate
  }

  /// -- Get Shipping Cost --
  /// Returns the shipping fee as a double.
  /// Currently hardcoded to 20.00 for all locations.
  static double getShippingCost(String location) {
    return 20.00; // Flat Rate Shipping of $20
  }

  /// -- Calculate Percentage Discount --
  /// Reduces the total price by a specific percentage (e.g., 20% off).
  /// Formula: Price - ((Price * %)/100)
  static double calculatePercentageDiscount(
    double totalPrice,
    double discount,
  ) {
    double discountPrice = (totalPrice * discount) / 100;
    return totalPrice - discountPrice;
  }

  /// -- Calculate Fixed Discount --
  /// Reduces the total price by a fixed currency amount (e.g., $10 off).
  /// Formula: Price - Discount Amount
  static double calculateFixedDiscount(double totalPrice, double discount) {
    return totalPrice - discount;
  }
}
