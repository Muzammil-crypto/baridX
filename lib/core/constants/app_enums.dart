/// Defines different types of screen transitions used in the app.
enum TransitionType {
  fade,  // Fades between screens smoothly.
  slide, // Slides in from the side.
  scale  // Scales in from a smaller size.
}

/// Represents available payment methods in the order process.
enum PaymentMethod {
  creditCard,     // Requires entering card details.
  cashOnDelivery, // No additional input required.
  payLater,       // Requires entering a phone number.
  goBack          // Navigates back in the flow.
}

/// Tracks the order processing state.
enum OrderStatus {
  idle,    // No ongoing operation.
  loading, // Order submission is in progress.
  success, // Order submission was successful.
  failure  // Order submission failed.
}

/// Defines different layout types used in the app.
enum AppLayoutType {
  standard, // Default layout with a back button.
  noBack    // Layout without a back button (e.g., splash screen).
}
