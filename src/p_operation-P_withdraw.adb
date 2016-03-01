package body P_Operation.P_Withdraw is

   procedure Make_Withdraw (Amount : T_Euro := 0.00; Account : in out T_Account) is
   begin
      Account.Date                   := Account.Date + 1;
      Account.Balance                := Account.Balance - Amount;
      Account.History (Account.Date) :=
        (
         Amount      => Amount,
         Transmitter => 0,
         Payee       => 0);
   end Make_Withdraw;

end P_Operation.P_Withdraw;
