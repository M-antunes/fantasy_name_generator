import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';

import '../../../../../../../models/equip_models/loot_models/gem_model.dart';
import '../../../../../../../models/equip_models/loot_models/loot_model.dart';
import '../../../../../../../models/equip_models/loot_models/treasure_model.dart';
import '../../../../../../../models/equip_models/magic_equip_models/wonderous_items_model.dart';
import '../../../../../../../models/spell_models/spell_model.dart';
import '../../../../../../../shared/utils/utils.dart';

class LootController {
  LootModel calculateLoot(
      List<WonderousItemsModel>? list,
      int level,
      int meleePrice,
      int rangePrice,
      int armorPrice,
      int shieldPrice,
      EquipModel equip,
      String physical,
      String battleStyle,
      List<GemModel> gems,
      List<SpellModel> potions,
      int repeatedPotion) {
    LootModel loot = LootModel(items: [], jwels: [], potions: []);
    if (list != null) {
      for (var i in list) {
        loot.items!.add(TreasureModel(
            name: i.name!, qnt: 1, price: i.price!, finalPrice: i.price!));
      }
    }
    int mwPrice = level > 2 && level < 5 ? 150 : 0;
    loot.items!.add(TreasureModel(
        name: getEquipFullName(equip.meleeWeapon!, level),
        qnt: 1,
        price: meleePrice + mwPrice + mwPrice,
        finalPrice: meleePrice));
    if (physical == "Dual-wielder") {
      loot.items!.add(TreasureModel(
          name: getEquipFullName(equip.meleeWeapon!, level),
          qnt: 1,
          price: meleePrice + mwPrice + mwPrice,
          finalPrice: meleePrice));
    }
    loot.items!.add(TreasureModel(
        name: getEquipFullName(equip.rangeWeapon!, level),
        qnt: 1,
        price: rangePrice + mwPrice + mwPrice,
        finalPrice: rangePrice));
    if (equip.armour != null) {
      loot.items!.add(TreasureModel(
          name: getEquipFullName(equip.armour!, level),
          qnt: 1,
          price: armorPrice + mwPrice,
          finalPrice: armorPrice));
    }
    if (equip.shield != null) {
      loot.items!.add(TreasureModel(
          name: getEquipFullName(equip.shield!, level),
          qnt: 1,
          price: shieldPrice + mwPrice,
          finalPrice: shieldPrice));
    }
    var value = 0;
    var valuePerClass = battleStyle == "Physical"
        ? 150 * level
        : battleStyle == "Spellcaster"
            ? 800 * level
            : battleStyle == "Hybrid"
                ? 400 * level
                : 1400 * level;
    List<GemModel> availableGems = gems
        .where((element) =>
            element.availabelAfterLevel <= level &&
            element.price < valuePerClass)
        .toList();
    if (availableGems.isNotEmpty && level > 5) {
      var quantity = level > 5 ? (level / 3).floor() : 1;
      var tries = 0;
      var possibleTries = (valuePerClass / 1000).ceil();
      possibleTries = possibleTries < 0 ? 1 : possibleTries;
      while (tries < possibleTries) {
        var random = generateRandom(availableGems.length);
        var randomQnt = rollingDice(quantity);
        var totalPrice = 0;
        var itemPrice = availableGems[random].price;
        if ((itemPrice * randomQnt) < (valuePerClass - value)) {
          loot.jwels!.add(
            TreasureModel(
              name: availableGems[random].name,
              price: itemPrice,
              qnt: randomQnt,
              finalPrice: randomQnt * itemPrice,
            ),
          );
          availableGems.removeWhere(
              (element) => element.name == availableGems[random].name);
          for (var i in loot.jwels!) {
            totalPrice += i.finalPrice;
          }
        }
        value = totalPrice;
        value > valuePerClass ? tries = 50 : tries++;
      }
    }
    for (var i = 0; i < potions.length; i++) {
      var basePrice = 0;
      var potionLvl = potions[i].level == 0 ? 1 : potions[i].level;
      var potionQnt = 1;
      if (potions[i].name.contains("Cure")) {
        var curePotionMultiplierPerLvl = potions[i].level == 1
            ? 5
            : potions[i].level == 2
                ? 10
                : potions[i].level == 3
                    ? 15
                    : 1;
        basePrice = potionLvl * curePotionMultiplierPerLvl * 50;
        potionQnt = potions[i].name.contains("x2")
            ? 2
            : potions[i].name.contains("x3")
                ? 3
                : potions[i].name.contains("x4")
                    ? 4
                    : potions[i].name.contains("x5")
                        ? 5
                        : 1;
      } else {
        basePrice = potionLvl * potions[i].conjurerLevel * 50;
      }
      loot.potions!.add(
        TreasureModel(
            name: potions[i].name,
            price: basePrice,
            qnt: potions[i].name.contains("Cure") ? potionQnt : 1,
            finalPrice: potions[i].name.contains("Cure")
                ? basePrice * potionQnt
                : basePrice),
      );
    }

    var coin = battleStyle == "Physical"
        ? (rollingDice(20) * level) * 100
        : battleStyle == "Spellcaster"
            ? (rollingDice(20) * level) * 200
            : battleStyle == "Hybrid"
                ? (rollingDice(20) * level) * 150
                : (rollingDice(20) * level) * 300;
    coin = level < 5
        ? (coin / 100).floor()
        : level > 4 && level < 11
            ? (coin / 50).floor()
            : level > 10 && level < 16
                ? (coin / 10).floor()
                : level > 15 && level < 21
                    ? (coin / 2).floor()
                    : level > 20 && level < 26
                        ? (coin / 1.5).floor()
                        : (coin / 1.2).floor();
    loot.gold = coin;
    return loot;
  }
}
