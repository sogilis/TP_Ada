with Ada.Text_IO; use Ada.Text_IO;

package body Account is

   procedure Creation(Balance : T_Euro; ID : Natural; History : A_History; Date : Integer := 0; Account : out T_Account) is
   begin
      Account := (Balance, ID, History, Date);
   end Creation;

end Account;
