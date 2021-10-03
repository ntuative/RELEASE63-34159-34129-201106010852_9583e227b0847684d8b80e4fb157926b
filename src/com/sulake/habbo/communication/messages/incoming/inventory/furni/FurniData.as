package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2608:int;
      
      private var var_1499:String;
      
      private var _objId:int;
      
      private var var_1921:int;
      
      private var _category:int;
      
      private var var_2178:String;
      
      private var var_2624:Boolean;
      
      private var var_2623:Boolean;
      
      private var var_2625:Boolean;
      
      private var var_2476:Boolean;
      
      private var var_2203:int;
      
      private var var_1526:int;
      
      private var var_1780:String = "";
      
      private var var_1690:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2608 = param1;
         this.var_1499 = param2;
         this._objId = param3;
         this.var_1921 = param4;
         this._category = param5;
         this.var_2178 = param6;
         this.var_2624 = param7;
         this.var_2623 = param8;
         this.var_2625 = param9;
         this.var_2476 = param10;
         this.var_2203 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1780 = param1;
         this.var_1526 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2608;
      }
      
      public function get itemType() : String
      {
         return this.var_1499;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1921;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2178;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2624;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2623;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2625;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2476;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2203;
      }
      
      public function get slotId() : String
      {
         return this.var_1780;
      }
      
      public function get songId() : int
      {
         return this.var_1690;
      }
      
      public function get extra() : int
      {
         return this.var_1526;
      }
   }
}
