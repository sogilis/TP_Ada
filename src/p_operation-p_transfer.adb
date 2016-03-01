package body P_Operation.P_Transfer is

 procedure Make_Transfer
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
        (
         Amount      => Amount,
         Transmitter => Transmitter.ID,
         Payee       => Payee.ID);
      Payee.History (Payee.Date) :=
        (
         Amount      => Amount,
         Transmitter => Transmitter.ID,
         Payee       => Payee.ID);
   end Make_Transfer;

end P_Operation.P_Transfer;
