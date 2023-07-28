import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BaseNoData extends StatelessWidget {
  const BaseNoData({
    Key? key,
    this.size,
    this.onPressed,
  }) : super(key: key);

  final double? size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          'assets/lotties/nodata.json',
          width: size,
        ),
        const Text(
          'Data Tidak Ditemukan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        TextButton.icon(
          onPressed: onPressed,
          label: const Text(
            'Refresh Data',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
