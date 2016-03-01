package body P_Operation.P_Withdraw is

   procedure Make_Withdraw (Withdraw : in out T_Withdraw) is
   begin
      Withdraw.Account.Date                   := Withdraw.Account.Date + 1;
      Withdraw.Account.Balance                := Withdraw.Account.Balance - Withdraw.Amount;
      Withdraw.Account.History (Withdraw.Account.Date) :=
        (Operation => "wit",
         Amount      => Withdraw.Amount,
         Transmitter => 0,
         Payee       => 0);
   end Make_Withdraw;

end P_Operation.P_Withdraw;
