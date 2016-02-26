with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;      use Ada.Text_IO;

package body Account.Test_Data.Tests is

   procedure Test_Deposit (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
      Test_Account : T_Account :=
        (Balance => 10.0, ID => 1, History => <>, Date => 0);
   begin
      Assert(Test_Account.Balance=10.0, "Balance initialization wrong");

      Account.Deposit (Amount => 30.0, Account => Test_Account);

      Assert(Test_Account.Balance=40.0, "After deposit balance wrong");

   end Test_Deposit;

   procedure Test_Withdraw (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
       Test_Account : T_Account :=
        (Balance => 40.0, ID => 1, History => <>, Date => 0);
   begin
      Assert(Test_Account.Balance=40.0, "Balance initialization wrong");

      Account.Withdraw (Amount => 30.0, Account => Test_Account);

      Assert(Test_Account.Balance=10.0, "After withdraw balance wrong");


   end Test_Withdraw;

   procedure Test_Is_Account_Creditor (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
   begin
      null;

   end Test_Is_Account_Creditor;

   procedure Test_Transfer (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
   begin
      null;

   end Test_Transfer;

end Account.Test_Data.Tests;
