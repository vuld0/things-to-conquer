class ThingsToConquer {
  String id;
  String title;
  bool isDone;

  ThingsToConquer({
    required this.id,
    required this.title,
    this.isDone = false,
  });

   static List<ThingsToConquer> listToConquer() {
    return [
      ThingsToConquer(id: '01', title: 'Morning Excercise', isDone: true ),
      ThingsToConquer(id: '02', title: 'Buy Groceries', isDone: true ),
    ];
  }
}

