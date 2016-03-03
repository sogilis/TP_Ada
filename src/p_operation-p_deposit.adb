with Ada.Text_IO; use Ada.Text_IO;

package body P_Operation.P_Deposit is

   procedure Make (Pointer_Deposit : in out T_Operation_Class_Access) is
   begin

      Pointer_Deposit.all.Deposit.Ptr_Account.all.Date := Pointer_Deposit.all.Deposit.Ptr_Account.all.Date + 1;

      Pointer_Deposit.all.Deposit.Ptr_Account.all.Balance :=
        Pointer_Deposit.all.Deposit.Ptr_Account.all.Balance + Pointer_Deposit.all.Deposit.Amount;

      Pointer_Deposit.all.Deposit.Ptr_Account.all.History (Pointer_Deposit.all.Deposit.Ptr_Account.all.Date) :=
        Pointer_Deposit;

   end Make;

   procedure Display (Deposit: T_Deposit) is
   begin
      Put_Line("Deposit of " &T_Euro'Image (Deposit.Amount) & " Euros");
   end Display;


end P_Operation.P_Deposit;
