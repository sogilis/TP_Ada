with Ada.Text_IO;   use Ada.Text_IO;

procedure Bank_Account is

   type T_Euro is delta 0.01 range -100_000.00 .. 100_000.00;

   type T_Operation is (Deposit, Withdraw, Transfer, NA);

   type T_History is record
      Operation : T_Operation := NA;
      Amount : T_Euro := 0.00;
      Transmitter : Natural := 0;
      Payee : Natural := 0;
   end record;

   type A_History is array(1..10) of T_History;

   type T_Account is record
      Balance : T_Euro;
      ID      : Natural;
      History : A_History;
      Date    : Integer;
   end record;


   -------------------------------------------------------------------------------------------------
   procedure Deposit (Amount : T_Euro := 0.00; Account : in out T_Account) is
   begin
      Account.Date := Account.Date + 1;
      Account.Balance := Account.Balance + Amount;
      Account.History(Account.Date) := (Operation => Deposit, Amount => Amount, Transmitter => 0, Payee => 0);
   end Deposit;

   -------------------------------------------------------------------------------------------------
   procedure Withdraw (Amount : T_Euro := 0.00; Account : in out T_Account) is
   begin
      Account.Date := Account.Date + 1;
      Account.Balance := Account.Balance - Amount;
      Account.History(Account.Date) := (Operation => Withdraw, Amount => Amount, Transmitter => 0, Payee => 0);
   end Withdraw;

   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Account : T_Account) is
   begin
      Put_Line("The balance of the account number " &Positive'Image(Account.ID) & " is :" & T_Euro'Image(Account.Balance));
   end Display_Balance;

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor (Account : T_Account) return Boolean is
   begin
      return Account.Balance >= 0.0;
   end Is_Account_Creditor;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean) is
   begin
      Put_Line("Is the account creditor : " &Boolean'Image(Creditor));
   end Display_Creditor;

   -------------------------------------------------------------------------------------------------
   procedure Transfer (Amount : T_Euro := 0.00; Transmitter : in out T_Account; Payee : in out T_Account) is
   begin
      Transmitter.Date := Transmitter.Date + 1;
      Payee.Date := Payee.Date + 1;
      Transmitter.Balance := Transmitter.Balance - Amount;
      Payee.Balance := Payee.Balance + Amount;
      Transmitter.History(Transmitter.Date) := (Operation => Transfer, Amount => Amount, Transmitter => Transmitter.ID, Payee => Payee.ID);
      Payee.History(Payee.Date) := (Operation => Transfer, Amount => Amount, Transmitter => Transmitter.ID, Payee => Payee.ID);
   end Transfer;


   -------------------------------------------------------------------------------------------------
   procedure Display_History (Account : T_Account) is
   begin
      Put_Line("------------------------ History of account number " &Positive'Image(Account.ID) & " --------------------");
      for i in Account.History'range loop
         case Account.History(i).Operation is
            when Transfer =>

            Put("Operation : " &T_Operation'Image(Account.History(i).Operation));
            Put(" of " &T_Euro'Image(Account.History(i).Amount) & " Euros");
            Put(" from account number " &Positive'Image(Account.History(i).Transmitter));
            Put_Line(" to account number " &Positive'Image(Account.History(i).Payee));
            when NA =>
            null;
            when others =>
            Put("Operation : " &T_Operation'Image(Account.History(i).Operation));
            Put_Line(" of " &T_Euro'Image(Account.History(i).Amount) & " Euros");
         end case;
      end loop;
   end Display_History;


   Account_1 : T_Account := T_Account'(Balance => 0.00,
                                       ID      => 1,
                                       History => <>,
                                       Date => 0);

   Account_2 : T_Account := T_Account'(Balance => 0.00,
                                       ID      => 2,
                                       History => <>,
                                       Date => 0);
begin

   Deposit(Amount => 130.00, Account => Account_1);
   Display_Balance(Account_1);


   Deposit(Amount => 100.00, Account => Account_2);
   Display_Balance(Account_2);

   Transfer(Amount => 20.0, Transmitter => Account_1, Payee => Account_2);


   Transfer(Amount => 30.0, Transmitter => Account_2, Payee => Account_1);
   Transfer(Amount => 10.0, Transmitter => Account_1, Payee => Account_2);
   Transfer(Amount => 5.0, Transmitter => Account_2, Payee => Account_1);




   Display_History(Account_1);
   Display_Creditor(Is_Account_Creditor(Account_1));
   Display_Balance(Account_1);

   Display_History(Account_2);
   Display_Balance(Account_2);
   Display_Creditor(Is_Account_Creditor(Account_2));

end Bank_Account;

