import 'dart:convert';

import 'package:fantasy_name_generator/shared/data/default_char_model_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'imports.dart';

class StatsController with ChangeNotifier {
  CharModel char = DefaultCharModelData().defaultCharModel;
  var listOfWonderousItems = WonderousItemsData();
  var listOfEnchants = EnchantData();
  final _equip = EquipData();
  var listOfClasses = ClassData();
  var listOfRaces = RaceData();
  var skillData = SkillData();
  var appearanceCtrl = AppearanceController();
  var abilityCtrl = AbilityController();
  var magicGearCtrl = MagicGearController();
  var lootCtrl = LootController();
  var offenseCtrl = OffenseController();
  var defenseCtrl = DefenseController();
  var skillCtrl = SkillController();
  List<WonderousItemsModel> tomesAndManuals = [];
  List<SkillModel> charSkills = [];

  int armorPrice = 0;
  int shieldPrice = 0;
  int meleePrice = 0;
  int rangePrice = 0;

  bool statsGenerated = false;

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
    char.charEquip.armour = ArmorModel();
    char.charEquip.shield = char.charEquip.shield == null ? null : ArmorModel();
    char.charEquip.meleeWeapon = null;
    char.charEquip.rangeWeapon = null;
    char.charEquip.wonderousItems = null;
    char.baseAtributes = AtributeModel();
    char.modAtributes = AtributeModel();
    char.combatStats = CombatModel();
    char.resistances = ResistanceModel();
    char.charRace.speed = 0;
    char.charRace.age = 0;
    char.charRace.height!.value = 0;
    char.charRace.height!.key = 0;
    char.charRace.weight = 0;
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
    statsGenerated = false;
    notifyListeners();
  }

  generateAll() {
    generateMagicItems();
    if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      char.charEquip.meleeWeapon = offenseCtrl
          .generateGearForNonPhysicalStyleChars(_equip.allWeapons, true);
      char.charEquip.rangeWeapon = offenseCtrl
          .generateGearForNonPhysicalStyleChars(_equip.allWeapons, false);
    } else {
      if (char.physicalStyle.name == "Bowman" ||
          char.physicalStyle.name == "Marksman" ||
          char.physicalStyle.name == "Thrower") {
        char.charEquip.rangeWeapon = offenseCtrl.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.meleeWeapon = offenseCtrl.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      } else {
        char.charEquip.meleeWeapon = offenseCtrl.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.rangeWeapon = offenseCtrl.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      }
      char.charEquip.shield = defenseCtrl.generateShield(
          char.physicalStyle.name, char.charClass.name, _equip.allShields);
      char.charEquip.armour = defenseCtrl.generateArmor(
          char.charClass.forbidenArmorType,
          char.charClass.mainAtrb,
          char.charClass.name,
          _equip.allArmors);
    }
    getCharPersonalAppearance();
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
    statsGenerated = true;
    notifyListeners();
  }

  getCharPersonalAppearance() {
    char.charRace = appearanceCtrl.applyHeightAndWeight(
        listOfRaces.races,
        listOfClasses.allClasses,
        char.charRace.name,
        char.charClass.name,
        char.charLevel,
        char.charRace,
        char.charClass.mainAtrb);
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
      char.charEquip.meleeWeapon = offenseCtrl.applyMagicToWeapon(
          char.charLevel,
          listOfEnchants.magicEnchants,
          listOfEnchants.allWeaponEnchants,
          char.physicalStyle.name,
          char.charEquip.rangeWeapon!,
          char.charEquip.meleeWeapon!,
          true);
      char.charEquip.rangeWeapon = offenseCtrl.applyMagicToWeapon(
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
    meleePrice = offenseCtrl.claculateWeaponPrice(
        char.charEquip.meleeWeapon!, char.charLevel);
    rangePrice = offenseCtrl.claculateWeaponPrice(
        char.charEquip.rangeWeapon!, char.charLevel);
    armorPrice = char.charEquip.armour != null
        ? defenseCtrl.claculateMagicEquipPrice(
            char.charEquip.armour!, char.charLevel)
        : 0;
    shieldPrice = char.charEquip.shield != null
        ? defenseCtrl.claculateMagicEquipPrice(
            char.charEquip.shield!, char.charLevel)
        : 0;
    notifyListeners();
  }

  // ===================================================================================
  //Apply magic to Armor and shield

  makeArmorOrShieldMagic() {
    char.charEquip.armour = defenseCtrl.applyMagicToArmorAndShield(
        char.charLevel, listOfEnchants.magicEnchants, char.charEquip.armour!);
    char.charEquip.shield = char.charEquip.shield != null
        ? defenseCtrl.applyMagicToArmorAndShield(char.charLevel,
            listOfEnchants.magicEnchants, char.charEquip.shield!)
        : null;
    notifyListeners();
  }

  //====================================================================================
  //Base Attack Bonus

  calculateBaseAttackBonus() {
    char.combatStats.baseAttackBonus = offenseCtrl.calculateBaseAttackBonus(
        listOfClasses.allClasses, char.charClass.name, char.charLevel);
    notifyListeners();
  }

// ======================================================================================
  ///calculate characters speed
  calculateSpeed() {
    char.charRace.speed = offenseCtrl.calculateSpeed(
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
    charLoot = lootCtrl.calculateLoot(
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
    char.hitPoints = defenseCtrl.generateHitPoints(char.charLevel,
        char.modAtributes.constitution, charFeats, char.charClass.hitDice!);
    notifyListeners();
  }

  claculatingHitDefense() {
    char.combatStats.armourClass = defenseCtrl.claculatingHitDefense(
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
    char.combatStats.armourSurprise = defenseCtrl.claculatingHitDefense(
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
    char.combatStats.armourTouch = defenseCtrl.claculatingHitDefense(
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
    ResistanceModel resists = defenseCtrl.calculateResistances(
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
    char.combatStats.combatManeuverBonus = offenseCtrl.calculateCombatManeuvers(
        char.combatStats.baseAttackBonus!,
        char.modAtributes,
        char.charRace.name,
        charFeats,
        char.charLevel,
        true);
    char.combatStats.combatManeuverDefense =
        offenseCtrl.calculateCombatManeuvers(
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
        offenseCtrl.gettingInitiative(charFeats, char.modAtributes.dexterity);
    notifyListeners();
  }

  //=====================================================================================
  // Section for calculating Attack and Damage

  calculatingPhysicalAttackAndDamage() {
    int meleeEnchant = char.charEquip.meleeWeapon!.enchantment == null
        ? 0
        : char.charEquip.meleeWeapon!.enchantment!.isNotEmpty
            ? char.charEquip.meleeWeapon!.enchantment![0].power
            : 0;
    int rangeEnchant = char.charEquip.rangeWeapon!.enchantment == null
        ? 0
        : char.charEquip.rangeWeapon!.enchantment!.isNotEmpty
            ? char.charEquip.rangeWeapon!.enchantment![0].power
            : 0;
    char.combatStats.meleeAttack = offenseCtrl.calculatingPhysicalAttack(
        char.charClass.mainAtrb,
        char.modAtributes,
        char.combatStats.baseAttackBonus!,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        meleeEnchant,
        rangeEnchant,
        true);
    char.combatStats.rangeAttack = offenseCtrl.calculatingPhysicalAttack(
        char.charClass.mainAtrb,
        char.modAtributes,
        char.combatStats.baseAttackBonus!,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        meleeEnchant,
        rangeEnchant,
        false);
    char.combatStats.meleeDamage = offenseCtrl.calculatingPhysicalDamage(
        char.charClass.mainAtrb,
        char.modAtributes,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        meleeEnchant,
        rangeEnchant,
        true);
    char.combatStats.rangeDamage = offenseCtrl.calculatingPhysicalDamage(
        char.charClass.mainAtrb,
        char.modAtributes,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        meleeEnchant,
        rangeEnchant,
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

  updateCharModel() {
    char.loot = charLoot;
    char.charClass.traits = traits;
    char.charClass.speacials = specials;
    char.feats = charFeats;
    char.skills = charSkills;
    char.charEquip.tomesAndManuals = tomesAndManuals;
    notifyListeners();
  }

  Future saveChar(CharModel char) async {
    updateCharModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var charMap = char.toJson();
    String json = jsonEncode(charMap);
    prefs.setString("char", json);
  }
}
