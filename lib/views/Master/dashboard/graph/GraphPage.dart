import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph'),
      ),
      body: Center( // Center the pie chart in the middle of the screen
        child:
        Container(
          width: 200, // Increased width for the PieChart
          height: 200, // Increased height for the PieChart
          child: Stack(
            alignment: Alignment.center, // Center the text on top of the pie chart
            children: [
              PieChart(

                PieChartData(
                  sectionsSpace: 0, // No space between sections
                  borderData: FlBorderData(show: false), // Hide borders
                  sections: [

                    PieChartSectionData(
                      radius: 40,
                      value: 52, // First section value
                      color: Colors.blue,
                      title: '52%', // Display value directly instead of percentage
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      radius: 40,
                      value: 35, // Second section value
                      color: Colors.red,
                      title: '35%', // Display value directly
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      radius: 40,
                      value: 1, // Third section value
                      color: Colors.purple,
                      title: '1%', // Display value directly
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      radius: 40,
                      value: 35, // Third section value
                      color: Colors.orange,
                      title: '35%', // Display value directly
                      titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),

                  ],
                ),
              ),
              // Center text displaying the total
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total', // Total value
                    style: TextStyle(
                        fontSize: 26, // Font size for the total
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.sfPro
                    ),
                  ),
                  Text(
                    '122', // Total value
                    style: TextStyle(
                        fontSize: 20, // Font size for the total\
                        fontFamily: FontFamily.sfPro,
                        fontWeight: FontWeight.w500


                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}