with Ada.Text_IO;            use Ada.Text_IO;
with Account;                use Account;
with P_Operation;            use P_Operation;
with P_Operation.P_Deposit;  use P_Operation.P_Deposit;
with P_Operation.P_Withdraw; use P_Operation.P_Withdraw;
with P_Operation.P_Transfer; use P_Operation.P_Transfer;

package body Printer is

   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Ptr_Account : Pointer_Account) is
   begin

      Put_Line
        ("The balance of the account number " &
         Positive'Image (Ptr_Account.all.ID) &
         " is :" &
         T_Euro'Image (Ptr_Account.all.Balance));

   end Display_Balance;

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor
     (Ptr_Account : Pointer_Account) return Boolean
   is
   begin
      return Ptr_Account.all.Balance >= 0.0;
   end Is_Account_Creditor;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean) is
   begin
      Put_Line ("Is the account creditor : " & Boolean'Image (Creditor));
   end Display_Creditor;

   -------------------------------------------------------------------------------------------------
   procedure Display_History (Ptr_Account : Pointer_Account) is
   begin
      New_Line;
      Put_Line
        ("------------------------ History of account number " &
         Positive'Image (Ptr_Account.all.ID) &
         " --------------------");
      for i in Ptr_Account.History'Range loop
         if Ptr_Account.History (i) /= null then
            Ptr_Account.History (i).Display;
         end if;

      end loop;

   end Display_History;

end Printer;
