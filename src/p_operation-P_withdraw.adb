package body P_Operation.P_Withdraw is

   procedure Make_Withdraw (Withdraw : in out T_Withdraw) is
   begin

      Withdraw.Ptr_Account.all.Date    := Withdraw.Ptr_Account.all.Date + 1;

      Withdraw.Ptr_Account.all.Balance :=
        Withdraw.Ptr_Account.all.Balance - Withdraw.Amount;

      Withdraw.Ptr_Account.all.History (Withdraw.Ptr_Account.all.Date) :=
        (Operation   => 2,
         Amount      => Withdraw.Amount,
         Transmitter => 0,
         Payee       => 0);

   end Make_Withdraw;

end P_Operation.P_Withdraw;
