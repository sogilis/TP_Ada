package body P_Operation.P_Transfer is

 procedure Make_Transfer
     (Transfer : in out T_Transfer)
   is
   begin
      Transfer.Transmitter.Date                       := Transfer.Transmitter.Date + 1;
      Transfer.Payee.Date                             := Transfer.Payee.Date + 1;
      Transfer.Transmitter.Balance                    := Transfer.Transmitter.Balance - Transfer.Amount;
      Transfer.Payee.Balance                          := Transfer.Payee.Balance + Transfer.Amount;
      Transfer.Transmitter.History (Transfer.Transmitter.Date) :=
        (Operation => "tra",
         Amount      => Transfer.Amount,
         Transmitter => Transfer.Transmitter.ID,
         Payee       => Transfer.Payee.ID);
      Transfer.Payee.History (Transfer.Payee.Date) :=
        (Operation => "tra",
         Amount      => Transfer.Amount,
         Transmitter => Transfer.Transmitter.ID,
         Payee       => Transfer.Payee.ID);
   end Make_Transfer;

end P_Operation.P_Transfer;
