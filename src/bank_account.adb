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
   My_Account : T_Account := T_Account'(Balance => 0.00,
                                        ID      => 1);



begin

   Display_Balance(My_Account);
   Deposit(Amount => 130.00, Account => My_Account);
   Display_Balance(My_Account);
   Withdraw(Amount => 1000.00, Account => My_Account);
   Display_Balance(My_Account);
   Display_Creditor(Is_Account_Creditor(My_Account));
   Deposit(Amount => 20.00, Account => My_Account);
   Display_Balance(My_Account);
   Display_Creditor(Is_Account_Creditor(My_Account));


end Bank_Account;

