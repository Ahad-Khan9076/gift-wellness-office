import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/responsive.dart';

/// One step in a “How it works” style flow (icon card + badge + text).
class FlowStepItem {
  const FlowStepItem({
    required this.step,
    required this.icon,
    required this.title,
    required this.description,
  });

  final int step;
  final IconData icon;
  final String title;
  final String description;
}

/// Fixed grid/wrap flow — no horizontal scrolling.
class StaticFlowSteps extends StatelessWidget {
  const StaticFlowSteps({super.key, required this.steps});

  final List<FlowStepItem> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (context.isMobile) {
      return Column(
        children: [
          for (var i = 0; i < steps.length; i++) ...[
            FlowStepVisual(
              step: steps[i].step,
              icon: steps[i].icon,
              title: steps[i].title,
              description: steps[i].description,
              theme: theme,
            ),
            if (i < steps.length - 1)
              Icon(
                Icons.arrow_downward_rounded,
                color: AppColors.primaryBlue.withValues(alpha: 0.35),
              ),
          ],
        ],
      );
    }

    final columns = context.isTablet ? 2 : 4;
    final rows = <List<FlowStepItem>>[];
    for (var i = 0; i < steps.length; i += columns) {
      final end = i + columns > steps.length ? steps.length : i + columns;
      rows.add(steps.sublist(i, end));
    }

    return Column(
      children: [
        for (var r = 0; r < rows.length; r++) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var c = 0; c < columns; c++) ...[
                if (c > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.primaryBlue.withValues(alpha: 0.35),
                      size: 20,
                    ),
                  ),
                Expanded(
                  child: c < rows[r].length
                      ? FlowStepVisual(
                          step: rows[r][c].step,
                          icon: rows[r][c].icon,
                          title: rows[r][c].title,
                          description: rows[r][c].description,
                          theme: theme,
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ],
          ),
          if (r < rows.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.arrow_downward_rounded,
                color: AppColors.primaryBlue.withValues(alpha: 0.35),
              ),
            ),
        ],
      ],
    );
  }
}

class FlowStepVisual extends StatelessWidget {
  const FlowStepVisual({
    super.key,
    required this.step,
    required this.icon,
    required this.title,
    required this.description,
    required this.theme,
  });

  final int step;
  final IconData icon;
  final String title;
  final String description;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 72,
                height: 72,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.cardBorder),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withValues(alpha: 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(icon, color: AppColors.primaryBlue, size: 32),
              ),
              Positioned(
                right: -6,
                top: -6,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.accentOrange,
                  child: Text(
                    '$step',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
