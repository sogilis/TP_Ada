with Account; use Account;
with p_operation; use P_Operation;
package P_bank is

   procedure apply_deposit(Ptr_Account : Pointer_Account; Pointer_Operation : T_Operation_Class_Access);
   procedure apply_withdraw(Ptr_Account : Pointer_Account; Pointer_Operation : T_Operation_Class_Access);
   procedure apply_transfer(Pointer_Operation : T_Operation_Class_Access);
end P_bank;
