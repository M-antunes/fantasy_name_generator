import 'package:fantasy_name_generator/models/char_personal_models/char_model.dart';
import 'package:fantasy_name_generator/models/combat_models/combat_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_models/loot_model.dart';
import 'package:fantasy_name_generator/models/combat_models/resistance_model.dart';
import 'package:fantasy_name_generator/models/class_models/skill_model.dart';
import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/stats_tabs/loot/controller/loot_controller.dart';
import 'package:fantasy_name_generator/shared/data/class_data/class_data.dart';
import 'package:fantasy_name_generator/shared/data/equip_data/equip_data.dart';
import 'package:fantasy_name_generator/shared/data/equip_data/jwels_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/combat_models/base_atribute_model.dart';
import '../models/equip_models/armor_models/armor_model.dart';
import '../models/equip_models/magic_equip_models/wonderous_items_model.dart';
import '../models/class_models/specials_model.dart';
import '../models/class_models/traits_model.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/ability_scores/controller/ability_controller.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/combat/controller/defense_controller.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/combat/controller/offense_controller.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/magic_gear/controller/magic_gear_controller.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/skill/controller/skill_controller.dart';
import '../shared/data/class_data/class_traits_data/barbarian/barbarian_traits_data.dart';
import '../shared/data/combat_style_feats_data/all_feats_data.dart';
import '../shared/data/combat_style_feats_data/readied_feats_data.dart';
import '../shared/data/equip_data/enchant_data.dart';
import '../shared/data/race_data/race_data.dart';
import '../shared/data/class_data/skill_data.dart';
import '../shared/data/equip_data/wonderous_items_data.dart';
import '../shared/utils/utils.dart';

class StatsController with ChangeNotifier {
  late CharModel char;
  var listOfWonderousItems = WonderousItemsData();
  var listOfEnchants = EnchantData();
  final _equip = EquipData();
  var listOfClasses = ClassData();
  var listOfRaces = RaceData();
  var skillData = SkillData();
  var abilityCtrl = AbilityController();
  var magicGearCtrl = MagicGearController();
  var loot = LootController();
  var offense = OffenseController();
  var defense = DefenseController();
  var skillCtrl = SkillController();
  List<WonderousItemsModel> tomesAndManuals = [];
  List<SkillModel> charSkills = [];

  int armorPrice = 0;
  int shieldPrice = 0;
  int meleePrice = 0;
  int rangePrice = 0;

  bool statsGenerated = false;

  updateStats() {
    statsGenerated = !statsGenerated;
    notifyListeners();
  }

  showDescriptions(int index, dynamic list) {
    if (list[index].isSelected == true) {
      list[index].isSelected = false;
      notifyListeners();
      return;
    }
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
    notifyListeners();
  }

  resetEquipAndStats() {
    char.charEquip.armour = ArmorModel(price: 0);
    char.charEquip.shield =
        char.charEquip.shield == null ? null : ArmorModel(price: 0);
    char.charEquip.meleeWeapon = null;
    char.charEquip.rangeWeapon = null;
    char.charEquip.wonderousItems = null;
    char.baseAtributes = AtributeModel();
    char.modAtributes = AtributeModel();
    char.combatStats = CombatModel();
    char.resistances = ResistanceModel();
    char.charRace.speed = 0;
    char.hitPoints = 0;
    armorPrice = 0;
    shieldPrice = 0;
    meleePrice = 0;
    rangePrice = 0;
    traits = [];
    specials = [];
    charFeats = [];
    charLoot = LootModel();
    tomesAndManuals = [];
    charSkills = [];

    notifyListeners();
  }

