import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../dependency_injection/service_locator.dart';
import '../../logic/cubits/home_cubit.dart';
import '../../routes/app_router.dart';
import '../layouts/app_layout.dart';
import '../widgets/base/animated_gradient_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = locator<HomeCubit>(param1: this);
  }

  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: AppLayout.noBackButton(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: AppHeader(
                    homeCubit: homeCubit,
                    title: AppStrings.homeScreenTitle,
                    subtitle: AppStrings.homeScreenSubtitle,
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    children: [
                      _buildFeatureCard(
                        title: AppStrings.discoverMusicTitle,
                        description: AppStrings.discoverMusicDescription,
                        icon: Icons.music_note_rounded,
                      ),
                      _buildFeatureCard(
                        title: AppStrings.createPlaylistsTitle,
                        description: AppStrings.createPlaylistsDescription,
                        icon: Icons.playlist_play_rounded,
                      ),
                      _buildFeatureCard(
                        title: AppStrings.supportArtistsTitle,
                        description: AppStrings.supportArtistsDescription,
                        icon: Icons.favorite_border_rounded,
                      ),
                      _buildFeatureCard(
                        title: AppStrings.discoverMusicTitle,
                        description: AppStrings.discoverMusicDescription,
                        icon: Icons.music_note_rounded,
                      ),
                    ],
                    //   children: List.generate(
                    //     4,
                    //     (index) => _buildFeatureCard(
                    //       title: AppStrings.discoverMusicTitle,
                    //       description: AppStrings.discoverMusicDescription,
                    //       icon: Icons.music_note_rounded,
                    //     ),
                    // ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Center(
                    child: AnimatedGradientButton(
                      text: AppStrings.getStartedButton,
                      onPressed: () => AppRouter.goCustomerInfo(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      {required String title,
      required String description,
      required IconData icon}) {
    return SlideTransition(
      position: homeCubit.slideAnimation,
      child: FadeTransition(
        opacity: homeCubit.fadeAnimation,
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 1.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          color: AppColors.backgroundLight,
          child: ListTile(
            leading: Icon(icon, color: AppColors.primary, size: 6.w),
            title: Text(
              title,
              style: AppStyles.titleStyle.copyWith(fontSize: 16.sp),
            ),
            subtitle: Text(description, style: AppStyles.subtitleStyle),
          ),
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.homeCubit,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: homeCubit.slideAnimation,
          child: FadeTransition(
            opacity: homeCubit.fadeAnimation,
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: AppStyles.titleStyle.copyWith(fontSize: 22.sp),
            ),
          ),
        ),

        SizedBox(height: 1.h),

        // Animated Subtext
        SlideTransition(
          position: homeCubit.slideAnimation,
          child: FadeTransition(
            opacity: homeCubit.fadeAnimation,
            child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: AppStyles.subtitleStyle,
            ),
          ),
        ),
      ],
    );
  }
}
