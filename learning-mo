import Map "mo:base/HashMap";
import Text "mo:base/Text";

actor {
  type Name = Text;
  type Phone = Text;

  type Entry = {
    desc : Text;
    phone: Phone;
  };
// variable (degiskenler) 
// let -> immutable (değiştirilemez)
// var > mutable (değistirilebilir)
  type Record = {
    name : Name;
    entry: Entry;
  };


  let phonebook = Map.HashMap<Name, Entry>(0,Text.equal, Text.hash);
// functions fonksiyonlar
//query -> sorgulamak 
// update → güncelleme

  public func insert(record : Record) : async Record {
     phonebook.put(record.name, record.entry);
    let newRecord = {
        name = record.name;
        entry = {
            desc = record.entry.desc;
            phone = record.entry.phone;
        };
    };
    return newRecord;
  };

  //loop
 // ? str, integer, float, döndür
//   public query func lookup(name : Name) : async ?Entry {
//     phonebook.get(name);
//   };

public query func getAllRecords(): async [Record] {
  var records : [Record] = [];
    
  // Iterate over phonebook entries and construct Record objects
  for (entry in phonebook.entries()) {
    let (name, entryData) = entry;
    let record : Record = { name = name; entry = entryData };
    records :=[record];
  };
 return records;
};

}
