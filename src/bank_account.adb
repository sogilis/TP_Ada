with Account;     use Account;

procedure Bank_Account is

    Account_1 : T_Account :=
     T_Account'(Balance => 0.00, ID => 1, History => <>, Date => 0);

   Account_2 : T_Account :=
     T_Account'(Balance => 0.00, ID => 2, History => <>, Date => 0);
begin

   Deposit (Amount => 130.00, Account => Account_1);
   Display_Balance (Account_1);

   Deposit (Amount => 100.00, Account => Account_2);
   Display_Balance (Account_2);

   Transfer (Amount => 20.0, Transmitter => Account_1, Payee => Account_2);

   Transfer (Amount => 30.0, Transmitter => Account_2, Payee => Account_1);
   Transfer (Amount => 10.0, Transmitter => Account_1, Payee => Account_2);
   Transfer (Amount => 5.0, Transmitter => Account_2, Payee => Account_1);

   Display_History (Account_1);
   Display_Creditor (Is_Account_Creditor (Account_1));
   Display_Balance (Account_1);

   Display_History (Account_2);
   Display_Balance (Account_2);
   Display_Creditor (Is_Account_Creditor (Account_2));

end Bank_Account;
