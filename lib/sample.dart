import 'package:flutter/material.dart';

class Product {
  final int productId;
  final String productName;
  final String category;
  final double unitPrice;
  final int unitsInStock;

  Product(
      [this.productId,
      this.productName,
      this.category,
      this.unitPrice = 0,
      this.unitsInStock = 0]);

  toString() => {
        'productId': productId,
        'productName': productName,
        'category': category,
        'unitPrice': unitPrice,
        'unitsInStock': unitsInStock
      }.toString();
}

List<Product> getProductList() {
  var products = <Product>[
    new Product(1, "Chai", "Beverages", 18.000, 39),
    new Product(2, "Chang", "Beverages", 19.000, 17),
    new Product(3, "Aniseed Syrup", "Condiments", 10.000, 13),
    new Product(4, "Chef Anton's Cajun Seasoning", "Condiments", 22.000, 53),
    new Product(5, "Chef Anton's Gumbo Mix", "Condiments", 21.350, 0),
    new Product(6, "Grandma's Boysenberry Spread", "Condiments", 25.000, 120),
    new Product(7, "Uncle Bob's Organic Dried Pears", "Produce", 30.000, 15),
    new Product(8, "Northwoods Cranberry Sauce", "Condiments", 40.000, 6),
    new Product(9, "Mishi Kobe Niku", "Meat/Poultry", 97.000, 29),
    new Product(10, "Ikura", "Seafood", 31.000, 31),
    new Product(11, "Queso Cabrales", "Dairy Products", 21.000, 22),
    new Product(12, "Queso Manchego La Pastora", "Dairy Products", 38.000, 86),
    new Product(13, "Konbu", "Seafood", 6.000, 24),
    new Product(14, "Tofu", "Produce", 23.250, 35),
    new Product(15, "Genen Shouyu", "Condiments", 15.500, 39),
    new Product(16, "Pavlova", "Confections", 17.450, 29),
    new Product(17, "Alice Mutton", "Meat/Poultry", 39.000, 0),
    new Product(18, "Carnarvon Tigers", "Seafood", 62.500, 42),
    new Product(19, "Teatime Chocolate Biscuits", "Confections", 9.200, 25),
    new Product(20, "Sir Rodney's Marmalade", "Confections", 81.000, 40),
    new Product(21, "Sir Rodney's Scones", "Confections", 10.000, 3),
    new Product(22, "Gustaf's Knäckebröd", "Grains/Cereals", 21.000, 104),
    new Product(23, "Tunnbröd", "Grains/Cereals", 9.000, 61),
    new Product(24, "Guaraná Fantástica", "Beverages", 4.500, 20),
    new Product(25, "NuNuCa Nuß-Nougat-Creme", "Confections", 14.000, 76),
    new Product(26, "Gumbär Gummibärchen", "Confections", 31.230, 15),
    new Product(27, "Schoggi Schokolade", "Confections", 43.900, 49),
    new Product(28, "Rössle Sauerkraut", "Produce", 45.600, 26),
    new Product(29, "Thüringer Rostbratwurst", "Meat/Poultry", 123.790, 0),
    new Product(30, "Nord-Ost Matjeshering", "Seafood", 25.890, 10),
    new Product(31, "Gorgonzola Telino", "Dairy Products", 12.500, 0),
    new Product(32, "Mascarpone Fabioli", "Dairy Products", 32.000, 9),
    new Product(33, "Geitost", "Dairy Products", 2.500, 112),
    new Product(34, "Sasquatch Ale", "Beverages", 14.000, 111),
    new Product(35, "Steeleye Stout", "Beverages", 18.000, 20),
    new Product(36, "Inlagd Sill", "Seafood", 19.000, 112),
    new Product(37, "Gravad lax", "Seafood", 26.000, 11),
    new Product(38, "Côte de Blaye", "Beverages", 263.500, 17),
    new Product(39, "Chartreuse verte", "Beverages", 18.000, 69),
    new Product(40, "Boston Crab Meat", "Seafood", 18.400, 123),
    new Product(41, "Jack's New England Clam Chowder", "Seafood", 9.650, 85),
    new Product(
        42, "Singaporean Hokkien Fried Mee", "Grains/Cereals", 14.000, 26),
    new Product(43, "Ipoh Coffee", "Beverages", 46.000, 17),
    new Product(44, "Gula Malacca", "Condiments", 19.450, 27),
    new Product(45, "Rogede sild", "Seafood", 9.500, 5),
    new Product(46, "Spegesild", "Seafood", 12.000, 95),
    new Product(47, "Zaanse koeken", "Confections", 9.500, 36),
    new Product(48, "Chocolade", "Confections", 12.750, 15),
    new Product(49, "Maxilaku", "Confections", 20.000, 10),
    new Product(50, "Valkoinen suklaa", "Confections", 16.250, 65),
    new Product(51, "Manjimup Dried Apples", "Produce", 53.000, 20),
    new Product(52, "Filo Mix", "Grains/Cereals", 7.000, 38),
    new Product(53, "Perth Pasties", "Meat/Poultry", 32.800, 0),
    new Product(54, "Tourtière", "Meat/Poultry", 7.450, 21),
    new Product(55, "Pâté chinois", "Meat/Poultry", 24.000, 115),
    new Product(56, "Gnocchi di nonna Alice", "Grains/Cereals", 38.000, 21),
    new Product(57, "Ravioli Angelo", "Grains/Cereals", 19.500, 36),
    new Product(58, "Escargots de Bourgogne", "Seafood", 13.250, 62),
    new Product(59, "Raclette Courdavault", "Dairy Products", 55.000, 79),
    new Product(60, "Camembert Pierrot", "Dairy Products", 34.000, 19),
    new Product(61, "Sirop d'érable", "Condiments", 28.500, 113),
    new Product(62, "Tarte au sucre", "Confections", 49.300, 17),
    new Product(63, "Vegie-spread", "Condiments", 43.900, 24),
    new Product(64, "Wimmers gute Semmelknödel", "Grains/Cereals", 33.250, 22),
    new Product(
        65, "Louisiana Fiery Hot Pepper Sauce", "Condiments", 21.050, 76),
    new Product(66, "Louisiana Hot Spiced Okra", "Condiments", 17.000, 4),
    new Product(67, "Laughing Lumberjack Lager", "Beverages", 14.000, 52),
    new Product(68, "Scottish Longbreads", "Confections", 12.500, 6),
    new Product(69, "Gudbrandsdalsost", "Dairy Products", 36.000, 26),
    new Product(70, "Outback Lager", "Beverages", 15.000, 15),
    new Product(71, "Flotemysost", "Dairy Products", 21.500, 26),
    new Product(72, "Mozzarella di Giovanni", "Dairy Products", 34.800, 14),
    new Product(73, "Röd Kaviar", "Seafood", 15.000, 101),
    new Product(74, "Longlife Tofu", "Produce", 10.000, 4),
    new Product(75, "Rhönbräu Klosterbier", "Beverages", 7.750, 125),
    new Product(76, "Lakkalikööri", "Beverages", 18.000, 57),
    new Product(77, "Original Frankfurter grüne Soße", "Condiments", 13.000, 32)
  ];
  return products;
}

