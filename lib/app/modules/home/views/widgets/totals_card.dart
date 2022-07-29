import 'package:az_proof/app/az_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TotalsCard extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String description;
  final double amount;

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
              const SizedBox(height: 24),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                  color: AzColors.deepBlueGray,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                NumberFormat.simpleCurrency(locale: 'pt_BR').format(amount),
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                  color: AzColors.deepBlueGray,
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
