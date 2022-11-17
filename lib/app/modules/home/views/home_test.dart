import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  // Persisting the future as local variable to prevent refetching upon rebuilds.
  final PostgrestTransformBuilder _future =
      supabase.from('todo_table').select();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(_future);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        print(snapshot);
        List<Widget> children;
        return Container(
          child: Text(snapshot.toString()),
        );
        // return your widget with the data from snapshot
      },
    );
  }
}
