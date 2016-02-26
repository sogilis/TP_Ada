package Account is

   type T_Euro is delta 0.01 range -100_000.00 .. 100_000.00;

   type T_Operation is (Deposit, Withdraw, Transfer, NA);

   type T_History is record
      Operation   : T_Operation := NA;
      Amount      : T_Euro      := 0.00;
      Transmitter : Natural     := 0;
      Payee       : Natural     := 0;
   end record;

   type A_History is array (1 .. 10) of T_History;

   type T_Account is record
      Balance : T_Euro;
      ID      : Natural;
      History : A_History;
      Date    : Integer;
   end record;

   -------------------------------------------------------------------------------------------------
   procedure Deposit (Amount : T_Euro := 0.00; Account : in out T_Account);

   -------------------------------------------------------------------------------------------------
   procedure Withdraw (Amount : T_Euro := 0.00; Account : in out T_Account);

   -------------------------------------------------------------------------------------------------
   procedure Display_Balance (Account : T_Account);

   -------------------------------------------------------------------------------------------------
   function Is_Account_Creditor (Account : T_Account) return Boolean;

   -------------------------------------------------------------------------------------------------
   procedure Display_Creditor (Creditor : Boolean);

   -------------------------------------------------------------------------------------------------
   procedure Transfer
     (Amount      :        T_Euro := 0.00;
      Transmitter : in out T_Account;
      Payee       : in out T_Account);

   -------------------------------------------------------------------------------------------------
   procedure Display_History (Account : T_Account);


end Account;
