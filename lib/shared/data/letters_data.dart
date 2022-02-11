import 'package:fantasy_name_generator/models/consonant_model.dart';
import 'package:fantasy_name_generator/models/vowel_model.dart';

class LettersData {
  List<VowelModel> vowels = [
    VowelModel(
      id: 0,
      value: 'a',
    ),
    VowelModel(
      id: 1,
      value: 'e',
    ),
    VowelModel(
      id: 2,
      value: 'i',
    ),
    VowelModel(
      id: 3,
      value: 'o',
    ),
    VowelModel(
      id: 4,
      value: 'u',
    ),
  ];

  List<VowelModel> semiVowels = [
    VowelModel(
      id: 0,
      value: 'i',
    ),
    VowelModel(
      id: 1,
      value: 'u',
    ),
    VowelModel(
      id: 2,
      value: 'e',
    ),
  ];

  List<ConsonantModel> consonantCluster = [
    ConsonantModel(
      id: 0,
      value: 'h',
    ),
    ConsonantModel(
      id: 1,
      value: 'j',
    ),
    ConsonantModel(
      id: 2,
      value: 'l',
    ),
    ConsonantModel(
      id: 3,
      value: 'k',
    ),
    ConsonantModel(
      id: 4,
      value: 'r',
    ),
    ConsonantModel(
      id: 5,
      value: 'c',
    ),
  ];

  List<ConsonantModel> consonants = [
    ConsonantModel(
      id: 0,
      value: 'b',
    ),
    ConsonantModel(
      id: 1,
      value: 'c',
    ),
    ConsonantModel(
      id: 2,
      value: 'd',
    ),
    ConsonantModel(
      id: 3,
      value: 'f',
    ),
    ConsonantModel(
      id: 4,
      value: 'g',
    ),
    ConsonantModel(
      id: 5,
      value: 'h',
    ),
    ConsonantModel(
      id: 6,
      value: 'j',
    ),
    ConsonantModel(
      id: 7,
      value: 'k',
    ),
    ConsonantModel(
      id: 8,
      value: 'l',
    ),
    ConsonantModel(
      id: 9,
      value: 'm',
    ),
    ConsonantModel(
      id: 10,
      value: 'n',
    ),
    ConsonantModel(
      id: 11,
      value: 'p',
    ),
    ConsonantModel(
      id: 12,
      value: 'q',
    ),
    ConsonantModel(
      id: 13,
      value: 'r',
    ),
    ConsonantModel(
      id: 14,
      value: 's',
    ),
    ConsonantModel(
      id: 15,
      value: 't',
    ),
    ConsonantModel(
      id: 16,
      value: 'v',
    ),
    ConsonantModel(
      id: 17,
      value: 'w',
    ),
    ConsonantModel(
      id: 18,
      value: 'x',
    ),
    ConsonantModel(
      id: 19,
      value: 'y',
    ),
    ConsonantModel(
      id: 20,
      value: 'z',
    ),
  ];
}
