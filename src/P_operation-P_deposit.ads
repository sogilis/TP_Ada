with Account; use Account;

package P_Operation.P_Deposit is

   -------------------------------------------------------------------------------------------------
   type T_Deposit is new T_Operation with record
      Ptr_Account : T_Pointeur;
   end record;

   -------------------------------------------------------------------------------------------------
   procedure Make_Deposit (Deposit : in out T_Deposit);

end P_Operation.P_Deposit;
