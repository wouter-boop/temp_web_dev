import 'dart:ui'; // Required for BackdropFilter (Blur)
import 'package:flutter/material.dart';

/// Data structure for navigation items and optional dropdown sub-items
class NavItemData {
  final String label;
  final List<String>? subItems;

  const NavItemData({required this.label, this.subItems});
}

class CustomWebHeader extends StatelessWidget {
  final int selectedIndex;
  final Function(int mainIndex, {int? subIndex}) onDestinationSelected;

  const CustomWebHeader({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  static const List<NavItemData> _navItems = [
    NavItemData(label: 'Home'),
    NavItemData(
      label: 'Product',
      subItems: [
        'Ontdek Odontium',
        'Features',
        'Smart Features',
        'Security',
        'Integrations',
        'Mobiele apps'
      ]
    ),
    NavItemData(
      label: 'Disciplines',
      subItems: [
        'Tandarts',
        'Tandtechniek',
        'Tandprotheticus',
        'Mondhygiënist',
        'Orthodontist',
      ],
    ),
    NavItemData(
        label: 'Overstappen',
      subItems: [
        'Stap voor stap',
        'Training',
        'Klantverhalen',
        'FAQ Overstappen'
      ]
    ),
    NavItemData(label: 'Over Ons', subItems: ['TSE', 'Onze support', 'Team']),
    NavItemData(label: 'Contact'),
    NavItemData(label: 'Boek een demo'),
    NavItemData(label: 'Support'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          height: 72,
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.40),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.15),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              _HeaderLogo(onTap: () => onDestinationSelected(0)),
              const Spacer(),

              ..._navItems.sublist(1, 6).asMap().entries.map((entry) {
                final int index = entry.key + 1;
                final NavItemData item = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: NavDropdownButton(
                    item: item,
                    isSelected: selectedIndex == index,
                    onTap: () => onDestinationSelected(index),
                    onSubItemTap: (subIndex) =>
                        onDestinationSelected(index, subIndex: subIndex),
                  ),
                );
              }),

              const Spacer(),

              NavDropdownButton(
                item: _navItems[6],
                // "Boek een demo"
                isSelected: selectedIndex == 6,
                onTap: () => onDestinationSelected(6),
                onSubItemTap: (subIndex) =>
                    onDestinationSelected(6, subIndex: subIndex),
                isAction: true,
              ),
              const SizedBox(width: 8),
              NavDropdownButton(
                item: _navItems[7], // "Support"
                isSelected: selectedIndex == 7,
                onTap: () => onDestinationSelected(7),
                onSubItemTap: (subIndex) =>
                    onDestinationSelected(7, subIndex: subIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Compact Logo Widget
class _HeaderLogo extends StatelessWidget {
  final VoidCallback onTap;

  const _HeaderLogo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 36,
              width: 36,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "lib/assets/Odontium.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Odontium',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
                letterSpacing: -0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavDropdownButton extends StatefulWidget {
  final NavItemData item;
  final bool isSelected;
  final VoidCallback onTap;
  final Function(int subIndex)? onSubItemTap;
  final bool isAction;

  const NavDropdownButton({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
    this.onSubItemTap,
    this.isAction = false,
  });

  @override
  State<NavDropdownButton> createState() => _NavDropdownButtonState();
}

class _NavDropdownButtonState extends State<NavDropdownButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasSubItems =
        widget.item.subItems != null && widget.item.subItems!.isNotEmpty;

    Color getBackgroundColor() {
      if (widget.isAction && widget.isSelected) return colorScheme.primary;
      if (widget.isAction && _isHovered)
        return colorScheme.primary.withValues(alpha: 0.8);
      if (widget.isAction) return colorScheme.primaryContainer;

      if (widget.isSelected)
        return colorScheme.primaryContainer.withValues(alpha: 0.7);
      if (_isHovered) return Colors.black12;
      return Colors.transparent;
    }

    Color getTextColor() {
      if (widget.isAction && (widget.isSelected || _isHovered)) {
        return colorScheme.onPrimary;
      }
      if (widget.isAction) return colorScheme.onPrimaryContainer;

      if (widget.isSelected) return colorScheme.primary;
      return colorScheme.onSurfaceVariant;
    }

    // Button visual display
    Widget buttonContent = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: widget.isAction ? 22 : 14,
          vertical: widget.isAction ? 10 : 8,
        ),
        decoration: BoxDecoration(
          color: getBackgroundColor(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.item.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: (widget.isSelected || widget.isAction)
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: getTextColor(),
                letterSpacing: -0.2,
              ),
            ),
            if (hasSubItems) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
                color: getTextColor(),
              ),
            ],
          ],
        ),
      ),
    );

    // If there are no dropdown sub-items, return standard InkWell tap behavior
    if (!hasSubItems) {
      return InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: buttonContent,
      );
    }

    // Wrap with PopupMenuButton for sub-item menu dropdown
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 8,
          color: colorScheme.surface,
        ),
      ),
      child: PopupMenuButton<int>(
        offset: const Offset(0, 48),
        // Drops down right below header
        tooltip: '',
        onSelected: (subIndex) {
          if (widget.onSubItemTap != null) {
            widget.onSubItemTap!(subIndex);
          }
        },
        itemBuilder: (context) {
          return widget.item.subItems!.asMap().entries.map((entry) {
            return PopupMenuItem<int>(
              value: entry.key,
              height: 40,
              child: Text(
                entry.value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
            );
          }).toList();
        },
        child: buttonContent,
      ),
    );
  }
}
