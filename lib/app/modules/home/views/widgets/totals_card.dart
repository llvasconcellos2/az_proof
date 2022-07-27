import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TotalsCard extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String description;
  final String amount;

  const TotalsCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.description,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/$icon',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                  color: Color(0xFF59666F),
                  height: 1.2,
                ),
              ),
              SizedBox(height: 8),
              Text(
                amount,
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                  color: Color(0xFF59666F),
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