  generateAll() {
    generateMagicItems();
    if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      char.charEquip.meleeWeapon =
          offense.generateGearForNonPhysicalStyleChars(_equip.allWeapons, true);
      char.charEquip.rangeWeapon = offense.generateGearForNonPhysicalStyleChars(
          _equip.allWeapons, false);
    } else {
      if (char.physicalStyle.name == "Bowman" ||
          char.physicalStyle.name == "Marksman" ||
          char.physicalStyle.name == "Thrower") {
        char.charEquip.rangeWeapon = offense.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.meleeWeapon = offense.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      } else {
        char.charEquip.meleeWeapon = offense.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.rangeWeapon = offense.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      }
      char.charEquip.shield = defense.generateShield(
          char.physicalStyle.name, char.charClass.name, _equip.allShields);
      char.charEquip.armour = defense.generateArmor(
          char.charClass.forbidenArmorType,
          char.charClass.mainAtrb,
          char.charClass.name,
          _equip.allArmors);
    }
    calculateBaseAttackBonus();
    makeWeaponMagic();
    makeArmorOrShieldMagic();
    getCombatEquipPrices();
    gettingClassTraits();
    gettingClassSpecials();
    getFeats();
    generateLoot();
    calculateSpeed();
    generateAllAtributes();
    getAtrbBoostFromWonderousItem();
    getTomesAndAMnuals();
    boostWithTomeOrManual();
    calculateAllModifiers();
    claculatingHitDefense();
    calculateResistances();
    generateHitPoints();
    gettingInitiative();
    calculateCombatManeuvers();
    calculatingPhysicalAttackAndDamage();
    calculateClassSkills();
    notifyListeners();
  }

  generateMagicItems() {
    char.charEquip.wonderousItems = [];
    if (char.charLevel < 5 && char.charLevel > 1) {
      var random = generateRandom(11);
      random < 5
          ? char.charEquip.wonderousItems!.addAll(
              magicGearCtrl.addIndispensableItem(
                  listOfWonderousItems.protRings, char.charLevel))
          : char.charEquip.wonderousItems!.addAll(
              magicGearCtrl.addIndispensableItem(
                  listOfWonderousItems.resistCloaks, char.charLevel));
      return;
    }
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.getWonderousItems(
        char.charLevel,
        char.charClass.combatStyle,
        char.charClass.mainAtrb,
        listOfWonderousItems.allItems,
        char.charClass.name));

    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
        listOfWonderousItems.protRings, char.charLevel));
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
        listOfWonderousItems.resistCloaks, char.charLevel));
    if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name == "Martial") {
      char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
          listOfWonderousItems.amuletMightyFists, char.charLevel));
    } else if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name != "Martial") {
      char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
          listOfWonderousItems.amuletOfArmor, char.charLevel));
    } else if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      List<WonderousItemsModel> posibleAmulets = listOfWonderousItems.allItems
          .where((element) => element.availability < char.charLevel)
          .toList();
      char.charEquip.wonderousItems!.addAll(
          magicGearCtrl.addIndispensableItem(posibleAmulets, char.charLevel));
    }
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addExtraIounStones(
        char.charLevel,
        listOfWonderousItems.basicIounStones,
        char.charClass.mainAtrb));
    char.charEquip.wonderousItems!.shuffle();
    notifyListeners();
  }

  //Apply magic to weapon

  makeWeaponMagic() {
    if (char.charLevel < 5) {
      return;
    } else {
      char.charEquip.meleeWeapon = offense.applyMagicToWeapon(
          char.charLevel,
          listOfEnchants.magicEnchants,
          listOfEnchants.allWeaponEnchants,
          char.physicalStyle.name,
          char.charEquip.rangeWeapon!,
          char.charEquip.meleeWeapon!,
          true);
      char.charEquip.rangeWeapon = offense.applyMagicToWeapon(
          char.charLevel,
          listOfEnchants.magicEnchants,
          listOfEnchants.allWeaponEnchants,
          char.physicalStyle.name,
          char.charEquip.rangeWeapon!,
          char.charEquip.meleeWeapon!,
          false);
    }
  }

  getCombatEquipPrices() {
    meleePrice = claculateMagicEquipPrice(char.charEquip.meleeWeapon!);
    rangePrice = claculateMagicEquipPrice(char.charEquip.rangeWeapon!);
    armorPrice = char.charEquip.armour != null
        ? ((claculateMagicEquipPrice(char.charEquip.armour!) +
                    char.charEquip.armour!.price) /
                2)
            .floor()
        : 0;
    shieldPrice = char.charEquip.shield != null
        ? ((claculateMagicEquipPrice(char.charEquip.shield!) +
                    char.charEquip.shield!.price) /
                2)
            .floor()
        : 0;
    notifyListeners();
  }

  // ===================================================================================
  //Apply magic to Armor and shield

  makeArmorOrShieldMagic() {
    char.charEquip.armour = defense.applyMagicToArmorAndShield(
        char.charLevel, listOfEnchants.magicEnchants, char.charEquip.armour!);
    char.charEquip.shield = char.charEquip.shield != null
        ? defense.applyMagicToArmorAndShield(char.charLevel,
            listOfEnchants.magicEnchants, char.charEquip.shield!)
        : null;
    notifyListeners();
  }

  //====================================================================================
  //Base Attack Bonus

  calculateBaseAttackBonus() {
    char.combatStats.baseAttackBonus = offense.calculateBaseAttackBonus(
        listOfClasses.allClasses, char.charClass.name, char.charLevel);
    notifyListeners();
  }

