package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1778:int = 0;
      
      private var var_1777:int = 0;
      
      private var var_2579:int = 0;
      
      private var var_2580:Boolean = false;
      
      private var var_2409:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1778 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1777 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2579 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2580 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2409 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1778;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1777;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2579;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2580;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2409;
      }
   }
}
