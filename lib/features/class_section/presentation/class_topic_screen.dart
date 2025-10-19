// ignore_for_file: deprecated_member_use, must_be_immutable, unused_element, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers
import 'dart:developer';
import 'package:always_update/features/ad_helper.dart';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/class_section/model/subject_model.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

class ClassTopicScreen extends StatefulWidget {
  dynamic type, className;

  ClassTopicScreen({
    super.key,
    this.type,
    this.className,
  });

  @override
  State<ClassTopicScreen> createState() => _ClassTopicScreenState();
}

class _ClassTopicScreenState extends State<ClassTopicScreen> {
  List<Map<String, String>> allSuggestions = [
    {
      'date': '১৫ জুন, ২০২৪',
      'title': 'SSC পরীক্ষার সময়সূচী প্রকাশ',
      'desc':
          '২০২৪ সালের SSC পরীক্ষার সময়সূচী প্রকাশ পেয়েছে। বিস্তারিত জানতে দেখুন।',
    },
    {
      'date': '২০ জুন, ২০২৪',
      'title': 'HSC সাজেশন',
      'desc': '২০২৪ সালের HSC পরীক্ষার সাজেশন প্রকাশিত হয়েছে।',
    },
    {
      'date': '২৫ জুন, ২০২৪',
      'title': 'অনার্স ১ম বর্ষ সাজেশন',
      'desc': 'অনার্স ১ম বর্ষের সকল বিষয়ের সাজেশন আপডেট করা হয়েছে।',
    },
    {
      'date': '৩০ জুন, ২০২৪',
      'title': 'ইংরেজি ২য় পত্র সাজেশন',
      'desc': 'SSC ইংরেজি ২য় পত্রের সাজেশন প্রকাশ।',
    },
  ];

  List<Map<String, String>> filteredSuggestions = [];
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    getSubjectAPIRX.subjectRX(
      className: widget.className,
      topic: widget.type,
    );
    filteredSuggestions = List.from(allSuggestions);
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
        onAdOpened: (Ad ad) => log('Ad opened.'),
        onAdClosed: (Ad ad) => log('Ad closed.'),
        onAdImpression: (Ad ad) => log('Ad impression.'),
      ),
    ).load();

    // Initial full list
  }

  void _filterList(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuggestions = List.from(allSuggestions);
      } else {
        filteredSuggestions = allSuggestions
            .where((item) =>
                item['title']!.toLowerCase().contains(query.toLowerCase()) ||
                item['desc']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log("================> Type: ${widget.type}");
    log("================> ID: ${widget.className}");

    String formattedDate(String dateString) {
      try {
        DateTime dateTime = DateTime.parse(dateString);
        return DateFormat('d MMMM yyyy').format(dateTime);
      } catch (e) {
        return '';
      }
    }

    String _bnTitle(dynamic type) {
      final key = (type ?? '').toString().toLowerCase().trim();
      switch (key) {
        case 'suggestion':
          return 'সাজেশন বিষয়ক তথ্য';
        case 'result':
          return 'রেজাল্ট বিষয়ক সকল তথ্য';
        case 'scholarship':
          return 'সকল উপবৃত্তির তথ্য';
        case 'notice':
          return 'গুরুত্বপূর্ণ সকল নোটিশ';
        default:
          // fallback: jeta asche oita-i dekhabe
          return (type ?? '').toString();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: _bnTitle(widget.type),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: filteredSuggestions.isEmpty
                  ? Center(
                      child: Text(
                        'কোনও সাজেশন পাওয়া যায়নি!',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : StreamBuilder<SubjectModel>(
                      stream: getSubjectAPIRX.getSubjectRx,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (!snapshot.hasData || snapshot.data == null) {
                          return Center(child: Text('No Data Available'));
                        }

                        var subjectData = snapshot.data!.data ?? [];
                        log('Subject data: $subjectData'); // See the fetched data in logs

                        if (subjectData.isEmpty) {
                          return Center(
                            child: Text(
                              'কোন ডাটা পাওয়া যাচ্ছে নাহ',
                              style: TextFontStyle.hindisiliguri10w400.copyWith(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: subjectData.length,
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            final suggestion = subjectData[index];
                            var imageUrl = suggestion.image;
                            log("=========> $imageUrl");
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.cFFFFFF,
                                    borderRadius: BorderRadius.circular(6.r),
                                    border:
                                        Border.all(color: AppColors.boxShadow),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if ((suggestion.image ?? '').isNotEmpty)
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(6.r),
                                            bottomLeft: Radius.circular(6.r),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                imageUrls + suggestion.image!,
                                            width: 140.w,
                                            height: 140.w,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                Center(
                                              child: SizedBox(
                                                width: 24,
                                                height: 24,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  value:
                                                      downloadProgress.progress,
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              width: 130.w,
                                              height: 90.w,
                                              color: Colors.grey[300],
                                              child: const Icon(Icons.error,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),

                                      UIHelper.horizontalSpace(10.w),

                                      // Text Section
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 10.w,
                                              top: 6.h,
                                              bottom: 6.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // ✅ Title Section
                                              Text(
                                                suggestion.title ?? '',
                                                style: TextFontStyle
                                                    .hindisiliguri10w400
                                                    .copyWith(
                                                  color: AppColors.c000000,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 2, // Only 2 lines
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                              ),
                                              UIHelper.verticalSpace(3.h),

                                              // ✅ Date
                                              Text(
                                                "প্রকাশিত তারিখ: " +
                                                    formattedDate(suggestion
                                                        .createdAt
                                                        .toString()),
                                                style: TextFontStyle
                                                    .hindisiliguri10w400
                                                    .copyWith(
                                                  color: Colors.black87,
                                                  fontSize: 12.sp,
                                                ),
                                              ),

                                              // ✅ Description
                                              if ((suggestion.description ?? '')
                                                  .isNotEmpty)
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 4.h),
                                                  child: Text(
                                                    suggestion.description!,
                                                    style: TextFontStyle
                                                        .hindisiliguri10w400
                                                        .copyWith(
                                                      color: Colors.black54,
                                                      fontSize: 13.sp,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),

                                              UIHelper.verticalSpace(5.h),

                                              // ✅ Conditional Button
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (widget.type ==
                                                        'suggestion') {
                                                      final pdf =
                                                          suggestion.pdf ?? '';
                                                      log('PDF: $pdf');
                                                      if (pdf.isEmpty) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'পিডিএফ লিঙ্ক পাওয়া যায়নি'),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (_) =>
                                                              PDFViewScreen(
                                                                  pdfURL: pdf),
                                                        ),
                                                      );
                                                    } else {
                                                      NavigationService
                                                          .navigateToWithArgs(
                                                        Routes
                                                            .classTopicDetailsScreen,
                                                        {
                                                          'title':
                                                              suggestion.title,
                                                          'description':
                                                              suggestion
                                                                  .description,
                                                          'imagePath':
                                                              suggestion.image,
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Text(
                                                    widget.type == 'suggestion'
                                                        ? 'পিডিএফ দেখুন'
                                                        : 'বিস্তারিত পড়ুন',
                                                    style: TextFontStyle
                                                        .hindisiliguri10w400
                                                        .copyWith(
                                                      color: Colors.blue,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
            if (_bannerAd != null)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            UIHelper.verticalSpace(5.h),
          ],
        ),
      ),
    );
  }
}
