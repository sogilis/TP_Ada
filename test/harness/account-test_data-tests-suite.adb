with AUnit.Test_Caller;
with Gnattest_Generated;

package body Account.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Account.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Deposit_6e243f : aliased Runner_1.Test_Case;
   Case_2_1_Test_Withdraw_5f5135 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Is_Account_Creditor_6a67f2 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Transfer_2d6797 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Deposit_6e243f,
         "account.ads:25:4:",
         Test_Deposit'Access);
      Runner_1.Create
        (Case_2_1_Test_Withdraw_5f5135,
         "account.ads:28:4:",
         Test_Withdraw'Access);
      Runner_1.Create
        (Case_4_1_Test_Is_Account_Creditor_6a67f2,
         "account.ads:34:4:",
         Test_Is_Account_Creditor'Access);
      Runner_1.Create
        (Case_6_1_Test_Transfer_2d6797,
         "account.ads:40:4:",
         Test_Transfer'Access);

      Result.Add_Test (Case_1_1_Test_Deposit_6e243f'Access);
      Result.Add_Test (Case_2_1_Test_Withdraw_5f5135'Access);
      Result.Add_Test (Case_4_1_Test_Is_Account_Creditor_6a67f2'Access);
      Result.Add_Test (Case_6_1_Test_Transfer_2d6797'Access);

      return Result'Access;

   end Suite;

end Account.Test_Data.Tests.Suite;
