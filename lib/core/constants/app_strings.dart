import 'package:baridx_orderflow/core/constants/app_asssets.dart';

class AppStrings {
  /// Input Fields
  static const String firstName = "First Name";
  static const String enterFirstName = "Enter your first name";
  static const String secondName = "Second Name";
  static const String enterSecondName = "Enter your second name";
  static const String address = "Address";
  static const String enterAddress = "Enter your address";
  static const String phone = "Phone Number";
  static const String enterPhone = "Enter your phone number";

  /// General
  static const bool debugShowCheckedModeBanner = false;
  static const String appName = "BaridX OrderFlow";
  static const String welcomeMessage = "Welcome to BaridX OrderFlow!";
  static const String splashSubtitle =
      "Playio supports artists with tools to create, release, and measure music across a global stage.";
  static const String skip = "Skip";
  static const String next = "Next";
  /// list of splash screen data
  static const List<Map<String, String>> splashData = [
    {
      "title": "Welcome to",
      "image": AppAssets.headphones,
      "description": AppStrings.splashSubtitle,
    },
    {
      "title": "Listen to",
      "image": AppAssets.guitar,
      "description": AppStrings.splashSubtitle,
    },
    {
      "title": "Enjoy",
      "image": AppAssets.speaker,
      "description": AppStrings.splashSubtitle,
    },
  ];
  /// list of package types
  static const List<String> items = ["Small", "Medium", "Large"];

  /// Home Screen Strings
  static const String homeScreenTitle = "Welcome to BaridX";
  static const String homeScreenSubtitle =
      "Playio is your ultimate destination for premium musical instruments and accessories. "
      "Whether you're a seasoned artist or just starting your musical journey, we offer top-quality "
      "products at unbeatable prices. Explore, create, and elevate your sound. Enter your details "
      "to continue—you're one step closer to the perfect musical experience! 🎵✨";

  /// **Feature Cards**
  static const String discoverMusicTitle = "Discover New Music";
  static const String discoverMusicDescription =
      "Explore thousands of tracks from emerging artists worldwide.";
  static const String createPlaylistsTitle = "Create Playlists";
  static const String createPlaylistsDescription =
      "Customize your music experience with curated playlists.";
  static const String supportArtistsTitle = "Support Artists";
  static const String supportArtistsDescription =
      "Buy, stream, and share music to support your favorite creators.";
  static const String getStartedButton = "Get Started";
  static const String experienceMusicTitle =
      "Experience Music Like Never Before";

  /// Customer Info Step
  static const String enterCustomerDetails = "Customer Details";
  static const String nameHint = "Full Name";
  static const String phoneHint = "Phone Number";
  static const String addressHint = "Address";
  static const String infoScreenTitle = "Personal Details";
  static const String infoScreenSubTitle =
      "Enter your details to personalize your experience with BardiX. Your information helps us provide better recommendations and a seamless user journey.";

  /// Package Details Step
  static const String packageDetails = "Package Details";
  static const String packageType = "Package Type";
  static const String weightHint = "Weight (kg)";
  static const String deliveryNotesHint = "Delivery Notes (Optional)";
  static const String packageDetailsTitle = "Package Details";
  static const String packageDetailsSubtitle =
      "Provide details about your package to ensure accurate delivery.";
  static const String packageTypeLabel = "Package Type";
  static const String packageTypeHint = "Select Package Type";
  static const String packageWeightLabel = "Weight (kg)";
  static const String packageWeightHint = "Enter weight in kg";
  static const String deliveryNotesLabel = "Delivery Notes";
  static const String nextButton = "Next";

  /// Payment Step
  static const String paymentMethod = "Select Payment Method";
  static const String creditCard = "Credit Card";
  static const String creditCardTitle = "Pay with Credit Card";
  static const String creditCardDescription =
      "Securely complete your transaction using your credit or debit card. "
      "We ensure your payment details are protected with industry-standard encryption. "
      "Simply enter your card number and proceed to the next step. "
      "Your information remains confidential and is never stored.";
  static const String cashOnDelivery = "Cash on Delivery";
  static const String payLater = "Pay Later";
  static const String enterCardNumber = "Enter Card Number";
  static const String enterPhoneForPayLater = "Enter Phone Number";
  static const String cardNumber = "Credit Card";
  static const String greetingCOD = "Thank you!";
  static const String cashOnDeliveryNote =
      "Please ensure you have the correct amount ready when your package arrives.\n"
      "Our delivery agent will only accept cash payments—no card or digital transactions.\n"
      "Make sure someone is available at the provided address to receive the order.\n"
      "Any cancellation or non-acceptance may affect your future COD orders.\n\n"
      "If you have any questions, feel free to contact our support team. Happy Shopping! 🎶";
  // On Delivery
  static const String onDeliveryTitle = "On Delivered";
  // Go Back
  static const String goBack = "Go Back";
  /// Review & Submit
  static const String reviewOrder = "Review & Submit";
  static const String customerDetails = "Customer Details";

  static const String selectedPaymentMethod = "Selected Payment Method";
  static const String name = "Name";

  static const String weight = "Weight";
  static const String deliveryNotes = "Delivery Notes";
  static const String submitOrder = "Submit Order";
  static const String processingOrder = "Processing Order...";
  static const String orderSubmitted = "Order Successfully Submitted!";
  static const String reviewOrderSubtitle =
      "Please review your order details carefully before submission. Ensure that all information is correct. Once submitted, your order will be processed immediately.";
  static const String orderSuccessTitle = "Congratulations!";
  static const String orderSuccessMessage = "Your order has been successfully placed. You will receive updates regarding your delivery.";
  static const String ok = "OK";

}
