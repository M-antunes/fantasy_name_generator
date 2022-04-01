import 'package:fantasy_name_generator/models/equip_models/enchant_model.dart';

class EnchantData {
  List<EnchantModel> magicEnchants = [
    EnchantModel(
      enchant: "+1",
      availability: 5,
      power: 1,
      enchantPrice: 2000,
      magicalPorperty: "+1 bunos applied to attack and damage",
    ),
    EnchantModel(
      enchant: "+2",
      availability: 8,
      power: 2,
      enchantPrice: 8000,
      magicalPorperty: "+2 bunos applied to attack and damage",
    ),
    EnchantModel(
      enchant: "+3",
      availability: 12,
      power: 3,
      enchantPrice: 18000,
      magicalPorperty: "+3 bunos applied to attack and damage",
    ),
    EnchantModel(
      enchant: "+4",
      availability: 16,
      power: 4,
      enchantPrice: 32000,
      magicalPorperty: "+4 bunos applied to attack and damage",
    ),
    EnchantModel(
      enchant: "+5",
      availability: 18,
      power: 5,
      enchantPrice: 50000,
      magicalPorperty: "+5 bunos applied to attack and damage",
    ),
  ];

  List<EnchantModel> allWeaponEnchants = [
    EnchantModel(
      enchant: "Dueling",
      availability: 8,
      power: 0,
      enchantPrice: 14000,
      magicalPorperty:
          "A dueling weapon (which must be a weapon that can be used with the Weapon Finesse feat) gives the wielder a +4 enhancement bonus on initiative checks, provided the weapon is drawn and in hand when the Initiative check is made. It provides a +2 bonus on disarm checks and feint checks, a +2 bonus to CMD to resist disarm attempts, and a +2 to the DC to perform a feint against the wielder.",
    ),
    EnchantModel(
      enchant: "Bane",
      availability: 5,
      power: 0,
      enchantPrice: 2000,
      magicalPorperty:
          "A bane weapon excels against certain foes. Against a designated foe, the weapon's enhancement bonus is +2 better than its actual bonus. It also deals an extra 2d6 points of damage against such foes. Choose a subtype.",
      additionalDiceDamage: "+2d6 bane",
    ),
    EnchantModel(
      enchant: "Called",
      availability: 5,
      power: 0,
      enchantPrice: 2000,
      magicalPorperty:
          "A called weapon can be teleported to the wielder's hand as a swift action that does not provoke attacks of opportunity, even if the weapon is in the possession of another creature. This ability has a maximum range of 100 feet, and effects that block teleportation prevent the return of a called weapon. A called weapon must be in a creature's possession for at least 24 hours for this ability to function.",
    ),
    EnchantModel(
      enchant: "Flaming",
      availability: 5,
      power: 0,
      enchantPrice: 2000,
      magicalPorperty:
          "Upon command, a flaming weapon is sheathed in fire that deals an extra 1d6 points of fire damage on a successful hit. The fire does not harm the wielder. The effect remains until another command is given.",
      additionalDiceDamage: "+1d6 fire",
    ),
    EnchantModel(
      enchant: "Frost",
      availability: 5,
      power: 0,
      enchantPrice: 2000,
      magicalPorperty:
          "Upon command, a frost weapon is sheathed in a terrible, icy cold that deals an extra 1d6 points of cold damage on a successful hit. The cold does not harm the wielder. The effect remains until another command is given.",
      additionalDiceDamage: "+1d6 cold",
    ),
    EnchantModel(
      enchant: "Ghost touch",
      availability: 6,
      power: 0,
      enchantPrice: 2000,
      magicalPorperty:
          "A ghost touch weapon deals damage normally against incorporeal creatures, regardless of its bonus. An incorporeal creature's 50% reduction in damage from corporeal sources does not apply to attacks made against it with ghost touch weapons. The weapon can be picked up and moved by an incorporeal creature at any time. A manifesting ghost can wield the weapon against corporeal foes. Essentially, a ghost touch weapon counts as both corporeal or incorporeal.",
    ),
    EnchantModel(
      enchant: "Planar",
      availability: 6,
      power: 0,
      enchantPrice: 2000,
      magicalPorperty:
          "A planar weapon is effective against all types of extradimensional beings, able to pierce their resistance to physical harm. When used to attack outsiders, a planar weapon ignores 5 points of their damage reduction.",
    ),
    EnchantModel(
        enchant: "Shock",
        availability: 5,
        power: 0,
        enchantPrice: 2000,
        magicalPorperty:
            "Upon command, a shock weapon is sheathed in crackling electricity that deals an extra 1d6 points of electricity damage on a successful hit. The electricity does not harm the wielder. The effect remains until another command is given.",
        additionalDiceDamage: "+1d6 shock"),
    EnchantModel(
        enchant: "Thundering",
        availability: 5,
        power: 0,
        enchantPrice: 2000,
        magicalPorperty:
            "A thundering weapon creates a cacophonous roar like thunder whenever it strikes a target with a successful critical hit. The sonic energy does not harm the wielder. A thundering weapon deals an extra 1d8 points of sonic damage on a successful critical hit. If the weapon's critical multiplier is ×3, add an extra 2d8 points of sonic damage instead, and if the multiplier is ×4, add an extra 3d8 points of sonic damage. Subjects dealt critical hits by a thundering weapon must make a successful DC 14 Fortitude save or be deafened permanently.",
        additionalDiceDamage: "+1d6 shock"),
    EnchantModel(
        enchant: "Corrosive",
        availability: 5,
        power: 0,
        enchantPrice: 2000,
        magicalPorperty:
            "Upon command, a corrosive weapon becomes slick with acid that deals an extra 1d6 points of acid damage on a successful hit. The acid does not harm the wielder. The effect remains until another command is given.",
        additionalDiceDamage: "+1d6 acid"),
    EnchantModel(
        enchant: "Corrosive burst",
        availability: 8,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "A Corrosive burst weapon functions as a corrosive weapon that explodes with searing acid upon striking a successful critical hit. The acid does not harm the wielder. In addition to the extra acid damage from the corrosive special ability, a Corrosive burst weapon deals an extra 1d10 points of acid damage on a successful critical hit. If the weapon's critical modifier is ×3, add an extra 2d10 points of acid damage instead, and if the modifier is ×4, add an extra 3d10 points.",
        additionalDiceDamage: "+1d6 acid"),
    EnchantModel(
        enchant: "Flaming burst",
        availability: 8,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "A flaming burst weapon functions as a flaming weapon that also explodes with flame upon striking a successful critical hit. The fire does not harm the wielder. In addition to the extra fire damage from the flaming ability (see above), a flaming burst weapon deals an extra 1d10 points of fire damage on a successful critical hit. If the weapon's critical multiplier is ×3, add an extra 2d10 points of fire damage instead, and if the multiplier is ×4, add an extra 3d10 points of fire damage.",
        additionalDiceDamage: "+1d6 fire"),
    EnchantModel(
        enchant: "Holy",
        availability: 8,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "A holy weapon is imbued with holy power. This power makes the weapon good-aligned and thus bypasses the corresponding damage reduction. It deals an extra 2d6 points of damage against all creatures of evil alignment. It bestows one permanent negative level on any evil creature attempting to wield it. The negative level remains as long as the weapon is in hand and disappears when the weapon is no longer wielded. This negative level cannot be overcome in any way (including by restoration spells) while the weapon is wielded.",
        additionalDiceDamage: "+2d6 against evil"),
    EnchantModel(
        enchant: "Icy burst",
        availability: 8,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "An icy burst weapon functions as a frost weapon that also explodes with frost upon striking a successful critical hit. The frost does not harm the wielder. In addition to the extra damage from the frost ability, an icy burst weapon deals an extra 1d10 points of cold damage on a successful critical hit. If the weapon's critical multiplier is ×3, add an extra 2d10 points of cold damage instead, and if the multiplier is ×4, add an extra 3d10 points.",
        additionalDiceDamage: "+1d6 cold"),
    EnchantModel(
        enchant: "Igniting",
        availability: 8,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "An igniting weapon functions as a flaming weapon that also causes the target to catch fire (Core Rulebook 444) upon striking it with a successful critical hit. The target does not get a saving throw to avoid catching fire, but can make a save each round on its turn to put out the fire. The flaming ability must be active for the weapon to set enemies on fire.",
        additionalDiceDamage: "+1d6 fire"),
    EnchantModel(
        enchant: "Invigorating",
        availability: 9,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "This special ability can only be placed on melee weapons. After an attack with this weapon drops a living foe (kills it or drops it to negative hit points), the weapon infuses its wielder with vigor. If its wielder is fatigued, the weapon removes the fatigue. If exhausted, the wielder becomes fatigued instead. If neither exhausted nor fatigued, the wielder gains a +2 morale bonus on attack rolls and a +10 foot enhancement bonus to all modes of movement possessed until the end of the wielder's next turn.",
        additionalDiceDamage: "+1d6 fire"),
    EnchantModel(
      enchant: "Phase locking",
      availability: 8,
      power: 0,
      enchantPrice: 8000,
      magicalPorperty:
          "A phase locking weapon interferes with dimensional travel. A creature damaged by a phase locking weapon is affected as though by the dimensional anchor spell for 1 round.",
    ),
    EnchantModel(
        enchant: "Shocking burst",
        availability: 8,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "A shocking burst weapon functions as a shock weapon that explodes with electricity upon striking a successful critical hit. The electricity does not harm the wielder. In addition to the extra electricity damage from the shock ability, a shocking burst weapon deals an extra 1d10 points of electricity damage on a successful critical hit. If the weapon's critical multiplier is ×3, add an extra 2d10 points of electricity damage instead, and if the multiplier is ×4, add an extra 3d10 points.",
        additionalDiceDamage: "+1d6 shock"),
    EnchantModel(
      enchant: "Stalking",
      availability: 8,
      power: 0,
      enchantPrice: 8000,
      magicalPorperty:
          "The longer the wielder of a stalking weapon studies a target, the more effective her strike. As a standard action, a character wielding a stalking weapon can command it to study a creature within 60 feet. The wielder must have line of effect and line of sight to that target. When the wielder attacks the studied creature, on a successful hit the stalking weapon deals +1d6 points of bonus damage per consecutive round spent studying a target, up to a number of bonus dice equal to the stalking weapon's enhancement bonus. This bonus damage is precision damage and only applies to the first successful hit against that creature. If the wielder attacks a creature other than the studied creature, commands the weapon to study a different creature, or ends her turn more than 60 feet from the studied creature, the weapon loses all bonus damage dice against the previously studied creature.",
    ),
    EnchantModel(
        enchant: "Unholy",
        availability: 8,
        power: 0,
        enchantPrice: 8000,
        magicalPorperty:
            "An unholy weapon is imbued with unholy power. This power makes the weapon evil-aligned and thus bypasses the corresponding damage reduction. It deals an extra 2d6 points of damage against all creatures of good alignment. It bestows one permanent negative level on any good creature attempting to wield it. The negative level remains as long as the weapon is in hand and disappears when the weapon is no longer wielded. This negative level cannot be overcome in any way (including restoration spells) while the weapon is wielded.",
        additionalDiceDamage: "+2d6 against good"),
    EnchantModel(
      enchant: "Wounding",
      availability: 8,
      power: 0,
      enchantPrice: 8000,
      magicalPorperty:
          "A wounding weapon deals 1 point of bleed damage when it hits a creature. Multiple hits from a wounding weapon increase the bleed damage. Bleeding creatures take the bleed damage at the start of their turns. Bleeding can be stopped by a successful DC 15 Heal check or through the application of any spell that cures hit point damage. A critical hit does not multiply the bleed damage. Creatures immune to critical hits are immune to the bleed damage dealt by this weapon.",
    ),
    EnchantModel(
      enchant: "Nullifying",
      availability: 9,
      power: 0,
      enchantPrice: 8000,
      magicalPorperty:
          "A nullifying weapon suppresses a creature's spell resistance for a short amount of time. Anytime the weapon strikes a creature with spell resistance and the creature takes damage from the weapon, the target's spell resistance is reduced by 1 for 1 minute. On a confirmed critical hit, its spell resistance is instead reduced by an amount equal to the weapon's critical multiplier. Multiple hits from a nullification weapon stack.",
    ),
    EnchantModel(
      enchant: "Speed",
      availability: 12,
      power: 0,
      enchantPrice: 18000,
      magicalPorperty:
          "When making a full-attack action, the wielder of a speed weapon may make one extra attack with it. The attack uses the wielder's full base attack bonus, plus any modifiers appropriate to the situation. (This benefit is not cumulative with similar effects, such as a haste spell.)",
    ),
    EnchantModel(
      enchant: "Brilliant energy",
      availability: 17,
      power: 0,
      enchantPrice: 32000,
      magicalPorperty:
          "A brilliant energy weapon has its significant portion transformed into light, although this does not modify the item's weight. It always gives off light as a torch (20-foot radius). A brilliant energy weapon ignores nonliving matter. Armor and shield bonuses to AC (including any enhancement bonuses to that armor) do not count against it because the weapon passes through armor. (Dexterity, deflection, dodge, natural armor, and other such bonuses still apply.) A brilliant energy weapon cannot harm undead, constructs, or objects.",
    ),
    EnchantModel(
      enchant: "Vorpal",
      availability: 18,
      power: 0,
      enchantPrice: 50000,
      magicalPorperty:
          "This potent and feared ability allows the weapon to sever the heads of those it strikes. Upon a roll of natural 20 (followed by a successful roll to confirm the critical hit), the weapon severs the opponent's head (if it has one) from its body. Some creatures, such as many aberrations and all oozes, have no heads. Others, such as golems and undead creatures other than vampires, are not affected by the loss of their heads. Most other creatures, however, die when their heads are cut off. A vorpal weapon must be a slashing melee weapon. If you roll this special ability randomly for an inappropriate weapon, reroll.",
    ),
  ];

  final List<EnchantModel> allArmors = [
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
    EnchantModel(
      enchant: "",
      availability: 0,
      power: 0,
      enchantPrice: 0,
      magicalPorperty: "",
    ),
  ];
}
