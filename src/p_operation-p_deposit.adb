with Ada.Text_IO; use Ada.Text_IO;

package body P_Operation.P_Deposit is

   procedure Make_Deposit (Deposit : in out T_Deposit) is
   begin

      Deposit.Ptr_Account.all.Date := Deposit.Ptr_Account.all.Date + 1;

      Deposit.Ptr_Account.all.Balance :=
        Deposit.Ptr_Account.all.Balance + Deposit.Amount;

      Deposit.Ptr_Account.all.History (Deposit.Ptr_Account.all.Date) :=
        (Operation   => 1,
         Amount      => Deposit.Amount,
         Transmitter => 0,
         Payee       => 0);

   end Make_Deposit;

   procedure Display_Operation(Deposit: T_Deposit) is
   begin
      Put_Line("Deposit of " &T_Euro'Image (Deposit.Amount) & " Euros");
   end Display_Operation;


end P_Operation.P_Deposit;
