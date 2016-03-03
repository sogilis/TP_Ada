with Account; use Account;

package P_Operation.P_Withdraw is

   -------------------------------------------------------------------------------------------------
   type T_Withdraw is new T_Operation with record
      Ptr_Account : Pointer_Account;
   end record;

   -------------------------------------------------------------------------------------------------
   overriding procedure Make (Withdraw : in out T_Withdraw);

   overriding procedure Display (Withdraw : T_Withdraw);

end P_Operation.P_Withdraw;
