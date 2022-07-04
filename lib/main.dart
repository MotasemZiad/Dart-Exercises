import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  // printMessage();
  // printOddOrEven();
  // printElementsLessThanFive([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]);
  // printDivisors();
  // printCommon([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]);
  // stdout.writeln("Enter a palindrome sentence");
  // String input = stdin.readLineSync()!;
  // if (checkPalindrome(input)) {
  //   print("your input is a palindrome.");
  // } else {
  //   print("your input is NOT a palindrome.");
  // }
  // checkPalindrome2();
  // printEvenElements([1, 4, 9, 16, 25, 36, 49, 64, 81, 100]);
  // playRockPaperScissors();
  // playRockPaperScissors2();
  // guessNumber();
  // while (true) {
  //   stdout.writeln("Enter a number");
  //   int n = int.parse(stdin.readLineSync()!);

  //   if (n == -1) {
  //     print("End");
  //     break;
  //   }
  //   if (isPrime(n)) {
  //     print("$n is a prime number");
  //   } else {
  //     print("$n is NOT a prime number");
  //   }
  // }

  // List<int> randomList = List.generate(10, (index) => Random().nextInt(100));
  // print(randomList);
  // print(newList(randomList));
  // printFirstAndLast(randomList);
  // while (true) {
  //   stdout.writeln("How many fibonacci numbers do you want to generate?");
  //   int input = int.parse(stdin.readLineSync()!);
  //   if (input == -1) {
  //     break;
  //   }
  //   print(generateFibonacciNumbers(input));
  // }
  // while (true) {
  //   stdout.writeln("Enter the length of the list");
  //   int listLength = int.parse(stdin.readLineSync()!);
  //   if (listLength == -1) {
  //     break;
  //   }
  //   List<int> listOfNumbers = List.generate(
  //     listLength,
  //     (_) => Random().nextInt(listLength),
  //   );
  //   print("Before:");
  //   print(listOfNumbers);

  //   var result = removeDuplicates(
  //     list: listOfNumbers,
  //   );
  //   print("After:");
  //   print(result);

  //   result.sort();
  //   print("After Sort:");
  //   print(result);
  // }

  // while (true) {
  //   stdout.writeln("Enter a sentence:");
  //   String input = stdin.readLineSync()!;

  //   if (input == 'exit') {
  //     break;
  //   }

  //   print(reverseString(input));
  // }

  // while (true) {
  //   stdout.writeln(
  //       "*Password Generator*\nHow strong a password do you want? Weak, Medium, or Strong:");
  //   String strength = stdin.readLineSync()!.toLowerCase();

  //   if (strength == 'exit') {
  //     break;
  //   }

  //   print(passwordGenerator(strength));
  // }
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

/* Exercise 6
  Ask the user for a string and print out whether this string is a palindrome or not.
*/
bool checkPalindrome(String input) {
  var newInput = input.toLowerCase();
  List listOfCharacters = newInput.split('');
  print(listOfCharacters);
  for (int i = 0; i < listOfCharacters.length; i++) {
    for (int j = listOfCharacters.length - 1; j >= 0; j++) {
      if (listOfCharacters[i] == listOfCharacters[j]) {
        return true;
      } else {
        return false;
      }
    }
  }
  return false;
}

// Other solution
void checkPalindrome2() {
  stdout.writeln("Enter a word, phrase, or sentence.");
  String input = stdin.readLineSync()!.toLowerCase();
  String reversedInput = input.split('').reversed.join();

  input == reversedInput
      ? print("Your input is a palindrome")
      : print("Your input is not a palindrome");
}

/* Exercise 7
  Let’s say you are given a list saved in a variable:
    a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]. 
  Write a Dart code that takes this list and makes a new list
  that has only the even elements of this list in it.
*/
printEvenElements(List<int> list) {
  List<int> newList = [];
  for (var i in list) {
    if (i % 2 == 0) {
      newList.add(i);
    }
  }
  print(newList);

  // One Line
  print([
    for (var i in list)
      if (i % 2 == 0) i
  ]);
}

/* Exercise 8
  Make a two-player Rock-Paper-Scissors game against computer.
  `Ask for player’s input, compare them, print out a message to the winner.`
*/
void playRockPaperScissors() {
  print("Rock Paper Scissors Game");
  stdout.writeln("Player I\nWhat do you want to choose?");
  String input1 = stdin.readLineSync()!.toLowerCase();
  stdout.writeln("Player II\nWhat do you want to choose?");
  String input2 = stdin.readLineSync()!.toLowerCase();

  if (input1 == input2) {
    print("Draw");
  } else if (input1 == "rock" && input2 == "scissors") {
    print("Player I win");
  } else if (input1 == "scissors" && input2 == "rock") {
    print("Player II win");
  } else if (input1 == "paper" && input2 == "rock") {
    print("Player I win");
  } else if (input1 == "rock" && input2 == "paper") {
    print("Player II win");
  } else if (input1 == "scissors" && input2 == "paper") {
    print("Player I win");
  } else if (input1 == "paper" && input2 == "scissors") {
    print("Player II win");
  } else {
    print("Please, enter a valid input");
  }
}

