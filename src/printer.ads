with Account; use Account;

package Printer is
   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Account : T_Account);

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor (Account : T_Account) return Boolean;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean);

   -------------------------------------------------------------------------------------------------
   procedure Display_History (Account : T_Account);

end Printer;
