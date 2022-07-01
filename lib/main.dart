import 'dart:io';

void main(List<String> args) {
  // printMessage();
  // printOddOrEven();
  // printElementsLessThanFive([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]);
  // printDivisors();
  printCommon([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89],
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]);
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

  // One Line
  print([
    for (var i in newList)
      if (i < 5) i
  ]);
}

/* Exercise 4
  Create a program that asks the user for a number 
  and then prints out a list of all the divisors of that number.
*/
void printDivisors() {
  stdout.writeln("Hello, Please enter a number");
  int number = int.parse(stdin.readLineSync()!);
  print([
    for (int i = number; i > 0; i--)
      if (number % i == 0) i
  ]);
}

/* Exercise 5
  Take two lists, for example:
    a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  and write a program that returns a list that contains only
  the elements that are common between them (without duplicates).
  Make sure your program works on two lists of different sizes.
*/
void printCommon(List<int> list1, List<int> list2) {
  var newList1 = list1.toSet().toList();
  var newList2 = list2.toSet().toList();
  print([
    for (var i in newList1)
      for (var j in newList2)
        if (i == j) i
  ]);

  // One Line
  print(Set.from(list1).intersection(Set.from(list2)).toList());

  // for (var i in newList1) {
  //   for (var j in newList2) {
  //     if (i == j) {
  //       stdout.write("$i, ");
  //     }
  //   }
  // }
}
