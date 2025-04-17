class Person {
  String name;
  int age;

  Person({required this.age, required this.name});

  void intro() {
    print('Name is $name, age is $age');
  }
}

class Child extends Person {
  String house;

  Child({required String name, required int age, required this.house})
    : super(age: age, name: name);

  @override
  void intro() {
    print('Name is $name, Age is $age, house is $house house');
  }
}

void main() {
  Child child = Child(name: 'Fola', age: 14, house: 'Green');
  child.intro();
}
