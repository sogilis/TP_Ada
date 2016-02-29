package body P_Operation.P_Deposit is

   procedure Make_Deposit (Amount : T_Euro :=0.00 ; Account : in out T_Account) is
   begin
      Account.Date                   := Account.Date + 1;
      Account.Balance                := Account.Balance + Amount;
      Account.History (Account.Date) :=
        (Operation => Deposit, Amount => Amount, Transmitter => 0, Payee => 0);
   end Make_Deposit;

end P_Operation.P_Deposit;
