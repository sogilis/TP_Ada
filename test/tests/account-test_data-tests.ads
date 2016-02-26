with Gnattest_Generated;

package Account.Test_Data.Tests is

   type Test is new GNATtest_Generated.GNATtest_Standard.Account.Test_Data.Test
   with null record;

   procedure Test_Deposit (Gnattest_T : in out Test);

   procedure Test_Withdraw (Gnattest_T : in out Test);

   procedure Test_Is_Account_Creditor (Gnattest_T : in out Test);

   procedure Test_Transfer (Gnattest_T : in out Test);

end Account.Test_Data.Tests;
