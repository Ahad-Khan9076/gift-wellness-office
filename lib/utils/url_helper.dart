import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $url');
  }
}

Future<void> openEmail(String email) => openExternalUrl('mailto:$email');

Future<void> openWhatsApp(String phoneE164) =>
    openExternalUrl('https://wa.me/$phoneE164');
