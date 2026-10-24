import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../utils/responsive.dart';
import '../../utils/url_helper.dart';
import '../common/section_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  /// Update with official Wellness Office contact details.
  static const _whatsappNumber = '923001234567';
  static const _email = 'wellness@gift.edu.pk';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;

    return SectionShell(
      sectionKey: sectionKey,
      backgroundColor: AppColors.backgroundSoft,
      paddingVertical: 80,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Text(
              'We’re here when you’re ready',
              style: AppTypography.sourceSans(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryBlue,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Ready to Take the First Step?',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(
              'You don’t have to face this alone. Everything is confidential.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 40),
          if (isMobile) ...[
            _ContactPanel(onBook: () => _showBookingDialog(context)),
            const SizedBox(height: 20),
            _MessagePanel(onSubmit: () => _showBookingDialog(context)),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _ContactPanel(
                    onBook: () => _showBookingDialog(context),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _MessagePanel(
                    onSubmit: () => _showBookingDialog(context),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 28),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.accentOrange.withValues(alpha: 0.35),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentOrange.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.heroOrangeTint,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.accentOrange,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    'If you are in immediate crisis, please contact emergency services or a trusted person. You deserve help right now.',
                    style: AppTypography.sourceSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.headingNavy,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Thank you for reaching out'),
        content: const Text(
          'This demo form will connect to your booking system. For now, please use WhatsApp or email. Our team will respond confidentially.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              openWhatsApp(_whatsappNumber);
            },
            child: const Text('WhatsApp Us'),
          ),
        ],
      ),
    );
  }
}

class _ContactPanel extends StatelessWidget {
  const _ContactPanel({required this.onBook});

  final VoidCallback onBook;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _PanelShell(
      accent: AppColors.primaryBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Get in touch', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Reach us directly. We respond with care and discretion.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          _ContactTile(
            icon: Icons.chat_rounded,
            label: 'WhatsApp',
            value: '+92 300 1234567',
            onTap: () => openWhatsApp(ContactSection._whatsappNumber),
            accent: const Color(0xFF25D366),
          ),
          const SizedBox(height: 12),
          _ContactTile(
            icon: Icons.email_outlined,
            label: 'Email',
            value: ContactSection._email,
            onTap: () => openEmail(ContactSection._email),
            accent: AppColors.primaryBlue,
          ),
          const SizedBox(height: 12),
          _ContactTile(
            icon: Icons.place_outlined,
            label: 'Location',
            value: 'GIFT University, Gujranwala',
            onTap: () {},
            accent: AppColors.accentOrange,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onBook,
              icon: const Icon(Icons.calendar_month_rounded, size: 20),
              label: const Text('Request an Appointment'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessagePanel extends StatelessWidget {
  const _MessagePanel({required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _PanelShell(
      accent: AppColors.accentOrange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Quick message', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Share your name and preferred contact. We’ll reach out privately to schedule your session.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          TextField(
            decoration: _fieldDecoration('Your name'),
          ),
          const SizedBox(height: 14),
          TextField(
            decoration: _fieldDecoration('Email or phone'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 22),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: onSubmit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              child: const Text('Send message'),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _fieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: AppColors.backgroundSoft,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.cardBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.cardBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
      ),
      floatingLabelStyle: AppTypography.sourceSans(
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlue,
      ),
    );
  }
}

class _PanelShell extends StatelessWidget {
  const _PanelShell({
    required this.child,
    required this.accent,
  });

  final Widget child;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 4, color: accent),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatefulWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    required this.accent,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  final Color accent;

  @override
  State<_ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<_ContactTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Material(
        color: _hovered ? AppColors.backgroundSoft : AppColors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _hovered
                    ? widget.accent.withValues(alpha: 0.35)
                    : AppColors.cardBorder,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(widget.icon, color: widget.accent, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: AppTypography.sourceSans(
                          fontSize: 13,
                          color: AppColors.bodyGray,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.value,
                        style: AppTypography.sourceSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.headingNavy,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: _hovered ? widget.accent : AppColors.bodyGray,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
