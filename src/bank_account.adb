with Account;                use Account;
with P_Operation;            use P_Operation;
with P_Operation.P_Deposit;  use P_Operation.P_Deposit;
with P_Operation.P_Withdraw; use P_Operation.P_Withdraw;
with P_Operation.P_Transfer; use P_Operation.P_Transfer;
with Printer;                use Printer;

procedure Bank_Account is

   Account_1 : T_Account :=
     T_Account'(Balance => 0.00, ID => 1, History => <>, Date => 0);

   Account_2 : T_Account :=
     T_Account'(Balance => 0.00, ID => 2, History => <>, Date => 0);

   Account_3 : T_Account :=
     T_Account'(Balance => 0.00, ID => 3, History => <>, Date => 0);

begin

   Make_Deposit (Amount => 130.00, Account => Account_1);
   Make_Deposit (Amount => 100.00, Account => Account_2);
   Make_Deposit (Amount => 70.00, Account => Account_3);
   Make_Transfer (Amount => 20.0, Transmitter => Account_1, Payee => Account_2);
   Make_Transfer (Amount => 30.0, Transmitter => Account_3, Payee => Account_1);
   Make_Transfer (Amount => 10.0, Transmitter => Account_1, Payee => Account_3);
   Make_Transfer (Amount => 100.0, Transmitter => Account_3, Payee => Account_2);
   Make_Withdraw (Amount => 50.00, Account => Account_2);

   Display_History (Account_1);
   Display_Creditor (Is_Account_Creditor (Account_1));
   Display_Balance (Account_1);

   Display_History (Account_2);
   Display_Balance (Account_2);
   Display_Creditor (Is_Account_Creditor (Account_2));

   Display_History (Account_3);
   Display_Balance (Account_3);
   Display_Creditor (Is_Account_Creditor (Account_3));

end Bank_Account;
