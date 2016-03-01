with P_Operation; use P_Operation;

package Account is

   type T_History is record
      Operation   : String(1..3);
      Amount      : T_Euro      := 0.00;
      Transmitter : Natural     := 0;
      Payee       : Natural     := 0;
   end record;

   type A_History is array (1 .. 10) of T_History;

   type T_Account is tagged
      record
      Balance : T_Euro;
      ID      : Natural;
      History : A_History;
      Date    : Integer;
   end record;

    procedure Creation(Balance : T_Euro; ID : Natural; History : A_History; Date : Integer := 0; Account : out T_Account);

end Account;
