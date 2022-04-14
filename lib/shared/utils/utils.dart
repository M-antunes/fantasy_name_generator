import 'dart:math';

int generateRandom(int number) {
  Random i = Random();
  var newNumber = i.nextInt(number);
  if (newNumber == number) {
    newNumber--;
  }
  return newNumber;
}

int rollingDice(int dice) {
  Random i = Random();
  var randomRoll = i.nextInt(dice);
  while (randomRoll < 1) {
    randomRoll = i.nextInt(dice);
  }
  return randomRoll;
}

formatGoldPiece(int price) {
  var f = price.toString();
  if (f.length == 4) {
    String first = f.substring(0, 1);
    String second = f.substring(1);
    return "$first,$second gp";
  } else if (f.length == 5) {
    String first = f.substring(0, 2);
    String second = f.substring(2);
    return "$first,$second gp";
  } else if (f.length == 6) {
    String first = f.substring(0, 3);
    String second = f.substring(4);
    return "$first,$second gp";
  } else if (f.length == 7) {
    String first = f.substring(0, 1);
    String second = f.substring(2, 4);
    String third = f.substring(5);
    return "$first,$second,$third gp";
  } else {
    return "$f gp";
  }
}

int discoverMinAvailability(int lvAvailable) {
  var minLvAvailable = 0;
  if (lvAvailable > 8) {
    minLvAvailable = lvAvailable - 8;
  }
  return minLvAvailable;
}
