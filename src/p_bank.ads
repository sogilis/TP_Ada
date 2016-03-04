with Account;                use Account;
with P_Operation;            use P_Operation;
with P_Operation.P_Transfer; use P_Operation.P_Transfer;

package P_Bank is

   -------------------------------------------------------------------------------------------------
   procedure Apply_Deposit
     (Ptr_Account       : Pointer_Account;
      Pointer_Operation : T_Operation_Class_Access);

   -------------------------------------------------------------------------------------------------
   procedure Apply_Withdraw
     (Ptr_Account       : Pointer_Account;
      Pointer_Operation : T_Operation_Class_Access);

   -------------------------------------------------------------------------------------------------
   procedure Apply_Transfer (Transfer : in out T_Transfer);

end P_Bank;
