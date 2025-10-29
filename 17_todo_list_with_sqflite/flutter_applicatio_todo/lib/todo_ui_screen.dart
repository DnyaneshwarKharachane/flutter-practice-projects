import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'database.dart';
import 'todo_model.dart';

class ToDoAppUI extends StatefulWidget {
  const ToDoAppUI({super.key});

  @override
  State<ToDoAppUI> createState() => _ToDoAppUIState();
}

class _ToDoAppUIState extends State<ToDoAppUI> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final TodoDatabase _db = TodoDatabase.instance;
  List<ToDoModel> todoCards = [];

  final List<Color> cardColorList = [
    Color.fromRGBO(250, 232, 232, 1),
    Color.fromRGBO(232, 237, 250, 1),
    Color.fromRGBO(250, 249, 232, 1),
    Color.fromRGBO(250, 232, 250, 1),
  ];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final items = await _db.getTodoItems();
    setState(() {
      todoCards = items;
    });
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  Future<void> submit(bool doEdit, [ToDoModel? obj]) async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      if (doEdit && obj != null) {
        obj.title = titleController.text;
        obj.description = descriptionController.text;
        obj.date = dateController.text;
        await _db.updateTodoItem(obj);
      } else {
        final newItem = ToDoModel(
          title: titleController.text,
          description: descriptionController.text,
          date: dateController.text,
        );
        await _db.insertTodoItem(newItem);
      }
      clearController();
      await _loadTodos();
    }
    if (mounted) Navigator.of(context).pop();
  }

  void showBottomSheet([bool doEdit = false, ToDoModel? obj]) {
    if (doEdit && obj != null) {
      titleController.text = obj.title;
      descriptionController.text = obj.description;
      dateController.text = obj.date;
    } else {
      clearController();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  doEdit ? "Edit To-Do Task" : "Create To-Do Task",
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Title",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: const Color.fromRGBO(2, 167, 177, 1),
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Description",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(2, 167, 177, 1),
                ),
              ),
              TextField(
                controller: descriptionController,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Date",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: const Color.fromRGBO(2, 167, 177, 1),
                ),
              ),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2035),
                  );
                  if (pickedDate != null) {
                    dateController.text =
                        DateFormat.yMMMd().format(pickedDate);
                  }
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () => submit(doEdit, obj),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
                  ),
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _deleteItem(int id) async {
    await _db.deleteTodoItem(id);
    await _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1.0),
        title: Text(
          "To-do List with SQFlite",
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(255, 255, 255, 1.0),
          ),
        ),
      ),
      body: todoCards.isEmpty
          ? Center(
              child: Text(
                "No tasks yet. Tap + to add.",
                style: GoogleFonts.quicksand(
                fontSize: 20,
                 color: Colors.white, ),
              ),
            )
          : ListView.builder(
              itemCount: todoCards.length,
              itemBuilder: (context, index) {
                final item = todoCards[index];

                // ✅ Print debug info to ensure color is assigned properly
                print('Card color at index $index → ${cardColorList[index % cardColorList.length]}');

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      // ✅ Apply dynamic color from cardColorList
                      color: cardColorList[index % cardColorList.length],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 123, 185, 213),
                                ),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child: Image.asset(
                                      'assets/logo.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.description,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                    ),
                                    maxLines: null,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                item.date,
                                style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  showBottomSheet(true, item);
                                },
                                child: const Icon(Icons.edit_outlined),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  if (item.id != null) _deleteItem(item.id!);
                                },
                                child: const Icon(Icons.delete_outline_rounded),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1.0),
        onPressed: () {
          showBottomSheet(false, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
