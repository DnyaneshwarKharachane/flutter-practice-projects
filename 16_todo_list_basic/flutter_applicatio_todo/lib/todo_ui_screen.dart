import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; 
import 'todo_model.dart';

class ToDoAppUI extends StatefulWidget {
  const ToDoAppUI({super.key});

  @override
  State<ToDoAppUI> createState() => _ToDoAppUIState();
}

class _ToDoAppUIState extends State<ToDoAppUI> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<ToDoModel> todoCards = [
      ToDoModel(
      title: "Web Development",
      description: "HTML , CSS , Javascript",
      date: "Aug 10 ,2025",
    ),
    ToDoModel(
      title: "Flutter",
      description: "Dart ,Stmt,sqflite , ",
      date: "Aug 02,2025",
    ),
    ToDoModel(
      title: "Java",
      description: "JVM , JAVAFX",
      date: "Aug 05,2025",
    ),
  ];

  List cardColorList = [
    Color.fromRGBO(233, 20, 197, 1),
    Color.fromRGBO(232, 237, 250, 1),
    Color.fromRGBO(250, 249, 232, 1),
    Color.fromRGBO(250, 232, 250, 1),
  ];

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void submit(bool doEdit, [ToDoModel? obj]) {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      if (doEdit) {
        obj!.title = titleController.text;
        obj.description = descriptionController.text;
        obj.date = dateController.text;
      } else {
        todoCards.add(
          ToDoModel(
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text,
          ),
        );
      }
      clearController();
      setState(() {});
    }
    Navigator.of(context).pop();
  }

  void showBottomSheet([bool doEdit = false, ToDoModel? obj]) {
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
              SizedBox(height: 10),
              Text(
                "Title",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: Color.fromRGBO(2, 167, 177, 1),
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
              SizedBox(height: 10),
              Text(
                "Description",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: Color.fromRGBO(2, 167, 177, 1),
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Date",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: Color.fromRGBO(2, 167, 177, 1),
                ),
              ),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null) {
                    dateController.text =
                        DateFormat.yMMMd().format(pickedDate);
                  }
                },
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () => submit(doEdit, obj),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(2, 167, 177, 1),
                  ),
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(2, 167, 177, 1.0),
        title: Text(
          "To-do List",
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(255, 255, 255, 1.0),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todoCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: cardColorList[index % cardColorList.length],
                borderRadius: BorderRadius.circular(20),
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todoCards[index].title,
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              todoCards[index].description,
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          todoCards[index].date,
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            titleController.text = todoCards[index].title;
                            descriptionController.text =
                                todoCards[index].description;
                            dateController.text = todoCards[index].date;
                            showBottomSheet(true, todoCards[index]);
                          },
                          child: Icon(Icons.edit_outlined),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            todoCards.removeAt(index);
                            setState(() {});
                          },
                          child: Icon(Icons.delete_outline_rounded),
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
        backgroundColor: Color.fromRGBO(2, 167, 177, 1.0),
        onPressed: () {
          showBottomSheet();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
