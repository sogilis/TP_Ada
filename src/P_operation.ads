package P_Operation is

   type T_Operation is (Deposit, Withdraw, Transfer, NA);
   type T_Euro is delta 0.01 range -100_000.00 .. 100_000.00;

end P_Operation;
