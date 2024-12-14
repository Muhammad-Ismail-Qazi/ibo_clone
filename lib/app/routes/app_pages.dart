import 'package:get/get.dart';

import '../modules/demo_details/bindings/demo_details_binding.dart';
import '../modules/demo_details/views/demo_details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/playlists/bindings/playlists_binding.dart';
import '../modules/playlists/views/playlists_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/spalsh/views/spalsh_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPALSH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPALSH,
      page: () => const Splash(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.PLAYLISTS,
      page: () => const PlaylistsView(),
      binding: PlaylistsBinding(),
    ),
    GetPage(
      name: _Paths.DEMO_DETAILS,
      page: () => const DemoDetailsView(),
      binding: DemoDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
