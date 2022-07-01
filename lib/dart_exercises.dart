import 'dart:io';

void main(List<String> args) {
  printMessage();
  printOddOrEven();
  printElementsLessThanFive([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]);
}

/* Exercise 1
  Create a program that asks the user to enter their name and their age.
  Print out a message that tells how many years they have to be 100 years old.
*/
void printMessage() {
  stdout.writeln('What\'s your name?');
  String name = stdin.readLineSync()!;
  stdout.writeln('Hello $name, How old are you?');
  try {
    int age = int.parse(stdin.readLineSync()!);
    int yearsToBeHundred = 100 - age;

    if (age < 0) {
      print("Please, enter a positive integer.");
    } else if (age > 100) {
      print("You are ${-1 * yearsToBeHundred} years over 100.");
    } else {
      print('You have $yearsToBeHundred years to be 100.');
    }
  } catch (e) {
    print("Please, enter an integer value.\nException: $e");
  }
}

/* Exercise 2
  Ask the user for a number. Depending on whether the number is even or odd,
  print out an appropriate message to the user.
*/
void printOddOrEven() {
  print("Hi there, please enter a number.");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 2 == 0) {
    print("$number is Even");
  } else {
    print("$number is Odd");
  }
}

/* Exercise 3
  Take a list, say for example this one:
  a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
  and write a program that prints out all the elements of the list that are less than 5.
*/

void printElementsLessThanFive(List<int> list) {
  var newList = list.toSet().toList(); // To remove all the repetitive element.
  for (int i = 0; i < newList.length; i++) {
    if (newList[i] < 5) {
      stdout.write("${newList[i]}, ");
    }
  }
  print('');
  for (var element in newList) {
    if (element < 5) {
      stdout.write("$element, ");
    }
  }
}


