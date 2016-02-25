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
   My_Account : T_Account := T_Account'(Balance => 0.00,
                                        ID      => 1);

begin

   Display_Balance(My_Account);
   Deposit(Amount => 100.00, Account => My_Account);
   Display_Balance(My_Account);
   Withdraw(Amount => 50.00, Account => My_Account);
   Display_Balance(My_Account);

end Bank_Account;

