/// This class will be used by the service classes
class DomainConstants {
  /// Constructor
  const DomainConstants._();

  /// Static variables
  ///
  /// Each group member needs to paste their own ip address in the ip variable
  /// in order to test the app alongside the web API
  static const ip = 'Paste IP here';

  /// Email suffix used in the Firebase authentication system
  static const emailSuffix = '@helpforhire.com';

  /// The prefix used by phone numbers in South Africa
  static const phoneNumberPrefix = '+27';
}
