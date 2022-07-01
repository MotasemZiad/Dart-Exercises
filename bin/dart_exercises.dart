import 'dart:io';

void main(List<String> arguments) {
  print('What\'s your name?');
  String name = stdin.readLineSync()!;
  print('Hello $name, How old are you?');
  int age = int.parse(stdin.readLineSync()!);
  int yearsToBeHundred = 100 - age;
  print('You have $yearsToBeHundred years to be 100');
}

int calculate() {
  return 6 * 8;
}
