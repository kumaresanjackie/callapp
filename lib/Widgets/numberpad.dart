import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class FutureDemoPage extends StatelessWidget {
  Future getData() {
    return Future.delayed(Duration(seconds: 0), () async {
      Iterable<CallLogEntry> entries = await CallLog.query();
      for (var item in entries) {
        print(item.number as String);
        getTitle(CallLogEntry entry) {
          if (entry.name == null) return Text(entry.number as String);
          if (entry.name!.isEmpty)
            return Text(entry.number as String);
          else
            return Text(entry.name as String);
        }

        getnumber(CallLogEntry entry) {
          if (entry.number == null) return Text(entry.number as String);
          if (entry.number!.isEmpty)
            return Text(entry.number as String);
          else
            return Text(entry.number as String);
        }

        return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (ctx, int index) {
              return Card(
                child: ListTile(
                  title: getTitle(entries.elementAt(index)),
                  subtitle: getnumber(entries.elementAt(index)),
                ),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (
        ctx,
        AsyncSnapshot<dynamic> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occured',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return data;
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: getData(),
    );
  }
}
