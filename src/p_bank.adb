package body P_Bank is

   -------------------------------------------------------------------------------------------------
   procedure Apply_Deposit(Ptr_Account : Pointer_Account; Pointer_Operation : T_Operation_Class_Access) is
   begin

        Ptr_Account.Date := Ptr_Account.Date + 1;

        Ptr_Account.Balance := Ptr_Account.Balance + Pointer_Operation.Amount;

        Ptr_Account.History (Ptr_Account.Date) :=
          Pointer_Operation;

   end Apply_Deposit;

   -------------------------------------------------------------------------------------------------
    procedure Apply_Withdraw(Ptr_Account : Pointer_Account; Pointer_Operation : T_Operation_Class_Access) is
     begin

          Ptr_Account.Date := Ptr_Account.Date + 1;

          Ptr_Account.Balance := Ptr_Account.Balance - Pointer_Operation.Amount;

          Ptr_Account.all.History (Ptr_Account.all.Date) :=
            Pointer_Operation;

   end Apply_Withdraw;

   -------------------------------------------------------------------------------------------------
   procedure Apply_Transfer(Transfer : in out T_Transfer) is
      Pointer_Transfer : T_Operation_Class_Access;
   begin

      Transfer.Ptr_Transmitter.Date := Transfer.Ptr_Transmitter.Date + 1;

      Transfer.Ptr_Payee.Date := Transfer.Ptr_Payee.Date + 1;

       Transfer.Ptr_Transmitter.Balance := Transfer.Ptr_Transmitter.Balance - Transfer.Amount;

      Transfer.Ptr_Payee.Balance := Transfer.Ptr_Payee.Balance + Transfer.Amount;

      Pointer_Transfer := new T_Transfer'(Transfer);
        Transfer.Ptr_Transmitter.History (Transfer.Ptr_Transmitter.Date) :=
         Pointer_Transfer;

      Transfer.Ptr_Payee.History (Transfer.Ptr_Payee.Date) :=
         Pointer_Transfer;
   end Apply_Transfer;

end P_Bank;