// ======================================================================================
  ///calculate characters speed
  calculateSpeed() {
    char.charRace.speed = offense.calculateSpeed(
        listOfRaces.races,
        char.charLevel,
        char.charRace.name,
        char.charClass.name,
        char.charRace.speed!,
        char.charEquip.armour!);
    notifyListeners();
  }

  // ===================================================================================
  //Traits part

  var barbarian = BarbarianTraitsData();
  List<SpecialsModel> specials = [];
  List<TraitModel> traits = [];

  gettingClassTraits() {
    List<TraitModel> newList = [];
    var valueList = [];
    List<TraitModel> replacementList = [];
    List<TraitModel> list = barbarian.barbarianTraits
        .where((element) => element.levelAcquired <= char.charLevel)
        .toList();
    var onlyVariableTraits =
        list.where((element) => element.multiplier != null).toList();
    list.removeWhere((element) => element.multiplier != null);
    for (var i in onlyVariableTraits) {
      var changableValue = char.charLevel - i.levelAcquired;
      if (i.levelAcquired == char.charLevel) {
        changableValue++;
      }
      changableValue = (changableValue / i.multiplier!).floor();
      valueList.add(changableValue);
    }
    var index = 0;
    for (var i in onlyVariableTraits) {
      var newString = "${i.traiName} ${valueList[index] + 1}";
      var newTrait = TraitModel(
          traiName: newString,
          levelAcquired: i.levelAcquired,
          traiDescription: i.traiDescription,
          isSelected: i.isSelected);
      newList.add(newTrait);
      index++;
    }
    replacementList.addAll(list);
    replacementList.addAll(newList);
    traits = replacementList;
    notifyListeners();
  }

  gettingClassSpecials() {
    var numberOfSpecial = (char.charLevel / 2).floor();
    List<SpecialsModel> cloneList = barbarian.ragePowers
        .where((element) => element.levelAcquired <= char.charLevel)
        .toList();
    if (char.charRace.name == "Human" || char.charRace.name == "Hafling") {
      cloneList.removeWhere((element) =>
          element.name == "Night Vision" && element.name == "Low-light Vision");
    }
    if (char.charRace.name == "Orc" ||
        char.charRace.name != "Dwarf" ||
        char.charRace.name != "Half-orc") {
      cloneList.removeWhere((element) => element.name == "Night Vision");
    }
    List<SpecialsModel> specialList = [];
    for (var i = 0; i < numberOfSpecial; i++) {
      var random = generateRandom(cloneList.length);

      specialList.add(cloneList[random]);
      cloneList.remove(cloneList[random]);
    }
    specials = specialList;
    notifyListeners();
  }

  // ====================================================================================
  // Feat part
  var classFeatList = ReariedFeatsData();
  var allFeats = AllFeatsData();
  List<TraitModel> charFeats = [];
  getFeats() {
    switch (char.physicalStyle.name) {
      case "Berserker":
        calculateFeats(classFeatList.berserkerFeats, allFeats.allFeats);
        break;
      case "Dual-weilder":
        calculateFeats(classFeatList.dualWeilderFeat, allFeats.allFeats);
        break;
      default:
    }
  }

  calculateFeats(List<TraitModel> list, List<TraitModel> allFeats) {
    List<TraitModel> feats = list;
    var numberOfFeats = char.charLevel % 2 != 0
        ? ((char.charLevel + 1) / 2).floor()
        : (char.charLevel / 2).floor();
    if (char.charClass.name == "Warrior") {
      numberOfFeats = char.charLevel;
    }
    if (char.charRace.name == "Human") {
      numberOfFeats++;
    }
    List<TraitModel> filteredFeats = [];
    filteredFeats.insert(0, AllFeatsData().reactionary);
    if (feats.length > numberOfFeats) {
      for (var i = 0; i < numberOfFeats; i++) {
        filteredFeats.add(feats[i]);
      }
      charFeats = filteredFeats;
    } else if (feats.length == numberOfFeats) {
      charFeats.addAll(feats);
    } else {
      filteredFeats.addAll(feats);
      var featsLeft = numberOfFeats - feats.length;
      for (var i = 0; i < featsLeft; i++) {
        var random = generateRandom(allFeats.length);
        var newItem = allFeats[random];
        while (filteredFeats.contains(newItem)) {
          var newRandom = generateRandom(allFeats.length);
          newItem = (allFeats[newRandom]);
        }
        filteredFeats.add(newItem);
      }
      charFeats.addAll(filteredFeats);
    }
    notifyListeners();
  }

  // ====================================================================================
  // Loot part
  LootModel charLoot = LootModel(items: [], jwels: []);
  var listOfGems = JwelsData();

  generateLoot() {
    charLoot = loot.calculateLoot(
        char.charEquip.wonderousItems!,
        char.charLevel,
        meleePrice,
        rangePrice,
        armorPrice,
        shieldPrice,
        char.charEquip,
        char.physicalStyle.name,
        char.battleStyle.name,
        listOfGems.gems);
    notifyListeners();
  }

