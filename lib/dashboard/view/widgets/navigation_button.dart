import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_sem_6/auth/view/login_screen.dart';
import 'package:mini_project_sem_6/dashboard/view/screens/dashboard_page.dart';
import 'package:mini_project_sem_6/placement_prediction/view/placement_prediction_provider.dart';

final ButtonStyle navigationButtonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(100, 100),
  elevation: 1,
  iconColor: Colors.black,
  foregroundColor: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.svgIcon,
    required this.label,
    required this.navigationRoute,
  });

  final String? svgIcon;
  final String? label;
  final String navigationRoute;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: navigationButtonStyle,
      onPressed: () {
        navigatePage(
          context,
          navigationRoute,
        );
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgIcon ?? 'assets/images/bgCircle.png',
              height: 110,
            ),
            Text(label ?? 'label'),
          ],
        ),
      ),
    );
  }

  void navigatePage(BuildContext context, String routeName) {
    switch (routeName) {
      case 'dashboard':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
        break;
      case 'prediction':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PlacementPredictionProvider(),
          ),
        );
        break;
      case 'result':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
        break;
      case 'attendance':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
        break;
      default:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
    }
  }
}
