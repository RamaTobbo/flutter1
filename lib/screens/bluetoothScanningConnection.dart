// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:track_pro/widgets/bleController.dart';

// class Bluetoothscanningconnection extends StatelessWidget {
//   const Bluetoothscanningconnection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<Blecontroller>(
//             initialData: Blecontroller(),
//             stream: null,
//             builder: (context, snapshot) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 180,
//                       width: double.infinity,
//                       color: Colors.blue,
//                       child: const Center(
//                         child: Text("Bluettoth App"),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Blecontroller().scanDevices();
//                       },
//                       child: const Text('scan'),
//                     ),
//                     StreamBuilder<List<ScanResult>>(
//                         stream: Blecontroller().scanResult,
//                         builder: (ctx, snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: snapshot.data!.length,
//                               itemBuilder: (context, index) {
//                                 final data = snapshot.data![index];
//                                 return Card(
//                                   elevation: 2,
//                                   child: ListTile(
//                                     title: Text(data.device.advName),
//                                     subtitle: Text(data.device.remoteId.str),
//                                     trailing: Text(data.rssi.toString()),
//                                   ),
//                                 );
//                               },
//                             );
//                           } else {
//                             return const Center(
//                               child: Text('No device found'),
//                             );
//                           }
//                         }),
//                   ],
//                 ),
//               );
//             }));
//   }
// }
