with Ada.Text_IO;   use Ada.Text_IO;

procedure Bank_Account is

   type T_Euro is delta 0.01 range -100_000.00 .. 100_000.00;

   type T_Account is record
      Balance : T_Euro;
      ID      : Positive;
   end record;

   -------------------------------------------------------------------------------------------------
   procedure Deposit (Amount : T_Euro := 0.00; Account : in out T_Account) is
   begin
      Account.Balance := Account.Balance + Amount;
   end Deposit;

   -------------------------------------------------------------------------------------------------
   procedure Withdraw (Amount : T_Euro := 0.00; Account : in out T_Account) is
   begin
      Account.Balance := Account.Balance - Amount;
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
      Withdraw(Amount => Amount, Account => Transmitter);
      Deposit(Amount => Amount, Account => Payee);
   end Transfer;

   -------------------------------------------------------------------------------------------------
   Account_1 : T_Account := T_Account'(Balance => 0.00,
                                        ID      => 1);

   Account_2 : T_Account := T_Account'(Balance => 0.00,
                                        ID      => 2);

begin

   Deposit(Amount => 130.00, Account => Account_1);
   Display_Balance(Account_1);
   Display_Creditor(Is_Account_Creditor(Account_1));

   Deposit(Amount => 100.00, Account => Account_2);
   Display_Balance(Account_2);
   Display_Creditor(Is_Account_Creditor(Account_2));
   Transfer(Amount => 20.0, Transmitter => Account_1, Payee => Account_2);

   Display_Balance(Account_1);
   Display_Balance(Account_2);
end Bank_Account;

