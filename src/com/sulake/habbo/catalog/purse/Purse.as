package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1715:int = 0;
      
      private var var_1438:Dictionary;
      
      private var var_1778:int = 0;
      
      private var var_1777:int = 0;
      
      private var var_2409:Boolean = false;
      
      private var var_2410:int = 0;
      
      private var var_2408:int = 0;
      
      public function Purse()
      {
         this.var_1438 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1715;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1715 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1778;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1778 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1777;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1777 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1778 > 0 || this.var_1777 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2409;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2409 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2410;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2410 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2408;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2408 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1438;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1438 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1438[param1];
      }
   }
}
