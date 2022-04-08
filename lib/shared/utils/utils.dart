import 'dart:math';

int generateRandom(int number) {
  Random i = Random();
  var newNumber = i.nextInt(number);
  if (newNumber == number) {
    newNumber--;
  }
  return newNumber;
}
