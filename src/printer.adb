with Ada.Text_IO; use Ada.Text_IO;
with Account; use Account;
with P_Operation; use P_Operation;
package body Printer is

   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Account : T_Account) is
   begin
      Put_Line
        ("The balance of the account number " &
         Positive'Image (Account.ID) &
         " is :" &
         T_Euro'Image (Account.Balance));
   end Display_Balance;

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor (Account : T_Account) return Boolean is
   begin
      return Account.Balance >= 0.0;
   end Is_Account_Creditor;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean) is
   begin
      Put_Line ("Is the account creditor : " & Boolean'Image (Creditor));
   end Display_Creditor;



   -------------------------------------------------------------------------------------------------
   procedure Display_History (Account : T_Account) is
   begin
      Put_Line
        ("------------------------ History of account number " &
         Positive'Image (Account.ID) &
         " --------------------");
     -- for i in Account.History'Range loop
       --  case Account.History (i).Operation is
         --   when Transfer =>

           --    Put
             --    ("Operation : " &
               --   T_Operation'Image (Account.History (i).Operation));
             --  Put
               --  (" of " &
                 -- T_Euro'Image (Account.History (i).Amount) &
                  --" Euros");
--               Put
  --               (" from account number " &
    --              Positive'Image (Account.History (i).Transmitter));
      --         Put_Line
        --         (" to account number " &
          --        Positive'Image (Account.History (i).Payee));
            --when NA =>
              -- null;
       --     when others =>
         --      Put
           --      ("Operation : " &
             --     T_Operation'Image (Account.History (i).Operation));
               --Put_Line
                 --(" of " &
                  --T_Euro'Image (Account.History (i).Amount) &
                  --" Euros");
         --end case;
      --end loop;
   end Display_History;

end Printer;
