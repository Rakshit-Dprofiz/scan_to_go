import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrivacySection(title: "1. Privacy Policy"),
            PrivacySection(title: "1.1 Data Collection & Usage", content: '''
Trolleze collects and processes personal data to enhance the smart shopping experience. The following information may be collected:

Personal Information:
- Full Name
- Email Address
- Mobile Number
- Payment Details (processed through secure gateways)

Shopping Data:
- Items added to the cart
- Shopping history and preferences
- Loyalty points or discounts used

Location Data:
- To identify nearby partner supermarkets
- To enhance real-time cart tracking and checkout
- Users can disable location access, but some features may be limited

Usage Data:
- App activity logs, including login times and session duration
- Device information (e.g., model, OS, IP address) for analytics

Trolleze does not sell user data to third parties. The collected data is strictly used for:
- Enhancing user experience
- Personalizing offers and discounts
- Preventing fraud and ensuring security
            '''),
            PrivacySection(title: "1.2 Data Security", content: '''
We prioritize data security and use end-to-end encryption for:
- Payment transactions
- Personal information stored on our servers

Trolleze employs secure authentication methods to protect user accounts, including:
- OTP verification
- Biometric authentication (if enabled by the user)

Third-Party Services:
- Payment processing is handled by PCI DSS-compliant gateways.
- User data is never shared without explicit consent, except when required by law.
            '''),
            PrivacySection(title: "1.3 User Rights", content: '''
Users have the following rights regarding their data:
- **Access**: Users can request a copy of their personal data stored by Trolleze.
- **Correction**: Users can update incorrect or incomplete personal information.
- **Deletion**: Users can request account deletion, which will remove all stored data except required transaction records.
- **Opt-out**: Users can opt out of promotional emails and push notifications.

To exercise these rights, users can contact support@smapca.com.
            '''),
            PrivacySection(title: "2. Terms of Service"),
            PrivacySection(title: "2.1 Account Registration", content: '''
- Users must be at least 18 years old to register an account.
- Registration requires a valid mobile number and email address.
- Users are responsible for maintaining the confidentiality of their account credentials.
            '''),
            PrivacySection(title: "2.2 Shopping & Payments", content: '''
- Users can scan and add items to the Trolleze smart cart.
- Payment is completed through the app using UPI, credit/debit cards, or digital wallets.
- Once a payment is processed, it cannot be reversed unless eligible under the refund policy.
            '''),
            PrivacySection(title: "3. Refund & Cancellation Policy"),
            PrivacySection(title: "3.1 Refund Policy", content: '''
- Refunds are processed by the supermarket as per their return policy.
- Refunds for faulty or incorrect items must be requested within 48 hours of purchase.
- Refunds are credited within 5-7 business days via the original payment method.
            '''),
            PrivacySection(title: "4. Security & Fraud Prevention"),
            PrivacySection(title: "4.1 Security Measures", content: '''
Trolleze takes the following security steps:
- End-to-end encryption for transactions
- Multi-layer authentication to prevent unauthorized access
- AI-based fraud detection to monitor suspicious activities
            '''),
            PrivacySection(title: "5. Liability & Disclaimers"),
            PrivacySection(title: "5.1 Limited Liability", content: '''
Trolleze is a payment facilitator and does not control:
- Pricing of products in supermarkets
- Availability of items in stores
- Refund or return policies of supermarkets

Trolleze will not be liable for:
- Pricing errors at supermarkets
- Loss or theft of purchased items after checkout
- Service unavailability due to technical issues
            '''),
            PrivacySection(title: "6. Contact & Support", content: '''
For any issues or inquiries, users can reach out via:
📧 Email: info.smapca@gmail.com
📞 Phone: +91 9016235324
💬 Live Chat: Available within the app

Customer support is available Monday-Saturday (9 AM - 7 PM IST).
            '''),
          ],
        ),
      ),
    );
  }
}

class PrivacySection extends StatelessWidget {
  final String title;
  final String? content;

  const PrivacySection({required this.title, this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        if (content != null) ...[
          SizedBox(height: 10.0),
          Text(
            content!,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ],
    );
  }
}
