package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2178:String;
      
      protected var var_1526:Number;
      
      protected var var_2961:Boolean;
      
      protected var var_2960:Boolean;
      
      protected var var_2301:Boolean;
      
      protected var var_2894:Boolean;
      
      protected var var_2966:int;
      
      protected var var_2297:int;
      
      protected var var_2300:int;
      
      protected var var_2298:int;
      
      protected var var_1780:String;
      
      protected var var_1690:int;
      
      protected var var_1046:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2301 = param5;
         this.var_2960 = param6;
         this.var_2961 = param7;
         this.var_2894 = param8;
         this.var_2178 = param9;
         this.var_1526 = param10;
         this.var_2966 = param11;
         this.var_2297 = param12;
         this.var_2300 = param13;
         this.var_2298 = param14;
         this.var_1780 = param15;
         this.var_1690 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2178;
      }
      
      public function get extra() : Number
      {
         return this.var_1526;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2961;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2960;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2301;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2894;
      }
      
      public function get expires() : int
      {
         return this.var_2966;
      }
      
      public function get creationDay() : int
      {
         return this.var_2297;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2300;
      }
      
      public function get creationYear() : int
      {
         return this.var_2298;
      }
      
      public function get slotId() : String
      {
         return this.var_1780;
      }
      
      public function get songId() : int
      {
         return this.var_1690;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_1046 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_1046;
      }
   }
}
