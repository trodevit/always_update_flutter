// ignore_for_file: deprecated_member_use, must_be_immutable, unused_element
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/common_widgets/custom_button.dart';
import 'package:always_update/features/class_section/model/subject_model.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/networks/api_acess.dart';
import 'package:always_update/networks/endpoints.dart';
import 'package:url_launcher/url_launcher.dart';
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(
                                              imageUrls + imageUrl!,
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  formattedDate(suggestion
                                                      .createdAt
                                                      .toString()),
                                                  style: TextFontStyle
                                                      .hindisiliguri10w400
                                                      .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          suggestion.title ?? '',
                                          style: TextFontStyle
                                              .hindisiliguri10w400
                                              .copyWith(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.visible,
                                          maxLines: null,
                                          softWrap: true,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          suggestion.description ?? '',
                                          style: TextFontStyle
                                              .hindisiliguri10w400
                                              .copyWith(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (suggestion.check == 'notice')
                                              customButton(
                                                minWidth: 150,
                                                height: 50,
                                                color: AppColors.primaruDarki,
                                                borderColor:
                                                    AppColors.primaruDarki,
                                                borderRadius: 10,
                                                name: 'ওয়েবসাইট দেখুন',
                                                textStyle: TextFontStyle
                                                    .hindisiliguri10w400
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                onCallBack: () async {
                                                  // URL লঞ্চ করার জন্য সরাসরি ফাংশন কল
                                                  if (await canLaunchUrl(
                                                      Uri.parse(suggestion
                                                              .officalUrl ??
                                                          ''))) {
                                                    await launchUrl(Uri.parse(
                                                        suggestion.officalUrl ??
                                                            ''));
                                                  } else {
                                                    throw 'Could not launch ${suggestion.officalUrl}';
                                                  }
                                                },
                                                context: context,
                                              ),
                                            customButton(
                                              minWidth: 150,
                                              height: 50,
                                              color: AppColors.primaryColor,
                                              borderColor:
                                                  AppColors.primaryColor,
                                              borderRadius: 10,
                                              name: 'পিডিএফ দেখুন',
                                              textStyle: TextFontStyle
                                                  .hindisiliguri10w400
                                                  .copyWith(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              onCallBack: () {
                                                NavigationService
                                                    .navigateToWithArgs(
                                                  Routes.pdfViewScreen,
                                                  {
                                                    'pdfURL': suggestion.pdf,
                                                  },
                                                );
                                              },
                                              context: context,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
