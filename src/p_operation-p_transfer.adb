package body P_Operation.P_Transfer is

   procedure Make_Transfer (Transfer : in out T_Transfer) is
   begin

      Transfer.Ptr_Transmitter.all.Date :=
        Transfer.Ptr_Transmitter.all.Date + 1;

      Transfer.Ptr_Payee.all.Date          := Transfer.Ptr_Payee.all.Date + 1;

      Transfer.Ptr_Transmitter.all.Balance :=
        Transfer.Ptr_Transmitter.all.Balance - Transfer.Amount;

      Transfer.Ptr_Payee.all.Balance :=
        Transfer.Ptr_Payee.all.Balance + Transfer.Amount;

      Transfer.Ptr_Transmitter.all.History
        (Transfer.Ptr_Transmitter.all.Date) :=
        (Operation   => 3,
         Amount      => Transfer.Amount,
         Transmitter => Transfer.Ptr_Transmitter.all.ID,
         Payee       => Transfer.Ptr_Payee.all.ID);

      Transfer.Ptr_Payee.all.History (Transfer.Ptr_Payee.all.Date) :=
        (Operation   => 3,
         Amount      => Transfer.Amount,
         Transmitter => Transfer.Ptr_Transmitter.all.ID,
         Payee       => Transfer.Ptr_Payee.all.ID);

   end Make_Transfer;

end P_Operation.P_Transfer;
