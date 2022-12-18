/*
- Basic Programming
  - Variable
     utk menampung data
     Piring, Mangkok, Gelas
     Tipe data
     Nama => integer X
     Nama => String

     Price => double/integer
     Price => String
  - Operator Aritmatika
  - IF  
     u/ mengevaluasi sebuah kondisi
     output: true | false
  - Array/List
     > Lemari, Rak Buku
     Variable yang bisa menampung lebih dari 1 nilai
     Penyimpanan berbasis index (integer)
  - Map
    > Lemari, Rak Buku
      Penyimpanan berbasis key n value
  - Looping
  - Function
  - OOP
*/

// 1. Install NPM, install Nodemon
// nodemon --exec dart tutorial.dart

/*
OOP
1. Bisa bikin Class
2. Bisa bikin variable n function di dalam class
3. Tau cara manggilnya
4. Bisa bikin static variable / method
5. Bisa mengkategorikan kode ke dalam Class
*/

class Product {
  getPoductList() {
    return ["GG FILTER", "JR SUPER 12", "OD CIPTADENT"];
  }

  addProduct() {}
  updateProduct() {}
  deleteProduct() {}
}

class Customer {
  getCustomerList() {
    return [
      "DENY",
      "DADANG",
      "MERRY",
    ];
  }

  addCustomer() {}
  updateCustomer() {}
  deleteCustomer() {}
}

class Car {
  String warna = "Merah";
  double speed = 120; //120km/h
  int seat = 6;

  memarkirMobil() {}
  memundurkanMobil() {}
  mengisiBensin() {}
}
//OOP
// Property, Method
// Variable, Function

class StringRemover {
  static String removeABCfromString(String input) {
    String output = input;
    output = output.replaceAll("A", "");
    output = output.replaceAll("B", "");
    output = output.replaceAll("C", "");
    return output;
  }
}

void main() {
  // create new instance
  // singleton
  // bikin object

  // Product product = new Product();
  Product product = Product();
  List productList = product.getPoductList();
  List productList2 = Product().getPoductList();
  print(StringRemover.removeABCfromString("DENYABC234"));
}
