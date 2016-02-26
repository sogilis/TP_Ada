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

      Assert(Test_Account.Date= 1, "Date not updated");
      Assert(Test_Account.History(Test_Account.Date).Operation=Deposit, "Operation Wrong");

      Assert(Test_Account.History(Test_Account.Date).Amount=30.0, "Amount Wrong");
   end Test_Deposit;

   procedure Test_Withdraw (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
       Test_Account : T_Account :=
        (Balance => 40.0, ID => 1, History => <>, Date => 0);
   begin
      Assert(Test_Account.Balance=40.0, "Balance initialization wrong");

      Account.Withdraw (Amount => 30.0, Account => Test_Account);

      Assert(Test_Account.Balance=10.0, "After withdraw balance wrong");

      Assert(Test_Account.Date= 1, "Date not updated");

      Assert(Test_Account.History(Test_Account.Date).Operation=Withdraw, "Operation Wrong");

      Assert(Test_Account.History(Test_Account.Date).Amount=30.0, "Amount Wrong");
   end Test_Withdraw;

   procedure Test_Is_Account_Creditor (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
      Test_Account : T_Account :=
        (Balance => 40.0, ID => 1, History => <>, Date => 0);
   begin
      Assert(Account.Is_Account_Creditor(Test_Account)=True, "Account Creditor Wrong");
      Account.Withdraw (Amount => 50.0, Account => Test_Account);
      Assert(Account.Is_Account_Creditor(Test_Account)=False, "Account Debitor Wrong");
   end Test_Is_Account_Creditor;

   procedure Test_Transfer (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
      Test_Transmitter : T_Account :=
      (Balance => 40.0, ID => 1, History => <>, Date => 0);
      Test_Payee       : T_Account :=
      (Balance => 40.0, ID => 2, History => <>, Date => 0);
   begin
      Assert(Test_Transmitter.Balance=40.0, "Transmitter balance initialization wrong");

      Assert(Test_Payee.Balance=40.0, "Payee balance initialization wrong");

      Account.Transfer (Amount => 30.0, Transmitter => Test_Transmitter, Payee => Test_Payee);

      Assert(Test_Transmitter.Balance=10.0, "Transmitter balance wrong");

      Assert(Test_Payee.Balance=70.0, "Payee balance wrong");

      Assert(Test_Transmitter.Date= 1, "Transmitter Date not updated");

      Assert(Test_Payee.Date= 1, "Payee Date not updated");

      Assert(Test_Transmitter.History(Test_Transmitter.Date).Operation=Transfer, "Operation Wrong");

      Assert(Test_Transmitter.History(Test_Transmitter.Date).Amount=30.0, "Amount Wrong");

      Assert(Test_Payee.History(Test_Payee.Date).Operation=Transfer, "Operation Wrong");

      Assert(Test_Payee.History(Test_Payee.Date).Amount=30.0, "Amount Wrong");

      Assert(Test_Transmitter.History(Test_Transmitter.Date).Transmitter=1, "Transmitter ID Wrong");

      Assert(Test_Payee.History(Test_Payee.Date).Payee=2, "Payee ID Wrong");

   end Test_Transfer;

end Account.Test_Data.Tests;
