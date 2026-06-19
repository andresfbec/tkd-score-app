import 'package:fluent_ui/fluent_ui.dart';

class NoTransitionPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  NoTransitionPageRoute({required this.child, super.settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
