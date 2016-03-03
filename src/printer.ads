with Account; use Account;

package Printer is
   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Ptr_Account : Pointer_Account);

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor (Ptr_Account : Pointer_Account) return Boolean;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean);

   -------------------------------------------------------------------------------------------------
   procedure Display_History (Ptr_Account : Pointer_Account);

end Printer;
