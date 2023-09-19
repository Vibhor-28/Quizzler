import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget
{
  const QuestionSummary(this.summarydata,{super.key});
  final List<Map<String,Object>> summarydata;
  @override
  Widget build(context)
  {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children : summarydata.map((data) {
            return Row(
              children: [
                Text(((data['questionindex'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(data["question"] as String),
                      SizedBox(height: 10,),
                      Text(data["correct-answer"] as String),
                      SizedBox(height: 10,),
                      Text(data["user-answer"] as String)
                    ],
                  ),
                )
              ],
            );
          }).toList()
        ),
      ),
    );
  }
}