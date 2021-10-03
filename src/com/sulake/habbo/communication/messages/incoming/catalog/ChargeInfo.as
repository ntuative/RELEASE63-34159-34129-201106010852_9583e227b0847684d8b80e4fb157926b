package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2419:int;
      
      private var var_2496:int;
      
      private var var_1129:int;
      
      private var var_1131:int;
      
      private var var_1677:int;
      
      private var var_2495:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2419 = param1.readInteger();
         this.var_2496 = param1.readInteger();
         this.var_1129 = param1.readInteger();
         this.var_1131 = param1.readInteger();
         this.var_1677 = param1.readInteger();
         this.var_2495 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2419;
      }
      
      public function get charges() : int
      {
         return this.var_2496;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1129;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1131;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2495;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1677;
      }
   }
}
