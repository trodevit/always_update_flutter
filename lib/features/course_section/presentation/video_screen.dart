// ignore_for_file: deprecated_member_use
import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:always_update/features/ad_helper.dart';

class VideoPlayerScreen extends StatefulWidget {
  final dynamic id;

  const VideoPlayerScreen({super.key, this.id});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController? _youtubeController;
  bool _isControllerInitialized = false;
  bool _isFullScreen = false;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    fetchVideoDetails();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          log('Ad loaded.');
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('Ad failed to load: $error');
          ad.dispose();
        },
      ),
    ).load();
  }

  void rotation() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void _lockOrientation() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  void _unlockOrientation() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  Future<void> fetchVideoDetails() async {
    try {
      await widget.id;
      log('Video details fetched successfully');
      _initializeYoutubeController();
    } catch (e) {
      log('Error fetching video details: $e');
    }
  }

  void _initializeYoutubeController() {
    final videoId = YoutubePlayer.convertUrlToId(widget.id ?? '');
    if (videoId != null && !_isControllerInitialized) {
      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ),
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _isControllerInitialized = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (_isFullScreen) {
      _unlockOrientation();
      setState(() => _isFullScreen = false);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil before using it
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: OrientationBuilder(
        builder: (context, orientation) {
          // Handle orientation changes
          if (orientation == Orientation.landscape && !_isFullScreen) {
            _isFullScreen = true;
            _lockOrientation();
          } else if (orientation == Orientation.portrait && _isFullScreen) {
            _isFullScreen = false;
            _unlockOrientation();
          }

          return Scaffold(
            backgroundColor: AppColors.cFFFFFF,
            appBar: _isFullScreen
                ? null
                : CustomAppBar(
                    title: 'ভিডিও বিস্তারিত',
                  ),
            body: _isControllerInitialized
                ? Column(
                    children: [
                      Expanded(
                        child: YoutubePlayerBuilder(
                          player:
                              YoutubePlayer(controller: _youtubeController!),
                          builder: (context, player) {
                            return _isFullScreen
                                ? player
                                : _buildPortraitMode(player);
                          },
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            bottomNavigationBar: _bannerAd == null
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    child: Container(
                      color: Colors.white,
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildPortraitMode(player) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.77,
                  child: player,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   widget.title ?? 'No Title'.tr,
            //   style: TextFontStyle.hindisiliguri10w400.copyWith(
            //     color: AppColors.c292E34,
            //     height: 28 / 16,
            //     fontSize: 16.sp,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   widget.description ?? 'No Description'.tr,
            //   style: TextFontStyle.hindisiliguri10w400.copyWith(
            //     color: AppColors.c292E34,
            //     height: 28 / 16,
            //     fontSize: 13.sp,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
