with Account; use Account;


package P_Operation.P_Transfer is

   type T_Transfer is new T_Operation with record
      Transmitter : T_Account;
      Payee :T_Account;
   end record;

   procedure Make_Transfer
     (Transfer : in out T_Transfer);

end P_Operation.P_Transfer;
