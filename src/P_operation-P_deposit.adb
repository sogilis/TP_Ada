package body P_Operation.P_Deposit is

   procedure Make_Deposit (Deposit : in out T_Deposit) is
   begin
      Deposit.Account.Date                   := Deposit.Account.Date + 1;
      Deposit.Account.Balance                := Deposit.Account.Balance + Deposit.Amount;
      Deposit.Account.History (Deposit.Account.Date) :=
        (Operation => "dep", Amount => Deposit.Amount, Transmitter => 0, Payee => 0);
   end Make_Deposit;

end P_Operation.P_Deposit;
