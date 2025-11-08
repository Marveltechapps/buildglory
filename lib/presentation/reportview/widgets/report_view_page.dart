import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'report_header.dart';
import 'report_card.dart';
import 'executive_summary_card.dart';
import 'market_analysis_card.dart';
import 'location_insights_card.dart';
import 'investment_outlook_card.dart';
import 'download_cta_card.dart';

class ReportViewPage extends StatelessWidget {
  const ReportViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              const ReportHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      ReportCard(),
                      SizedBox(height: 20),
                      ExecutiveSummaryCard(),
                      SizedBox(height: 20),
                      MarketAnalysisCard(),
                      SizedBox(height: 20),
                      LocationInsightsCard(),
                      SizedBox(height: 20),
                      InvestmentOutlookCard(),
                      SizedBox(height: 20),
                      DownloadCtaCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
