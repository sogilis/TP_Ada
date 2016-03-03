with Account; use Account;

package P_Operation.P_Deposit is

   -------------------------------------------------------------------------------------------------
   type T_Deposit is new T_Operation with record
      Ptr_Account : Pointer_Account;
   end record;
   -------------------------------------------------------------------------------------------------
   overriding procedure Make(Pointer_Deposit : in out T_Operation_Class_Access);

   overriding procedure Display (Deposit: T_Deposit);

end P_Operation.P_Deposit;
