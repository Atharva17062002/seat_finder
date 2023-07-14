import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:seat_finder/app_data.dart';
import 'package:seat_finder/utils.dart';

class SeatAvailabilityScreen extends StatefulWidget {
  const SeatAvailabilityScreen({super.key});

  @override
  State<SeatAvailabilityScreen> createState() => _SeatAvailabilityScreenState();
}
AutoScrollController? controller;
class _SeatAvailabilityScreenState extends State<SeatAvailabilityScreen> {

  int searchSeat = 0;
  // bool isButtonTapped = false; // Initial state of the button

  // void onTap() {
  //   setState(() {
  //     // Toggle the state of the button
  //     isButtonTapped = !isButtonTapped;
  //   });
  // }
  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }



  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Finder'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Colors.grey[200],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Enter text',
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await controller!.scrollToIndex(int.parse(searchController.text.trim())~/8, preferPosition: AutoScrollPosition.middle);
                      print(searchController.text);
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {
                        searchSeat = int.parse(searchController.text.trim());

                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent)),
                    child: const Text(
                      'Find',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
             Container(
               height: MediaQuery.of(context).size.height*0.8,
                child: ListView.builder(
                  controller: controller,

                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    // Return the widget for each item in the list
                    return AutoScrollTag(
                      key: ValueKey(index),
                      controller: controller!,
                      index: index,
                      child: SeatsWidget(searchedSeat: searchSeat ,
                          backgroundColor: Colors.green, seatNumber1: (index*8)+1, seatNumber2: (index*8)+2, seatNumber3: (index*8)+3, seatNumber4: (index*8)+4, seatNumber5: (index*8)+5, seatNumber6: (index*8)+6, seatNumber7:(index*8)+7, seatNumber8: (index*8)+8, onTap: (){}),
                    );
                  },),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

