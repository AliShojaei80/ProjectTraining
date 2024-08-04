///Ali Shojaei
///Painting Programming.

main() {
  // area = (total area) - (empty spaces)
  List<Emptyspace> empty = [
    Emptyspace(2, 5),
    Emptyspace(10, 2),
    Emptyspace(15, 2)
  ];
  MohasebeMohit area = MohasebeMohit(200, empty);
  // color
  Paint color = Paint('Orange', 50);
  // location : (1: indoor) or (2: outdoor)
  Location location = Location(2);
  // final cost
  Price p = Price.Price(color, area, location);
  print(p.calculate());
}
//_________________________________________________________________________________________

class Location {
  int factor;

  Location(this.factor);
}
//_________________________________________________________________________________________

class Emptyspace {
  int width;
  int length;

  Emptyspace(this.width, this.length);
}
//_________________________________________________________________________________________

class MohasebeMohit {
  int totalArea;
  List<Emptyspace> list = [];

  MohasebeMohit(this.totalArea, this.list);

  int calculate() {
    int sum = 0;
    for (var item in list) {
      sum += item.width * item.length;
    }
    return totalArea - sum;
  }

  @override
  String toString() {
    return totalArea.toString();
  }
}

//_________________________________________________________________________________________

class Paint {
  String name;
  int cost;

  Paint(this.name, this.cost);
}

//_________________________________________________________________________________________

class Price {
  Paint paint;
  MohasebeMohit area;
  Location location;

  Price.Price(this.paint, this.area, this.location);

  int calculate() {
    return paint.cost * area.calculate() * location.factor;
  }

  @override
  String toString() {
    return 'paint: ${paint.name}, location factor: ${location.factor}, area: ${area.calculate()}';
  }
}
//_________________________________________________________________________________________

