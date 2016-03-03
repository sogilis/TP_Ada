with Account; use Account;

package P_Operation.P_Transfer is

   -------------------------------------------------------------------------------------------------
   type T_Transfer is new T_Operation with record
      Ptr_Transmitter : T_Pointeur;
      Ptr_Payee       : T_Pointeur;
   end record;

   -------------------------------------------------------------------------------------------------
   procedure Make_Transfer (Transfer : in out T_Transfer);


   procedure Display_Transfer(Amount : T_Euro; Transmitter_ID : Positive; Payee_ID : Positive);

end P_Operation.P_Transfer;