join(Iterable seq, Iterable withSeq, bool match(x, y)) =>
    seq.expand((x) => withSeq..where((y) => match(x, y)).map((y) => [x, y]));

Future asyncError() async {
  throw 'async Error!';
}

class Player {
  final String name;
  final bool isActive;
  const Player({@required this.name, this.isActive: false});
}

class Team {
  final List<Player> roster;
  Team(
      {this.roster: const [
        Player(name: 'bob'),
        Player(name: 'adam', isActive: true),
        Player(name: 'sam', isActive: true),
        Player(name: 'tim')
      ]});
}

Future<Team> delayTeam(String name) {
  return Future.delayed(Duration(microseconds: 100)).then((_) => Team());
}

Future<int> countActivePlayers(String teamName) async {
  try {
    var team = await delayTeam(teamName);
    if (team == null) return 0;

    var players = team.roster;
    return players.where((player) => player.isActive).length;
  } catch (e) {
    print('countActivePlayers: $e');
    return 0;
  }
}

Future asyncValue() async => 'value';

class SamplePage extends StatelessWidget {
  SamplePage({Key key}) : super(key: key);

  test() {
    try {
      asyncError();
    } catch (e) {
      print(e);
    }
  }

  linq100() {
    var numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];

    var i = 0;
    var q = numbers.map((n) => ++i).toList();
    q.forEach((v) => print("v = $v, i = $i"));
  }

  getPlayers() async {
    // var count = await countActivePlayers('adam');
    // print('count: ' + count.toString());

    // var v = await asyncValue();
    // print('v: $v');
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
