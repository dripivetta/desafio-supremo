import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../data/data_test.dart';

class BankScrollPage extends StatefulWidget {
  const BankScrollPage({Key? key}) : super(key: key);

  @override
  State<BankScrollPage> createState() => _BankScrollPageState();
}

class _BankScrollPageState extends State<BankScrollPage> {
  int currentPage = 1;
  late int totalPages;
  List<Passenger> passengers = [];

  final RefreshController refreshController = RefreshController(initialRefresh: true); 
  

  Future<bool> getPassengerData({ bool isRefresh = false}) async {

    if (isRefresh){
      currentPage = 1;
    }else {
      if(currentPage >= totalPages){
        refreshController.loadNoData();
        return false;
      }
    }
    String url =
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10";
    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = passengersDataFromJson(response.body);

      if(isRefresh){
         passengers = result.data;
      } else{
        passengers.addAll(result.data);
      }
     
      currentPage++;
      totalPages = result.totalPages;
      print(response.body);
      setState(() {

      });
      return true;
    } else {
      return false;
    }
  }
 /*
  @override
  void initState() {
    
    super.initState();
    getPassengerData();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Infinite List Pagination'),
        ),
        body: SmartRefresher(
           controller: refreshController,
           enablePullUp: true,
           onRefresh: () async {
            final result = await getPassengerData(isRefresh: true);
            if(result){
              refreshController.refreshCompleted();
            } else {
              refreshController.refreshFailed();
            }

           },
           onLoading: ()async {
             final result = await getPassengerData();
            if(result){
              refreshController.loadComplete();
            } else {
              refreshController.loadFailed();
            }

           },

          child: ListView.separated(            
            itemBuilder: (context, index) {
             final passenger = passengers[index];
              
              return ListTile(
                title: Text(passenger.name,),            
              trailing: Text(passenger.sId,)
              );
            },
          
            separatorBuilder: (context, index) =>  Divider(),
            itemCount: passengers.length,
            
          ),
        ));
  }
}
