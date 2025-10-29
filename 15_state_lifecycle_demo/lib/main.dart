import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool showContainer = true;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Life Cycle"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 16, 204, 246),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showContainer = true;
                setState(() {});
              },
              child: const Text("SHOW CONTAINER"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showContainer = false;
                setState(() {});
              },
              child: const Text("REMOVE CONTAINER"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counter++;
                setState(() {});
              },
              child: const Text("INCREMENT COUNTER"),
            ),
            const SizedBox(height: 20),
            if (showContainer) ChildWidget(value: counter), 
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  final int value;
  const ChildWidget({super.key, required this.value});

  @override
  State createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void initState() {
    super.initState();
    print("In initState()");
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("In didUpdateWidget(), oldValue=${oldWidget.value}, newValue=${widget.value}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("In didChangeDependencies()");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("In deactivate()");
  }

  @override
  void dispose() {
    super.dispose();
    print("In dispose()");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 38, 235, 225),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "Counter: ${widget.value}",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
