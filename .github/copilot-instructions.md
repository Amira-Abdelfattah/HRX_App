# Copilot Instructions for HRX_App

- This is a Flutter mobile app rooted at `lib/main.dart`. The app uses a single `MaterialApp` with
  `ScreenUtilInit` for responsive layout and `AppTheme` from `lib/core/utils/app_theme.dart`.
- Feature code is organized by screen/feature under `lib/features/`. Key entry points are:
    - `lib/features/splash/splashScreen.dart` → initial splash flow
    - `lib/features/onboarding/onboardingScreen.dart` → onboarding flow to registration
    - `lib/features/auth/login.dart` and `lib/features/auth/register.dart` → auth screens
    - `lib/features/main_layout.dart` → app shell with bottom navigation and `IndexedStack`
- Shared visual design is centralized in `lib/core/utils/`: `app_colors.dart`, `app_styles.dart`,
  `app_theme.dart`.
- Most UI state is local widget state. There is no package-level state management (
  Bloc/Riverpod/GetX). Use `StatefulWidget` + `setState` or local widget controllers when extending
  screens.
- Navigation is manual via `Navigator.push`, `Navigator.pushReplacement`, and `MaterialPageRoute`;
  there is no `GoRouter`/router package.
- UI conventions:
    - custom widgets are grouped under `lib/features/widgets/`
    - `HrxGradientBackground` is used for auth/splash backgrounds
    - `CustomBottomNavBar` and `CustomDrawer` are the main app chrome patterns
- Network/API support is scaffolded but not implemented in `lib/core/api/`. Do not assume existing
  service implementations there.
- Dependencies to respect when editing/adding features:
    - `flutter_screenutil` for responsive spacing and sizing
    - `google_fonts` for `Poppins`
    - `introduction_screen` for onboarding pages
    - `syncfusion_flutter_charts` for chart UIs if needed
- Build and run workflow:
    - `flutter pub get`
    - `flutter run` from project root
    - `flutter test` for existing tests
    - `flutter build apk` / `flutter build ios` as needed
- Important workspace note: there is a separate `little_lemon_app/` folder in the workspace. Focus
  on the root `HRX_App` project for this repository.
- Keep changes consistent with the existing app shell approach: feature folders, local navigation,
  and central UI styling rather than adding global architecture changes.

If anything in this guidance is unclear or you want me to refine a specific area (navigation
patterns, theming, feature layout, or build workflow), let me know.