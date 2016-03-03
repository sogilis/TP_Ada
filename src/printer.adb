with Ada.Text_IO; use Ada.Text_IO;
with Account;     use Account;
with P_Operation; use P_Operation;
with P_Operation.P_Deposit;  use P_Operation.P_Deposit;
with P_Operation.P_Withdraw; use P_Operation.P_Withdraw;
with P_Operation.P_Transfer; use P_Operation.P_Transfer;

package body Printer is

   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Ptr_Account : T_Pointeur) is
   begin

      Put_Line
        ("The balance of the account number " &
         Positive'Image (Ptr_Account.all.ID) &
         " is :" &
         T_Euro'Image (Ptr_Account.all.Balance));

   end Display_Balance;

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor (Ptr_Account : T_Pointeur) return Boolean is
   begin
      return Ptr_Account.all.Balance >= 0.0;
   end Is_Account_Creditor;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean) is
   begin
      Put_Line ("Is the account creditor : " & Boolean'Image (Creditor));
   end Display_Creditor;

   -------------------------------------------------------------------------------------------------
   procedure Display_History (Ptr_Account : T_Pointeur) is
      D : T_Deposit;
      W : T_Withdraw;
   begin
      New_Line;
      Put_Line
        ("------------------------ History of account number " &
         Positive'Image (Ptr_Account.all.ID) &
         " --------------------");
      for i in Ptr_Account.all.History'Range loop
         case Ptr_Account.all.History (i).Operation is
            when 1 =>
               D := (Amount=> Ptr_Account.all.History (i).Amount, Ptr_Account => Ptr_Account);
               Display_Operation(D);

            when 2 =>
               W := (Amount=> Ptr_Account.all.History (i).Amount, Ptr_Account => Ptr_Account);
               Display_Operation(W);
            when 3 =>

               Display_Transfer(Amount=> Ptr_Account.all.History (i).Amount, Transmitter_ID => Ptr_Account.all.History (i).Transmitter , Payee_ID => Ptr_Account.all.History (i).Payee);
            when others =>
               null;
         end case;
      end loop;
   end Display_History;

end Printer;
