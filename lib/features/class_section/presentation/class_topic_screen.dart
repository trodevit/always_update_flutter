// ignore_for_file: deprecated_member_use, must_be_immutable, unused_element, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:always_update/features/pdf_view_screen.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/class_section/model/subject_model.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

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

  @override
  void initState() {
    super.initState();
    getSubjectAPIRX.subjectRX(
      className: widget.className,
      topic: widget.type,
    );
    filteredSuggestions = List.from(allSuggestions); // Initial full list
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
          return 'সাজেশন';
        case 'result':
          return 'রেজাল্ট';
        case 'scholarship':
          return 'বৃত্তি';
        case 'notice':
          return 'নোটিশ';
        default:
          // fallback: jeta asche oita-i dekhabe
          return (type ?? '').toString();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'সকল ${_bnTitle(widget.type)} এর তালিকা',
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
                                  child: Column(
                                    children: [
                                      // Thumbnail
                                      if ((suggestion.image ?? '').isNotEmpty)
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(6.r),
                                            topRight: Radius.circular(6.r),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                imageUrls + suggestion.image!,
                                            width: double.infinity,
                                            height:
                                                200, // Adjust height as needed
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              width: double.infinity,
                                              height: 200,
                                              color: Colors.grey[300],
                                              child: Icon(Icons.error,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      // Content
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                suggestion.title ?? '',
                                                style: TextFontStyle
                                                    .hindisiliguri10w400
                                                    .copyWith(
                                                  color: AppColors.c000000,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            UIHelper.verticalSpace(5.h),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "প্রকাশিত তারিখ: " +
                                                    formattedDate(suggestion
                                                        .createdAt
                                                        .toString()),
                                                style: TextFontStyle
                                                    .hindisiliguri10w400
                                                    .copyWith(
                                                  color: AppColors.c000000,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            UIHelper.verticalSpace(10.h),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: ReadMoreText(
                                                "বিস্তারিতঃ- \n${suggestion.description ?? ""}",
                                                trimLines: 3,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText: ' রিড মোর',
                                                trimExpandedText: ' কম দেখুন',
                                                style: TextFontStyle
                                                    .hindisiliguri10w400
                                                    .copyWith(
                                                  color: AppColors.c000000,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                moreStyle: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                                lessStyle: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),

                                            // Actions

                                            if (widget.type == 'suggestion')
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  customButton(
                                                    minWidth: 120.w,
                                                    name: 'পিডিএফ দেখুন',
                                                    textStyle: TextFontStyle
                                                        .hindisiliguri10w400
                                                        .copyWith(
                                                      color: AppColors.cFFF5DA,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    onCallBack: () {
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
                                                    },
                                                    context: context,
                                                    color: AppColors.c02BF65,
                                                    borderColor:
                                                        AppColors.c02BF65,
                                                  ),
                                                ],
                                              ),
                                          ],
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
          ],
        ),
      ),
    );
  }
}
