import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../utils/responsive.dart';
import '../../utils/landing_section_id.dart';
import '../common/gift_logo.dart';

class WellnessNavBar extends StatelessWidget implements PreferredSizeWidget {
  const WellnessNavBar({
    super.key,
    required this.onNavigate,
    required this.onBookSession,
    this.isGiftHealsPage = false,
  });

  final void Function(String sectionId) onNavigate;
  final VoidCallback onBookSession;
  final bool isGiftHealsPage;

  static const _items = [
    ('About', LandingSectionId.about),
    ('Therapists', LandingSectionId.therapists),
    ('Testimonials', LandingSectionId.testimonials),
    ('Contact', LandingSectionId.contact),
  ];

  @override
  Size get preferredSize => const Size.fromHeight(88);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sectionHorizontalPadding,
          vertical: 12,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
            child: _PillShell(
              child: Row(
                children: [
                  InkWell(
                    onTap: () => AppRoutes.openHome(context),
                    borderRadius: BorderRadius.circular(12),
                    child: const GiftLogo(height: 34),
                  ),
                  const Spacer(),
                  if (context.showDesktopNav) ...[
                    _NavLinkPillGroup(
                      items: _items,
                      onNavigate: onNavigate,
                    ),
                    const SizedBox(width: 10),
                    _GiftHealsNavPill(active: isGiftHealsPage),
                    const SizedBox(width: 12),
                    _BookPillButton(onPressed: onBookSession),
                  ] else ...[
                    _GiftHealsNavPill(active: isGiftHealsPage, compact: true),
                    const SizedBox(width: 8),
                    _IconPillButton(
                      icon: Icons.menu_rounded,
                      onPressed: () => _openMobileMenu(context),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.cardBorder,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _GiftHealsNavPill(active: isGiftHealsPage, expand: true),
              const SizedBox(height: 12),
              for (final item in _items)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _PillShell(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      title: Text(item.$1),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                      onTap: () {
                        Navigator.pop(ctx);
                        onNavigate(item.$2);
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              _BookPillButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  onBookSession();
                },
                expand: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GiftHealsNavPill extends StatefulWidget {
  const _GiftHealsNavPill({
    required this.active,
    this.compact = false,
    this.expand = false,
  });

  final bool active;
  final bool compact;
  final bool expand;

  @override
  State<_GiftHealsNavPill> createState() => _GiftHealsNavPillState();
}

class _GiftHealsNavPillState extends State<_GiftHealsNavPill> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.active
        ? AppColors.calmingGreen
        : (_hovered
            ? AppColors.calmingGreen.withValues(alpha: 0.15)
            : AppColors.calmingGreen.withValues(alpha: 0.1));
    final fg = widget.active ? Colors.white : AppColors.calmingGreen;

    final pill = MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: () => AppRoutes.openGiftHeals(context),
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.compact ? 14 : 18,
              vertical: widget.compact ? 10 : 12,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.healing_rounded, size: 18, color: fg),
                const SizedBox(width: 8),
                Text(
                  'GIFT Heals',
                  style: AppTypography.sourceSans(
                    fontSize: widget.compact ? 13 : 14,
                    fontWeight: FontWeight.w600,
                    color: fg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (widget.expand) return SizedBox(width: double.infinity, child: pill);
    return pill;
  }
}

/// Outer floating pill container for the header.
class _PillShell extends StatelessWidget {
  const _PillShell({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.9)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.08),
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: AppColors.headingNavy.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class _NavLinkPillGroup extends StatelessWidget {
  const _NavLinkPillGroup({
    required this.items,
    required this.onNavigate,
  });

  final List<(String, String)> items;
  final void Function(String sectionId) onNavigate;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundSoft,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < items.length; i++) ...[
              _NavLinkPill(
                label: items[i].$1,
                onTap: () => onNavigate(items[i].$2),
              ),
              if (i < items.length - 1) const SizedBox(width: 2),
            ],
          ],
        ),
      ),
    );
  }
}

class _NavLinkPill extends StatefulWidget {
  const _NavLinkPill({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLinkPill> createState() => _NavLinkPillState();
}

class _NavLinkPillState extends State<_NavLinkPill> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Material(
        color: _hovered ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(999),
          hoverColor: AppColors.white,
          splashColor: AppColors.primaryBlue.withValues(alpha: 0.08),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Text(
              widget.label,
              style: AppTypography.sourceSans(
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: _hovered ? AppColors.primaryBlue : AppColors.headingNavy,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BookPillButton extends StatelessWidget {
  const _BookPillButton({required this.onPressed, this.expand = false});

  final VoidCallback onPressed;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final button = Material(
      color: AppColors.accentOrange,
      borderRadius: BorderRadius.circular(999),
      elevation: 0,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(999),
        hoverColor: AppColors.accentOrange.withValues(alpha: 0.88),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Text(
            'Book a Session',
            style: AppTypography.sourceSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );

    if (expand) return SizedBox(width: double.infinity, child: button);
    return button;
  }
}

class _IconPillButton extends StatelessWidget {
  const _IconPillButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundSoft,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: AppColors.primaryBlue, size: 22),
        ),
      ),
    );
  }
}
