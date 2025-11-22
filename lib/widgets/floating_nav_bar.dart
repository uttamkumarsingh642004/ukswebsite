import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_theme.dart';
import '../utils/responsive.dart';

/// Floating navigation bar for quick section navigation
/// Appears after scrolling past hero section
class FloatingNavBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final ScrollController scrollController;

  const FloatingNavBar({
    super.key,
    required this.onItemTapped,
    required this.scrollController,
  });

  @override
  State<FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  bool _isVisible = false;
  int _selectedIndex = 0;

  final List<NavItem> _navItems = const [
    NavItem(icon: Icons.home, label: 'Home'),
    NavItem(icon: Icons.person, label: 'About'),
    NavItem(icon: Icons.work, label: 'Projects'),
    NavItem(icon: Icons.code, label: 'Skills'),
    NavItem(icon: Icons.email, label: 'Contact'),
  ];

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;
    final shouldShow = offset > 300;

    if (shouldShow != _isVisible) {
      setState(() => _isVisible = shouldShow);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    if (isMobile) {
      // Mobile: Bottom navigation
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        bottom: _isVisible ? 20 : -100,
        left: 20,
        right: 20,
        child: _buildNavBar(isMobile: true),
      );
    } else {
      // Desktop: Side navigation
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        right: _isVisible ? 30 : -100,
        top: 0,
        bottom: 0,
        child: Center(
          child: _buildNavBar(isMobile: false),
        ),
      );
    }
  }

  Widget _buildNavBar({required bool isMobile}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardDark.withOpacity(0.95),
        borderRadius: BorderRadius.circular(isMobile ? 30 : 25),
        border: Border.all(
          color: AppTheme.primaryAccent.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryAccent.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: isMobile
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _navItems.asMap().entries.map((entry) {
                return _buildNavItem(entry.key, entry.value, isMobile: true);
              }).toList(),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: _navItems.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: _buildNavItem(entry.key, entry.value, isMobile: false),
                );
              }).toList(),
            ),
    )
        .animate(
          target: _isVisible ? 1 : 0,
        )
        .fadeIn()
        .scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildNavItem(int index, NavItem item, {required bool isMobile}) {
    final isSelected = _selectedIndex == index;

    return Tooltip(
      message: item.label,
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedIndex = index);
          widget.onItemTapped(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(isMobile ? 8 : 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryAccent
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            item.icon,
            color: isSelected ? Colors.white : AppTheme.textSecondary,
            size: isMobile ? 20 : 24,
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;

  const NavItem({
    required this.icon,
    required this.label,
  });
}
