with Account;                use Account;
with P_Operation;            use P_Operation;
with P_Operation.P_Deposit;  use P_Operation.P_Deposit;
--  with P_Operation.P_Withdraw; use P_Operation.P_Withdraw;
--  with P_Operation.P_Transfer; use P_Operation.P_Transfer;
with Printer;                use Printer;

procedure Bank_Account is

   -------------------------------------------------------------------------------------------------
   Account_1 : T_Account :=
     T_Account'(Balance => 0.00, ID => 1, History => <>, Date => 0);

   Account_2 : T_Account :=
     T_Account'(Balance => 0.00, ID => 2, History => <>, Date => 0);

   Account_3 : T_Account :=
     T_Account'(Balance => 0.00, ID => 3, History => <>, Date => 0);

   -------------------------------------------------------------------------------------------------
   Ptr_Account_1, Ptr_Account_2, Ptr_Account_3 : Pointer_Account;

   -------------------------------------------------------------------------------------------------
   D : T_Deposit;
   Pointer_Ope : T_Operation_Class_Access;
--     W : T_Withdraw;
--     T : T_Transfer;

begin

   -------------------------------------------------------------------------------------------------
   Ptr_Account_1 := new T_Account'(Account_1);
   Ptr_Account_2 := new T_Account'(Account_2);
   Ptr_Account_3 := new T_Account'(Account_3);

   -------------------------------------------------------------------------------------------------
   D := (Amount => 50.00, Ptr_Account => Ptr_Account_1);
   Pointer_Ope.all := D;
   Make(Pointer_Ope);

   -------------------------------------------------------------------------------------------------
--     W := (Amount => 2000.00, Ptr_Account => Ptr_Account_1);
--     Make (W);

   -------------------------------------------------------------------------------------------------
   D := (Amount => 59.00, Ptr_Account => Ptr_Account_1);
   Pointer_Ope := D'access;
   Make(Pointer_Ope);

   -------------------------------------------------------------------------------------------------
--     T :=
--       (Amount          => 50.00,
--        Ptr_Transmitter => Ptr_Account_1,
--        Ptr_Payee       => Ptr_Account_2);
--     Make(T);

   -------------------------------------------------------------------------------------------------
   D := (Amount => 10.00, Ptr_Account => Ptr_Account_3);
   Pointer_Ope := D'access;
   Make(Pointer_Ope);

   -------------------------------------------------------------------------------------------------
--     T :=
--       (Amount          => 50.00,
--        Ptr_Transmitter => Ptr_Account_2,
--        Ptr_Payee       => Ptr_Account_3);
--     Make (T);

   -------------------------------------------------------------------------------------------------
   Display_History (Ptr_Account_1);
   Display_Creditor (Is_Account_Creditor (Ptr_Account_1));
   Display_Balance (Ptr_Account_1);

   -------------------------------------------------------------------------------------------------
   Display_History (Ptr_Account_2);
   Display_Creditor (Is_Account_Creditor (Ptr_Account_2));
   Display_Balance (Ptr_Account_2);

   -------------------------------------------------------------------------------------------------
   Display_History (Ptr_Account_3);
   Display_Creditor (Is_Account_Creditor (Ptr_Account_3));
   Display_Balance (Ptr_Account_3);

end Bank_Account;
