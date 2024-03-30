import Map "mo:base/HashMap";
import Text "mo:base/Text";

// actor --> akıllı sözleşme
actor {
  type Name = Text;
  type Phone = Text;

  type Entry = {
    desc : Text;
    phone: Phone;
  };

  // değişkenler
  // let --> immutable (değişmeyen veri)
  // const ?
  // var --> mutable (değiştirilebilen veri)

  let phonebook = Map.HashMap<Name, Entry>(0,Text.equal, Text.hash);

  // query --> sorgular
  // update --> geliştirme
  // async() --> işlemler paralelde yapılıyor

  // Fonksiyon
  public func insert(name: Name, entry: Entry) : async () {
    phonebook.put(name, entry);
  };

  //loop
 // ? str, integer, float, döndür
  public query func lookup(name : Name) : async ?Entry {
    phonebook.get(name); // return phonebook.get(name);
  };

}
