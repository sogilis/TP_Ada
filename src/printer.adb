with Ada.Text_IO; use Ada.Text_IO;
with Account;     use Account;
with P_Operation; use P_Operation;

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
   begin
      New_Line; Put_Line
        ("------------------------ History of account number " &
         Positive'Image (Ptr_Account.all.ID) &
         " --------------------");
      for i in Ptr_Account.all.History'Range loop
         case Ptr_Account.all.History (i).Operation is
            when 1 =>
               Put_Line
                 ("Deposit of " &
                  T_Euro'Image (Ptr_Account.all.History (i).Amount) &
                  " Euros");
            when 2 =>
               Put_Line
                 ("Withdraw of " &
                  T_Euro'Image (Ptr_Account.all.History (i).Amount) &
                  " Euros");
            when 3 =>
               Put
                 ("Transfer of " &
                  T_Euro'Image (Ptr_Account.all.History (i).Amount) &
                  " Euros");
               Put
                 (" from account number " &
                  Positive'Image (Ptr_Account.all.History (i).Transmitter));
               Put_Line
                 (" to account number " &
                  Positive'Image (Ptr_Account.all.History (i).Payee));
            when others =>
               null;
         end case;
      end loop;
   end Display_History;

end Printer;
