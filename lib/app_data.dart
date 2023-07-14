import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier{
  int _searchedSeat=0;
      int getSearchedSeat(){
    return _searchedSeat;
      }
      void changeSearchedSeat(int newSeat){
    _searchedSeat=newSeat;
      notifyListeners();
      }

}