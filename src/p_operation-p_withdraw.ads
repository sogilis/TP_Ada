with Account; use Account;

package P_Operation.P_Withdraw is

   -------------------------------------------------------------------------------------------------
   type T_Withdraw is new T_Operation with record
      Ptr_Account : T_Pointeur;
   end record;

   -------------------------------------------------------------------------------------------------
   procedure Make_Withdraw (Withdraw : in out T_Withdraw);

end P_Operation.P_Withdraw;
