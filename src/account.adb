with Ada.Text_IO; use Ada.Text_IO;

package body Account is

   -------------------------------------------------------------------------------------------------
   procedure Deposit (Amount : T_Euro := 0.00; Account : in out T_Account) is
   begin
      Account.Date                   := Account.Date + 1;
      Account.Balance                := Account.Balance + Amount;
      Account.History (Account.Date) :=
        (Operation => Deposit, Amount => Amount, Transmitter => 0, Payee => 0);
   end Deposit;

   -------------------------------------------------------------------------------------------------
   procedure Withdraw (Amount : T_Euro := 0.00; Account : in out T_Account) is
   begin
      Account.Date                   := Account.Date + 1;
      Account.History (Account.Date) :=
        (Operation   => Withdraw,
         Amount      => Amount,
         Transmitter => 0,
         Payee       => 0);
   end Withdraw;

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
   procedure Transfer
     (Amount      :        T_Euro := 0.00;
      Transmitter : in out T_Account;
      Payee       : in out T_Account)
   is
   begin
      Transmitter.Date                       := Transmitter.Date + 1;
      Payee.Date                             := Payee.Date + 1;
      Transmitter.Balance                    := Transmitter.Balance - Amount;
      Payee.Balance                          := Payee.Balance + Amount;
      Transmitter.History (Transmitter.Date) :=
        (Operation   => Transfer,
         Amount      => Amount,
         Transmitter => Transmitter.ID,
         Payee       => Payee.ID);
      Payee.History (Payee.Date) :=
        (Operation   => Transfer,
         Amount      => Amount,
         Transmitter => Transmitter.ID,
         Payee       => Payee.ID);
   end Transfer;

   -------------------------------------------------------------------------------------------------
   procedure Display_History (Account : T_Account) is
   begin
      Put_Line
        ("------------------------ History of account number " &
         Positive'Image (Account.ID) &
         " --------------------");
      for i in Account.History'Range loop
         case Account.History (i).Operation is
            when Transfer =>

               Put
                 ("Operation : " &
                  T_Operation'Image (Account.History (i).Operation));
               Put
                 (" of " &
                  T_Euro'Image (Account.History (i).Amount) &
                  " Euros");
               Put
                 (" from account number " &
                  Positive'Image (Account.History (i).Transmitter));
               Put_Line
                 (" to account number " &
                  Positive'Image (Account.History (i).Payee));
            when NA =>
               null;
            when others =>
               Put
                 ("Operation : " &
                  T_Operation'Image (Account.History (i).Operation));
               Put_Line
                 (" of " &
                  T_Euro'Image (Account.History (i).Amount) &
                  " Euros");
         end case;
      end loop;
   end Display_History;

end Account;
