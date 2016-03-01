with Account; use Account;

package Printer is
   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Ptr_Account : T_Pointeur);

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor (Ptr_Account : T_Pointeur) return Boolean;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean);

   -------------------------------------------------------------------------------------------------
   procedure Display_History (Ptr_Account : T_Pointeur);

end Printer;