// Other solution
void playRockPaperScissors2() {
  print("Welcome to the Rock, Paper, Scissors\nType 'exit' to stop the game");
  final random = Random();

  Map<String, String> rules = {
    "rock": "scissors",
    "scissors": "paper",
    "paper": "rock",
  };

  int userScore = 0;
  int computerScore = 0;

  List<String> options = ["rock", "paper", "scissors"];

  while (true) {
    String computerChoice = options[random.nextInt(options.length - 1)];
    stdout.writeln("Please choose Rock, Paper, or Scissors:");
    String userChoice = stdin.readLineSync()!.toLowerCase();

    if (userChoice == "exit") {
      print("You $userScore :: Computer $computerScore\nBye Bye!");
      break;
    }

    if (!options.contains(userChoice)) {
      print("Incorrect choice");
      continue;
    } else if (computerChoice == userChoice) {
      print("Draw! We have a tie");
    } else if (rules[computerChoice] == userChoice) {
      print("Computer wins: $computerChoice VS. $userChoice");
      computerScore++;
    } else if (rules[userChoice] == computerChoice) {
      print("You win: $userChoice VS. $computerChoice");
      userScore++;
    }
  }
}

/* Exercise 9
  Generate a random number between 1 and 100. Ask the user to guess the number,
  then tell them whether they guessed too low, too high, or exactly right.
  Keep track of how many guesses the user has taken, and when the game ends, print this out.
*/
void guessNumber() {
  var randomNumber = Random().nextInt(101);
  int attempt = 0;
  print("Guessing Game!\nType '-1' to end the game.");
  while (true) {
    attempt += 1;
    stdout.writeln("Guess a number from 1 to 100: ");
    int number = int.parse(stdin.readLineSync()!);

    if (number == -1) {
      print("You tried $attempt times\nBye :)");
      break;
    }

    if (number > 100 || number < 0) {
      print("Please choose a number between 0 and 100");
      continue;
    } else if (number == randomNumber) {
      print("Your guess is right! you tried $attempt times");
      break;
    } else if (number > randomNumber) {
      print("You are higher");
      continue;
    } else if (number < randomNumber) {
      print("You are lower");
      continue;
    }
  }
}

/* Exercise 10
  Ask the user for a number and determine whether the number is prime or not.
  `Do it using a function`
*/
bool isPrime(int number) {
  List<int> divisors = [
    for (int i = 1; i <= number; i++)
      if (number % i == 0) i
  ];
  print(divisors);
  if (divisors.length == 2) {
    return true;
  } else {
    return false;
  }
}

/* Exercise 11
  Write a program that takes a list of numbers for example
    a = [5, 10, 15, 20, 25]
  and makes a new list of only the first and last elements of the given list.
  For practice, write this code inside a function.
*/
void printFirstAndLast(List<int> list) {
  print("First Element: ${list[0]}\nLast Element: ${list[list.length - 1]}");

  // Other method
  print("First Element: ${list.first}\nLast Element: ${list.last}");
}

List<int> newList(List<int> initialList) {
  return [initialList.first, initialList.last];
}

/* Exercise 12
  Write a program that asks the user how many Fibonacci numbers to generate and then generates them.
  Take this opportunity to think about how you can use functions.
  `Make sure to ask the user to enter the number of numbers in the sequence to generate.`
*/
List<int> generateFibonacciNumbers(int input) {
  List<int> fibonacciNumbers = [1, 1];

  for (int i = 0; i <= input; i++) {
    fibonacciNumbers.add(fibonacciNumbers[i] + fibonacciNumbers[i + 1]);
  }

  return fibonacciNumbers;
}

/* Exercise 13
  Write a program (function) that takes a list and returns a new list
  that contains all the elements of the first list minus all the duplicates.
*/
List<int> removeDuplicates({required List<int> list}) => list.toSet().toList();

/* Exercise 14
  Write a program (using functions!) that asks the user for a long string containing multiple words.
  Print back to the user the same string, except with the words in backwards order.
  For example, say I type the string:
    `My name is Michele`
  Then I would see the string:
    `Michele is name My`
*/
String reverseString(String input) {
  // final listOfReversedWords = input.split(' ').reversed;
  // return listOfReversedWords.join(' ');

  // One line
  return input.split(' ').reversed.join(' ');
}

/* Exercise 15
  Write a password generator in Dart.
  Be creative with how you generate passwords - strong passwords have a mix of lowercase letters, uppercase letters, numbers, and symbols.
  The passwords should be random, generating a new password every time the user asks for a new password.
  Include your run-time code in a main method.
  
  `Ask the user how strong they want their password to be.
  For weak passwords, pick a word or two from a list.`

  :exclamation: Do not use the generated password in your real accounts. Use 1password.
*/
String passwordGenerator(String strength) {
  switch (strength) {
    case "weak":
      return shuffleGenerator(6);
    case "medium":
      return shuffleGenerator(12);
    case "strong":
      return shuffleGenerator(18);
    default:
      return "Incorrect word is given";
  }
}

String shuffleGenerator(int length) {
  final random = Random.secure();
  List<int> listOfAsciiCode = List.generate(
    length,
    (index) => random.nextInt(255),
  );
  List<String> listOfCharacters =
      base64UrlEncode(listOfAsciiCode).split('').toList();

  listOfCharacters.shuffle();
  return listOfCharacters.join('');
}
