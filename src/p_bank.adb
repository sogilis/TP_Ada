package body P_bank is

   procedure apply_deposit(Ptr_Account : Pointer_Account; Pointer_Operation : T_Operation_Class_Access) is
   begin

        Ptr_Account.Date := Ptr_Account.Date + 1;

        Ptr_Account.Balance := Ptr_Account.Balance + Pointer_Operation.Amount;

        Ptr_Account.History (Ptr_Account.Date) :=
          Pointer_Operation;

   end apply_deposit;

    procedure apply_withdraw(Ptr_Account : Pointer_Account; Pointer_Operation : T_Operation_Class_Access) is
     begin

          Ptr_Account.Date := Ptr_Account.Date + 1;

          Ptr_Account.Balance := Ptr_Account.Balance - Pointer_Operation.Amount;

          Ptr_Account.all.History (Ptr_Account.all.Date) :=
            Pointer_Operation;

   end apply_withdraw;

   procedure apply_transfer(Pointer_Operation : T_Operation_Class_Access) is
   begin
      Pointer_Operation.Ptr_Transmitter.Date := Pointer_Operation.Ptr_Transmitter.Date + 1;

--      Pointer_Operation.Ptr_Payee.Date := Pointer_Operation.Ptr_Payee.Date + 1;

  --      Pointer_Operation.Ptr_Transmitter.Balance := Pointer_Operation.Ptr_Transmitter.Balance - Pointer_Operation.Amount;

    --    Pointer_Operation.Ptr_Payee.Balance := Pointer_Operation.Ptr_Payee.Balance + Pointer_Operation.Amount;

      --  Pointer_Operation.Ptr_Transmitter.History (Pointer_Operation.Ptr_Transmitter.Date) :=
        --  Pointer_Operation;

     --   Pointer_Operation.Ptr_Payee.History (Pointer_Operation.Ptr_Payee.Date) :=
       --   Pointer_Operation;
   end apply_transfer;


end P_bank;
