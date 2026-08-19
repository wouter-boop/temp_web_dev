import 'dart:async';
import 'dart:ui'; // Required for BackdropFilter (Blur)
import 'package:flutter/material.dart';

import 'responsive.dart';

/// Accent used to mark the active page in the nav dropdowns.
const Color _accentTeal = Color(0xFF17A8A6);

/// Data structure for navigation items and optional dropdown sub-items
class NavItemData {
  final String label;
  final List<String>? subItems;

  const NavItemData({required this.label, this.subItems});
}

class CustomWebHeader extends StatefulWidget {
  final int selectedIndex;

  /// Index of the active dropdown item within [selectedIndex]'s sub-items,
  /// or null when the current page isn't one of them.
  final int? selectedSubIndex;
  final Function(int mainIndex, {int? subIndex}) onDestinationSelected;

  const CustomWebHeader({
    super.key,
    required this.selectedIndex,
    this.selectedSubIndex,
    required this.onDestinationSelected,
  });

  static const List<NavItemData> _navItems = [
    NavItemData(label: 'Home'),
    NavItemData(
      label: 'Product',
      subItems: [
        'Ontdek Odontium',
        'Slimme Functies',
        'Beveiliging',
        'Integraties',
        'Mobiele apps'
      ]
    ),
    NavItemData(
      label: 'Disciplines',
    ),
    NavItemData(
        label: 'Overstappen',
    ),
    NavItemData(label: 'Over Ons', subItems: ['TSE', 'Klantverhalen', 'Veelgestelde vragen']),
    NavItemData(label: 'Contact'),
    NavItemData(label: 'Boek een demo'),
    NavItemData(label: 'Support'),
  ];

  @override
  State<CustomWebHeader> createState() => _CustomWebHeaderState();
}

class _CustomWebHeaderState extends State<CustomWebHeader> {
  bool _menuOpen = false;
  int? _expandedSection;

