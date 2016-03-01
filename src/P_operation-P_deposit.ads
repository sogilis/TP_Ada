with Account; use Account;

package P_Operation.P_Deposit is

   type T_Deposit is new T_Operation with record
      Account : T_Account;
   end record;

   procedure Make_Deposit (Amount : T_Euro := 0.00; Account : in out T_Account);

end P_Operation.P_Deposit;
