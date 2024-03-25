import List "mo:base/List";
import Option "mo:base/Option";
import Trie "mo:base/Trie";
import Nat32 "mo:base/Nat32";

actor Superheroes {

  // public types
  //public type oluşturduk idleri oluşturduk
  public type SuperheroId = Nat32;

  public type Superhero = {
    name: Text;
    superpowers: List.List<Text>;
  };

// next adında bir değişken oluşturduk 
  private stable var next: SuperheroId = 0;

//birden fazla süperkahraman var var değişebilir, mutable, bunu trie'ye bağladık. kendi içerisinde çalışan bir yapı. Trie içinde bir liste tutulacak
  private stable var superheroes: Trie.Trie<SuperheroId, Superhero> = Trie.empty();

// yüksek level API (motokoda API nasıl oluşturuluyor)
//create
  public func create(superhero: Superhero) : async SuperheroId {
    let superheroId = next;
    next += 1;
    superheroes := Trie.replace(
      superheroes, 
      key(superheroId),
      Nat32.equal,
      ?superhero,
    ).0; //yüklerse bu şekilde yüklesin yoksa olduğu gibi bıraksın, olan birşeyi değiştirmesin
    return superheroId;
  };

// read
  public query func read(superheroId : SuperheroId) : async ?Superhero {
    let result = Trie.find(superheroes, key(superheroId), Nat32.equal);
    return result;
  };

// update
  public func update(superheroId: SuperheroId, superhero: Superhero) : async Bool {
    let result = Trie.find(superheroes, key(superheroId), Nat32.equal); //ilgili superhero yu bul
    let exists = Option.isSome(result); //true false

    if (exists) {
      superheroes := Trie.replace(
        superheroes,  key(superheroId), Nat32.equal, ?superhero,
      ).0;
    };
    return exists;
  };


  // alternative code
  
  //   public func update(superheroId: SuperheroId, superhero: Superhero) : async ?Superhero {
  //   let result = Trie.find(superheroes, key(superheroId), Nat32.equal); //ilgili superhero yu bul
  //   let exists = Option.isSome(result); //true false

  //   if (exists) {
  //     superheroes := Trie.replace(
  //       superheroes,  key(superheroId), Nat32.equal, ?superhero,
  //     ).0;
  //   };

  //   let updatedresult = Trie.find(superheroes, key(superheroId), Nat32.equal); 
  //   return updatedresult;
  // };



//delete
  public func delete (superheroId: SuperheroId) : async Bool {
    let result = Trie.find(superheroes, key(superheroId), Nat32.equal);
    let exists = Option.isSome(result);
    if(exists) {
      superheroes := Trie.replace(
        superheroes,
        key(superheroId),
        Nat32.equal,
        null,
      ).0;
    };
    exists
  };

//key oluşturma
  private func key(x:SuperheroId): Trie.Key<SuperheroId>{
  { hash= x; key = x}
  };

}
