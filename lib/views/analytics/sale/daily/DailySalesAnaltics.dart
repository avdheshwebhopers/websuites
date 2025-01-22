import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';

class DailySalesAnalytics extends StatefulWidget {
  const DailySalesAnalytics({super.key});

  @override
  State<DailySalesAnalytics> createState() => _DailySalesAnalyticsState();
}

class _DailySalesAnalyticsState extends State<DailySalesAnalytics> {
  bool showChart = true;

  final List<LeadData> leadData = [
    LeadData('Approved', 53, AllColors.darkGreen),
    LeadData('Pending', 48, AllColors.vividRed),
    LeadData('Total Order', 40, AllColors.darkPink),
    LeadData('Total Amount', 70, AllColors.mediumPurple),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double chartHeight = screenHeight * 0.4;


    return Stack(
      children:
[
    SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [

        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daily Sales Report',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bar_chart,
                          color: showChart ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: AllColors.greenJungle,
                    ),
                    SizedBox(width:5,),
                    Text("Approved Amount",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),
                    Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: AllColors.vividRed,
                        ),
                        SizedBox(width:5,),
                        Text("Pending Amount",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),

                      ],
                    ),


                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: AllColors.darkPink,
                    ),
                    SizedBox(width:5,),
                    Text("Total Order",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),
                    Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: AllColors.mediumPurple,
                        ),
                        SizedBox(width:5,),
                        Text("Total Amount",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),

                      ],
                    )

                  ],
                ),



              ],
            )),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [

              SizedBox(
                height: chartHeight,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 100,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${leadData[groupIndex].value}',
                            const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: FontFamily.sfPro,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 7, left: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    leadData[value.toInt()].name,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          reservedSize: 40,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(

                          showTitles: true,
                          reservedSize: 34,
                          interval: 10,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 1, // Changed from 11 to 1 to show all lines
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.2),
                          strokeWidth: value % 10 == 0 ? 1.0 : 0.4, // Make lines at multiples of 10 slightly bolder
                        );
                      },
                      checkToShowHorizontalLine: (value) {
                        return value >= 1 && value <= 100; // Show lines from 1 to 100

                      },
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: leadData.asMap().entries.map((entry) {
                      return BarChartGroupData(
                        x: entry.key,

                        barRods: [
                          BarChartRodData(
                            toY: entry.value.value,
                            color: entry.value.color,
                            width: 20,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3),

                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10,),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("02 December 2024",style: TextStyle(fontFamily: FontFamily.sfPro,fontWeight: FontWeight.w600),),
                    Spacer(),
                    Icon(Icons.auto_graph_sharp,color: AllColors.mediumPurple,size: 20,)
                  ],
                ),
                SizedBox(height: 3,),
                Divider(thickness: 0.4,),

                SizedBox(height: 2,),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: AllColors.greenJungle,
                            ),
                            SizedBox(width:5,),
                            Text("Approved Amount: ",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),
                            Text("1.3k",style: TextStyle(fontWeight: FontWeight.w700,fontFamily: FontFamily.sfPro,fontSize: 12),),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 4,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: AllColors.vividRed,
                    ),
                    SizedBox(width:5,),
                    Text("Pending Amount: ",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),
                    Text("0",style: TextStyle(fontWeight: FontWeight.w700,fontFamily: FontFamily.sfPro,fontSize: 12),),

                  ],
                ),


                SizedBox(height: 4,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: AllColors.darkPink,
                    ),
                    SizedBox(width:5,),
                    Text("Total Order: ",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),
                    Text("0",style: TextStyle(fontWeight: FontWeight.w700,fontFamily: FontFamily.sfPro,fontSize: 12),),

                  ],
                ),

                SizedBox(height: 4,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: AllColors.mediumPurple,
                    ),
                    SizedBox(width:5,),
                    Text("Total Amount: ",style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 12),),
                    Text("1.3k",style: TextStyle(fontWeight: FontWeight.w700,fontFamily: FontFamily.sfPro,fontSize: 12),),

                  ],
                ),


              ],
            )),
        SizedBox(height: 60,)
      ],
    ),
  ),
  Positioned(
      top: 268,
      left: 75,
      child: Text("1.3K",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: AllColors.figmaGrey),))
]
    );
  }
}



class LeadData {
  final String name;
  final double value;
  final Color color;

  const LeadData(this.name, this.value, this.color);
}









