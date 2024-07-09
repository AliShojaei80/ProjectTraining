void main() {
  List<String> strings = ["a", "", "abc", "d", "ali123", ""];
  List<String> sortedStrings = Sort(strings);
  print(sortedStrings);
}

List<String> Sort(List<String> input) {
  List<String> sortedList = [];
  while (input.isNotEmpty) {
    String shortestString = input[0];
    for (String str in input) {
      if (str.length <= shortestString.length) {
        shortestString = str;
      }
    }
    sortedList.add(shortestString);
    input.remove(shortestString);
  }
  return sortedList;
}
