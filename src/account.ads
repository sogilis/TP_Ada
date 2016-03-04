with P_Operation; use P_Operation;

package Account is

   -------------------------------------------------------------------------------------------------
   type A_History is array (1 .. 10) of T_Operation_Class_Access;
   NA : A_History := (null, null, null, null, null, null, null, null, null, null);
   -------------------------------------------------------------------------------------------------
   type T_Account is tagged record
      Balance : T_Euro;
      ID      : Natural;
      History : A_History := NA;
      Date    : Integer;
   end record;

   -------------------------------------------------------------------------------------------------
   type Pointer_Account is access T_Account;

end Account;