//=======================================================================================
// Section for generation of basic atributes

  generateAllAtributes() {
    char.baseAtributes = abilityCtrl.addUpAtributeValues(
        char.charLevel,
        char.charClass.name,
        char.charRace.name,
        char.charClass.mainAtrb,
        char.charClass.combatStyle);
    notifyListeners();
  }

  //====================================================================================
  // Calculate boost to atributes by magic items

  getAtrbBoostFromWonderousItem() {
    char.baseAtributes = magicGearCtrl.getAtrbBoostFromWonderousItem(
      char.charEquip.wonderousItems!,
      char.charLevel,
      char.charClass.mainAtrb,
      char.baseAtributes,
    );
    notifyListeners();
  }

  getTomesAndAMnuals() {
    tomesAndManuals = magicGearCtrl.getTomesOrManuals(
        char.charLevel,
        char.charClass.mainAtrb,
        listOfWonderousItems.manualsAndTomes,
        char.battleStyle.name);
    notifyListeners();
  }

  boostWithTomeOrManual() {
    char.baseAtributes = magicGearCtrl.boostWithTomeOrManual(
        char.charLevel,
        char.charClass.mainAtrb,
        listOfWonderousItems.manualsAndTomes,
        tomesAndManuals,
        char.battleStyle.name,
        char.baseAtributes);
    notifyListeners();
  }

  //=====================================================================================
  // Modifier part
  calculateAllModifiers() {
    char.modAtributes = abilityCtrl.calculateAllModifiers(char.baseAtributes);
    notifyListeners();
  }

  //=====================================================================================
  // section for hit points generation

  generateHitPoints() {
    char.hitPoints = defense.generateHitPoints(char.charLevel,
        char.modAtributes.constitution, charFeats, char.charClass.hitDice!);
    notifyListeners();
  }

  claculatingHitDefense() {
    char.combatStats.armourClass = defense.claculatingHitDefense(
        char.charEquip,
        char.charLevel,
        char.modAtributes.dexterity,
        char.charRace,
        char.charClass.name,
        char.modAtributes.wisdom,
        char.charEquip.wonderousItems!,
        charFeats,
        true,
        false,
        false);
    char.combatStats.armourSurprise = defense.claculatingHitDefense(
        char.charEquip,
        char.charLevel,
        char.modAtributes.dexterity,
        char.charRace,
        char.charClass.name,
        char.modAtributes.wisdom,
        char.charEquip.wonderousItems!,
        charFeats,
        false,
        true,
        false);
    char.combatStats.armourTouch = defense.claculatingHitDefense(
      char.charEquip,
      char.charLevel,
      char.modAtributes.dexterity,
      char.charRace,
      char.charClass.name,
      char.modAtributes.wisdom,
      char.charEquip.wonderousItems!,
      charFeats,
      false,
      false,
      true,
    );
    notifyListeners();
  }

