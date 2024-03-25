import Icrc1Ledger "canister:icrc1_ledger_canister";
import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Option "mo:base/Option";
import Blob "mo:base/Blob";
import Error "mo:base/Error";

actor {

  type Account = {
    owner : Principal;
    subaccount : ?[Nat8];
  };

  type TransferArgs = {
    amount : Nat;
    toAccount : Account;
  };

  public shared ({ caller }) func transfer(args : TransferArgs) : async Result.Result<Icrc1Ledger.BlockIndex, Text> {
    Debug.print(
      "Transferring "
      # debug_show (args.amount)
      # " tokens to account"
      # debug_show (args.toAccount)
    );

    let transferArgs : Icrc1Ledger.TransferArg = {
      // işlemler arasında ayırt etmek için kullanılabilir
      memo = null;
      // aktarmak istediğimiz miktar
      amount = args.amount;
      // canister'ın varsayılan alt hesabından token transferi yapmak istiyoruz
      from_subaccount = null;
      // belirtilmezse, canister için varsayılan ücret kullanılır.
      fee = null;
      // Tokenleri aktarmak istediğimiz hesap.
      to = args.toAccount;
      // Çağrıcı tarafından oluşturulan işlemin zaman damgasını gösteren bir zaman damgası; çağrıcı tarafından belirtilmezse, bu, mevcut ICP zamanına ayarlanır.
      created_at_time = null;
    };

    try {
      // Aktarımı başlat.
      let transferResult = await Icrc1Ledger.icrc1_transfer(transferArgs);

      // Transferin başarılı olup olmadığını kontrol et.
      switch (transferResult) {
        case (#Err(transferError)) {
          return #err("Couldn't transfer funds:\n" # debug_show (transferError));
        };
        case (#Ok(blockIndex)) { return #ok blockIndex };
      };
    } catch (error : Error) {
      // Aktarım sırasında meydana gelebilecek herhangi bir hatayı yakala
      return #err("Reject message: " # Error.message(error));
    };
  };
};
