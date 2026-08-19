import '../widgets/general/auto_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: AutoScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: isDesktop ? 1 : 0,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 260, maxWidth: 260),
                    child: Image.asset(
                      'lib/assets/error.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.error_outline_rounded,
                          size: 120,
                          color: colorScheme.error,
                        );
                      },
                    ),
                  ),
                ),

                if (isDesktop) const SizedBox(width: 48) else const SizedBox(height: 32),

                Flexible(
                  flex: isDesktop ? 1 : 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: isDesktop
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      // StatusCode / Label
                      Text(
                        '404 ERROR',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        'Pagina niet gevonden',
                        textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Text(
                        'De pagina die je zoekt bestaat niet meer, is verplaatst of de URL is onjuist ingevoerd.',
                        textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),

                      FilledButton.icon(
                        onPressed: () => context.go('/home'),
                        icon: const Icon(Icons.arrow_back_rounded, size: 18),
                        label: const Text('Terug naar Home'),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}