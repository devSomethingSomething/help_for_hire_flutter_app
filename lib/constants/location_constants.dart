/// Represents the location dropdown
/// button with the provinces
class LocationConstants {
  /// Constructor
  const LocationConstants._();

  /// Static list variable containing the nine provinces in South Africa
  /// Since these provinces don't change, it is easier to store them within
  /// the app instead of having to constantly read them from the web API
  static const provinces = [
    'Eastern Cape',
    'Free State',
    'Gauteng',
    'KwaZulu-Natal',
    'Limpopo',
    'Mpumalanga',
    'Northern Cape',
    'North West',
    'Western Cape',
  ];
}