  void _selectAndClose(int index, {int? subIndex}) {
    setState(() {
      _menuOpen = false;
      _expandedSection = null;
    });
    widget.onDestinationSelected(index, subIndex: subIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (!isDesktop(context)) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMobileBar(context),
          if (_menuOpen)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: _buildMobilePanel(context),
            ),
        ],
      );
    }
    return _buildDesktopBar(context);
  }

  Widget _buildDesktopBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final navItems = CustomWebHeader._navItems;

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
              _HeaderLogo(onTap: () => widget.onDestinationSelected(0)),
              const Spacer(),

              ...navItems.sublist(1, 6).asMap().entries.map((entry) {
                final int index = entry.key + 1;
                final NavItemData item = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: NavDropdownButton(
                    item: item,
                    isSelected: widget.selectedIndex == index,
                    selectedSubIndex: widget.selectedIndex == index
                        ? widget.selectedSubIndex
                        : null,
                    onTap: () => widget.onDestinationSelected(index),
                    onSubItemTap: (subIndex) =>
                        widget.onDestinationSelected(index, subIndex: subIndex),
                  ),
                );
              }),

              const Spacer(),

              NavDropdownButton(
                item: navItems[6],
                // "Boek een demo"
                isSelected: widget.selectedIndex == 6,
                onTap: () => widget.onDestinationSelected(6),
                onSubItemTap: (subIndex) =>
                    widget.onDestinationSelected(6, subIndex: subIndex),
                isAction: true,
              ),
              const SizedBox(width: 8),
              NavDropdownButton(
                item: navItems[7], // "Support"
                isSelected: widget.selectedIndex == 7,
                selectedSubIndex:
                    widget.selectedIndex == 7 ? widget.selectedSubIndex : null,
                onTap: () => widget.onDestinationSelected(7),
                onSubItemTap: (subIndex) =>
                    widget.onDestinationSelected(7, subIndex: subIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          height: 64,
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.85),
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
              _HeaderLogo(onTap: () => _selectAndClose(0)),
              const Spacer(),
              IconButton(
                onPressed: () => setState(() {
                  _menuOpen = !_menuOpen;
                  // Opening the menu reveals the section you're currently in,
                  // so the active sub-page is visible right away.
                  _expandedSection = _menuOpen && widget.selectedSubIndex != null
                      ? widget.selectedIndex
                      : null;
                }),
                icon: Icon(
                  _menuOpen ? Icons.close_rounded : Icons.menu_rounded,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobilePanel(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final navItems = CustomWebHeader._navItems;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.98),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 24, offset: const Offset(0, 12)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < navItems.length; i++) _buildMobileItem(context, i),
        ],
      ),
    );
  }

  Widget _buildMobileItem(BuildContext context, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final item = CustomWebHeader._navItems[index];
    final hasSubItems = item.subItems != null && item.subItems!.isNotEmpty;
    final isSelected = widget.selectedIndex == index;
    const isActionIndex = 6; // "Boek een demo"

    if (index == isActionIndex) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _selectAndClose(index),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 0,
            ),
            child: Text(item.label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
      );
    }

    final labelStyle = TextStyle(
      fontSize: 15,
      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
      color: isSelected ? colorScheme.primary : colorScheme.onSurface,
    );

    if (!hasSubItems) {
      return InkWell(
        onTap: () => _selectAndClose(index),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Row(
            children: [Expanded(child: Text(item.label, style: labelStyle))],
          ),
        ),
      );
    }

    final expanded = _expandedSection == index;
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => _expandedSection = expanded ? null : index),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            child: Row(
              children: [
                Expanded(child: Text(item.label, style: labelStyle)),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.keyboard_arrow_down_rounded, color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var subIndex = 0; subIndex < item.subItems!.length; subIndex++)
                  Builder(
                    builder: (context) {
                      final isActiveSub =
                          isSelected && widget.selectedSubIndex == subIndex;
                      return InkWell(
                        onTap: () => _selectAndClose(index, subIndex: subIndex),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(
                            color: isActiveSub
                                ? _accentTeal.withValues(alpha: 0.10)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.subItems![subIndex],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                        isActiveSub ? FontWeight.w700 : FontWeight.w400,
                                    color: isActiveSub
                                        ? _accentTeal
                                        : colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              if (isActiveSub)
                                const Icon(Icons.check_rounded, size: 16, color: _accentTeal),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Compact Logo Widget
class _HeaderLogo extends StatefulWidget {
  final VoidCallback onTap;

  const _HeaderLogo({required this.onTap});

  @override
  State<_HeaderLogo> createState() => _HeaderLogoState();
}

class _HeaderLogoState extends State<_HeaderLogo> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (hovering) => setState(() => _hovering = hovering),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The tooth tips its hat on hover: a small tilt + scale.
            AnimatedRotation(
              turns: _hovering ? -0.03 : 0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              child: AnimatedScale(
                scale: _hovering ? 1.12 : 1.0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutBack,
                child: Container(
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

  /// Which sub-item is the current page, so the dropdown can mark it.
  final int? selectedSubIndex;
  final VoidCallback onTap;
  final Function(int subIndex)? onSubItemTap;
  final bool isAction;

  const NavDropdownButton({
    super.key,
    required this.item,
    required this.isSelected,
    this.selectedSubIndex,
    required this.onTap,
    this.onSubItemTap,
    this.isAction = false,
  });

  @override
  State<NavDropdownButton> createState() => _NavDropdownButtonState();
}

class _NavDropdownButtonState extends State<NavDropdownButton> {
  bool _isHovered = false;

  final MenuController _menu = MenuController();

  /// Closing is delayed so the pointer can cross the small gap between the
  /// button and the panel (and move between panel items) without the menu
  /// snapping shut. Any re-entry cancels the pending close.
  static const Duration _closeGrace = Duration(milliseconds: 150);
  Timer? _closeTimer;

  void _openMenu() {
    _closeTimer?.cancel();
    // MenuController.open() dereferences its anchor with `!` behind nothing but
    // an assert, and release builds strip asserts — so calling it once this
    // widget's anchor has detached throws "Null check operator used on a null
    // value" instead of failing an assertion. isOpen reports false while
    // detached, so testing it alone would steer us straight into that: the
    // mounted check is what actually keeps us out. (close() and isOpen are
    // null-safe in the framework; open() is the only one that is not.)
    if (!mounted || _menu.isOpen) return;
    _menu.open();
  }

  void _toggleMenu() {
    if (_menu.isOpen) {
      _menu.close();
    } else {
      _openMenu();
    }
  }

  void _scheduleClose() {
    _closeTimer?.cancel();
    _closeTimer = Timer(_closeGrace, () {
      if (mounted && _menu.isOpen) _menu.close();
    });
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    super.dispose();
  }

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
    // The visual only. Pointer handling is attached below, because a dropdown
    // item additionally drives the menu open on hover.
    Widget buttonVisual = AnimatedScale(
        scale: _isHovered ? 1.06 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
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
              AnimatedRotation(
                turns: _isHovered ? 0.5 : 0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutCubic,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: getTextColor(),
                ),
              ),
            ],
          ],
        ),
        ),
    );

    // If there are no dropdown sub-items, return standard InkWell tap behavior
    if (!hasSubItems) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: buttonVisual,
        ),
      );
    }

    // Sub-items open on hover via MenuAnchor. PopupMenuButton cannot do this:
    // it only opens on tap and pushes a modal route whose barrier would eat the
    // hover events for the rest of the bar. MenuAnchor has no barrier and can
    // be driven from a MenuController, so the pointer can move from the button
    // into the panel and back out again naturally.
    return MenuAnchor(
      controller: _menu,
      alignmentOffset: const Offset(0, 6),
      style: MenuStyle(
        elevation: const WidgetStatePropertyAll(8),
        backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 6)),
      ),
      builder: (context, controller, _) {
        return MouseRegion(
          onEnter: (_) {
            setState(() => _isHovered = true);
            _openMenu();
          },
          onExit: (_) {
            setState(() => _isHovered = false);
            _scheduleClose();
          },
          child: InkWell(
            // Tapping still toggles, so a touch device at desktop width (an
            // iPad in landscape, say) can still reach the sub-items.
            onTap: _toggleMenu,
            borderRadius: BorderRadius.circular(12),
            child: buttonVisual,
          ),
        );
      },
      menuChildren: widget.item.subItems!.asMap().entries.map((entry) {
        final isActiveSub = widget.selectedSubIndex == entry.key;
        return MouseRegion(
          // Hovering the panel only *cancels* the pending close — it must never
          // call open(). These items live in an Overlay, a separate subtree from
          // the anchor, so they can outlive it briefly during teardown; opening
          // from here would be the one case the mounted check in _openMenu
          // cannot catch. They are only ever visible while the menu is already
          // open, so cancelling is all that is wanted.
          onEnter: (_) => _closeTimer?.cancel(),
          onExit: (_) => _scheduleClose(),
          child: MenuItemButton(
            onPressed: () => widget.onSubItemTap?.call(entry.key),
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
            ),
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: isActiveSub ? _accentTeal.withValues(alpha: 0.10) : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isActiveSub ? FontWeight.w700 : FontWeight.w500,
                        color: isActiveSub ? _accentTeal : colorScheme.onSurface,
                      ),
                    ),
                  ),
                  if (isActiveSub) ...[
                    const SizedBox(width: 8),
                    const Icon(Icons.check_rounded, size: 15, color: _accentTeal),
                  ],
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
