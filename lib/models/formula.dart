class Fomula {
  String GetTotal(String num1, String num2) {
    var a = [];
    var b = [];
    var c = [];
    var result = [];
    for (var c in num1.codeUnits) {
      a.add(c);
    }
    for (var c in num2.codeUnits) {
      b.add(c);
    }
    int s;
    if (num1.length > num2.length) {
      s = num1.length - num2.length;
      for (int i = 0; i < s; i++) {
        b.insert(i, 48);
      }
    } else {
      s = num2.length - num1.length;
      for (int i = 0; i < s; i++) {
        a.insert(i, 48);
      }
    }
    // print(a);
    // print(b);
    for (int i = 0; i <= a.length; i++) {
      c.add(48);
    }
    int temp = 0;
    for (int i = a.length; i > 0; i--) {
      if (a[i - 1] + b[i - 1] >= 106 && temp == 0) {
        c[i] = a[i - 1] + b[i - 1] - 58;
        temp = 49;
        continue;
      }
      if (a[i - 1] + b[i - 1] >= 106 && temp != 0) {
        c[i] = a[i - 1] + b[i - 1] - 58 + temp - 48;
        temp = 49;
        continue;
      }
      if (a[i - 1] + b[i - 1] < 106 && temp == 0) {
        c[i] = a[i - 1] + b[i - 1] - 48;
        continue;
      }
      if (a[i - 1] + b[i - 1] < 106 && temp != 0) {
        c[i] = a[i - 1] + b[i - 1] - 48 + temp - 48;
        continue;
      }
    }
    if (a[0] + b[0] >= 106) {
      c[0] = 49;
    } else {
      c.removeAt(0);
    }
    // print(c);

    for (var w in c) {
      var character = String.fromCharCode(w);
      result.add(character);
    }

    return result.join("");
  }
}
