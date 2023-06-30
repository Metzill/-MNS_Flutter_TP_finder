import 'package:faker/faker.dart';
import 'package:finder/models/bachelor_model.dart';
import 'package:finder/models/gender.dart';

class BachelorService {
  var faker = Faker();

  List<Bachelor> generateBachelors() {
    List<String> maleAvatarList = getMaleAvatarList();
    List<String> femaleAvatarList = getFemaleAvatarList();
    List<String> maleName = getMaleName();
    List<String> femaleName = getFemaleName();
    List<Bachelor> bachelorList = [];

    for (int i = 0; i < 15; i++) {
      bachelorList.add(Bachelor(
          maleName[i],
          faker.person.lastName(),
          Gender.male,
          maleAvatarList[i],
          getSearchFor(i),
          faker.job.title(),
          faker.lorem.sentences(3).join(' ')));
    }

    for (int i = 0; i < 15; i++) {
      bachelorList.add(Bachelor(
          femaleName[i],
          faker.person.lastName(),
          Gender.female,
          femaleAvatarList[i],
          getSearchFor(i),
          faker.job.title(),
          faker.lorem.sentences(3).join(' ')));
    }

    bachelorList.shuffle();

    return bachelorList;
  }

  List<String> getMaleAvatarList() {
    List<String> maleAvatarList = [
      "assets/images/man-1.png",
      "assets/images/man-2.png",
      "assets/images/man-3.png",
      "assets/images/man-4.png",
      "assets/images/man-5.png",
      "assets/images/man-6.png",
      "assets/images/man-7.png",
      "assets/images/man-8.png",
      "assets/images/man-9.png",
      "assets/images/man-10.png",
      "assets/images/man-11.png",
      "assets/images/man-12.png",
      "assets/images/man-13.png",
      "assets/images/man-14.png",
      "assets/images/man-15.png",
    ];

    maleAvatarList.shuffle();

    return maleAvatarList;
  }

  List<String> getFemaleAvatarList() {
    List<String> femaleAvatarList = [
      "assets/images/woman-1.png",
      "assets/images/woman-2.png",
      "assets/images/woman-3.png",
      "assets/images/woman-4.png",
      "assets/images/woman-5.png",
      "assets/images/woman-6.png",
      "assets/images/woman-7.png",
      "assets/images/woman-8.png",
      "assets/images/woman-9.png",
      "assets/images/woman-10.png",
      "assets/images/woman-11.png",
      "assets/images/woman-12.png",
      "assets/images/woman-13.png",
      "assets/images/woman-14.png",
      "assets/images/woman-15.png",
    ];

    femaleAvatarList.shuffle();

    return femaleAvatarList;
  }

  List<String> getMaleName() {
    List<String> maleName = [
      "Hugo",
      "Bastien",
      "Pierre",
      "Selim",
      "Guillaume",
      "Quentin",
      "Allan",
      "Arthur",
      "Valentin",
      "Jean-Baptiste",
      "Lucas",
      "Arnaud",
      "Clément",
      "Anthony",
      "Théo",
    ];
    maleName.shuffle();
    return maleName;
  }

  List<String> getFemaleName() {
    List<String> femaleName = [
      "Margot",
      "Mathilde",
      "Amélie",
      "Aurore",
      "Vanessa",
      "Léa",
      "Lynne",
      "Jade",
      "Elisa",
      "Emilie",
      "Lucille",
      "Suzie",
      "Lorie",
      "Cécile",
      "Rebecca",
    ];
    femaleName.shuffle();
    return femaleName;
  }

  List<Gender> getSearchFor(int c) {
    List<Gender> searchFor = [];
    if (isPrime(c)) {
      searchFor.add(Gender.male);
      return searchFor;
    } else if (c % 2 != 0) {
      searchFor.add(Gender.female);
      return searchFor;
    }
    searchFor.add(Gender.male);
    searchFor.add(Gender.female);
    return searchFor;
  }

  bool isPrime(int number) {
    if (number <= 1) return false; // Prime number is > 1
    for (int i = 2; i < number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }
}
