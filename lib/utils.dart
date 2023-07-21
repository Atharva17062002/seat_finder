import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget seatUpWidget(
    {int searchedSeat = 0,
    required int seatNumber,
    required String position,
    required Color backgroundColor,
    required void Function() onTap}) {
  return InkWell(
    onTap: () {
      onTap;
    },
    child: AnimatedContainer(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: searchedSeat == seatNumber
              ? backgroundColor
              : CupertinoColors.activeBlue),
      width: 60,
      height: 60,
      duration: Duration(milliseconds: 200),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            seatNumber.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            position,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
        ],
      ),
    ),
  );
}

Widget seatDownWidget(
    {int searchedSeat = 0,
    required int seatNumber,
    required String position,
    required void Function() onTap,
    required Color backgroundColor}) {
  return InkWell(
    onTap: () {
      onTap;
    },
    child: AnimatedContainer(
      decoration: BoxDecoration(
          color: searchedSeat == seatNumber
              ? backgroundColor
              : CupertinoColors.activeBlue,
          borderRadius: BorderRadius.circular(5)),
      width: 60,
      height: 60,
      duration: Duration(milliseconds: 200),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            position,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            seatNumber.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ),
  );
}

class SeatsWidget extends StatelessWidget {
  int searchedSeat;
  final int seatNumber1;
  final int seatNumber2;
  final int seatNumber3;
  final int seatNumber4;
  final int seatNumber5;
  final int seatNumber6;
  final int seatNumber7;
  final int seatNumber8;
  final Color backgroundColor;
  final VoidCallback onTap;

  SeatsWidget(
      {this.searchedSeat =0, required this.backgroundColor,
      required this.seatNumber1,
      required this.seatNumber2,
      required this.seatNumber3,
      required this.seatNumber4,
      required this.seatNumber5,
      required this.seatNumber6,
      required this.seatNumber7,
      required this.seatNumber8,
      required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.white,
              height: 140,
              width: 220,
            ),
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                height: 30,
                width: 200,
              ),
            ),
            Positioned(
              top: 109,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                height: 30,
                width: 200,
              ),
            ),
            Positioned(
              top: 72,
              left: 19,
              child: seatDownWidget(
                searchedSeat: searchedSeat,
                seatNumber: seatNumber4,
                position: 'LOWER',
                backgroundColor: backgroundColor,
                onTap: () {  },
              ),
            ),
            Positioned(
                top: 72,
                left: 80,
                child: seatDownWidget(
                  searchedSeat: searchedSeat,
                    seatNumber: seatNumber5,
                    position: 'MIDDLE',
                    backgroundColor: backgroundColor,
                    onTap: () {  })),
            Positioned(
                top: 72,
                left: 141,
                child: seatDownWidget(
                    searchedSeat: searchedSeat,
                    seatNumber: seatNumber6,
                    position: 'UPPER',
                    backgroundColor: backgroundColor,
                    onTap: () {  })),
            Positioned(
              top: 7,
              left: 19,
              child: seatUpWidget(
                  searchedSeat: searchedSeat,
                  seatNumber: seatNumber1,
                  position: 'LOWER',
                  backgroundColor: backgroundColor,
                  onTap: () { }),
            ),
            Positioned(
                top: 7,
                left: 80,
                child: seatUpWidget
                  (
                    searchedSeat: searchedSeat,
                    seatNumber: seatNumber2,
                    position: 'MIDDLE',
                    backgroundColor: backgroundColor,
                    onTap: () {  })),
            Positioned(
                top: 7,
                left: 141,
                child: seatUpWidget(
                    searchedSeat: searchedSeat,

                    seatNumber: seatNumber3,
                    position: 'UPPER',
                    backgroundColor: backgroundColor,
                    onTap: () {  })),
          ],
        ),
        const SizedBox(
          width: 80,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.white,
              height: 140,
              width: 80,
            ),
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                height: 30,
                width: 78,
              ),
            ),
            Positioned(
              top: 109,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                height: 30,
                width: 78,
              ),
            ),
            Positioned(
                top: 72,
                child: seatDownWidget(
                  searchedSeat: searchedSeat,
                    seatNumber: seatNumber7,
                    position: 'SIDE LOWER',
                    backgroundColor: backgroundColor,
                    onTap: () {  })),
            Positioned(
              top: 7,
              child: seatUpWidget(
                searchedSeat: searchedSeat,
                  seatNumber: seatNumber8,
                  position: 'SIDE UPPER',
                  backgroundColor: backgroundColor,
                  onTap: () {  }),
            ),
          ],
        )
      ],
    );
  }
}

void showsnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}