//======================================================================================
// section to generate Ac defense

  calculateResistances() {
    ResistanceModel resists = defense.calculateResistances(
        listOfClasses.goodOrBad,
        char.charLevel,
        char.charClass.resistUpgrade!,
        char.charRace.name,
        char.charClass.name,
        charFeats,
        char.modAtributes,
        char.charEquip.wonderousItems!);
    char.resistances = resists;
    notifyListeners();
  }

// ====================================================================================

// section to generate combat manouver modifiers

  calculateCombatManeuvers() {
    char.combatStats.combatManeuverBonus = offense.calculateCombatManeuvers(
        char.combatStats.baseAttackBonus!,
        char.modAtributes,
        char.charRace.name,
        charFeats,
        char.charLevel,
        true);
    char.combatStats.combatManeuverDefense = offense.calculateCombatManeuvers(
        char.combatStats.baseAttackBonus!,
        char.modAtributes,
        char.charRace.name,
        charFeats,
        char.charLevel,
        false);
    notifyListeners();
  }

// ====================================================================================

// section to generate Initiative

  gettingInitiative() {
    char.combatStats.initiative =
        offense.gettingInitiative(charFeats, char.modAtributes.dexterity);
    notifyListeners();
  }

  //=====================================================================================
  // Section for calculating Attack and Damage

  calculatingPhysicalAttackAndDamage() {
    char.combatStats.meleeAttack = offense.calculatingPhysicalAttack(
        char.charClass.mainAtrb,
        char.modAtributes,
        char.combatStats.baseAttackBonus!,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        true);
    char.combatStats.rangeAttack = offense.calculatingPhysicalAttack(
        char.charClass.mainAtrb,
        char.modAtributes,
        char.combatStats.baseAttackBonus!,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        false);
    char.combatStats.meleeDamage = offense.calculatingPhysicalDamage(
        char.charClass.mainAtrb,
        char.modAtributes,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        true);
    char.combatStats.rangeDamage = offense.calculatingPhysicalDamage(
        char.charClass.mainAtrb,
        char.modAtributes,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        false);
  }

  // =========================================================================================
  // Calculate Skilss

  calculateClassSkills() {
    charSkills = skillCtrl.calculateClassSkills(
        skillData.skills,
        char.charClass.name,
        char.charClass.skillRankPerLevel,
        char.modAtributes,
        char.charLevel,
        char.charEquip);
    notifyListeners();
  }
}
