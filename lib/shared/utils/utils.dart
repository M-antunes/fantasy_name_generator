import 'dart:math';

import '../../models/key_value.model.dart';
import '../data/equip_data/enchant_data.dart';

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

int claculateMagicEquipPrice(dynamic weapon) {
  int valueLabel = 0;
  if (weapon.enchantment != null) {
    if (weapon.enchantment!.length > 1) {
      var magicPrices = EnchantData();
      int price = (weapon.enchantment![0].power + weapon.enchantment![1].power);
      KeyValueModel priceAdded = magicPrices.pricingForMagicWeapons
          .firstWhere((element) => element.key == price);
      valueLabel = weapon.price + priceAdded.value + 300;
    } else {
      valueLabel = weapon.price + weapon.enchantment![0].enchantPrice + 300;
    }
  } else {
    valueLabel = weapon.price;
  }
  return valueLabel;
}
