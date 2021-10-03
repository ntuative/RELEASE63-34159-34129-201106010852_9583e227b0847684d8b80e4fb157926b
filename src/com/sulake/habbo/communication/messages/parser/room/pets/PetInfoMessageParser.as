package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1905:int;
      
      private var _name:String;
      
      private var var_1231:int;
      
      private var var_2750:int;
      
      private var var_2273:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_605:String;
      
      private var var_2749:int;
      
      private var var_2751:int;
      
      private var var_2752:int;
      
      private var var_2515:int;
      
      private var var_2278:int;
      
      private var _ownerName:String;
      
      private var var_499:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1905;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1231;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2750;
      }
      
      public function get experience() : int
      {
         return this.var_2273;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_605;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2749;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2751;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2752;
      }
      
      public function get respect() : int
      {
         return this.var_2515;
      }
      
      public function get ownerId() : int
      {
         return this.var_2278;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_499;
      }
      
      public function flush() : Boolean
      {
         this.var_1905 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1905 = param1.readInteger();
         this._name = param1.readString();
         this.var_1231 = param1.readInteger();
         this.var_2750 = param1.readInteger();
         this.var_2273 = param1.readInteger();
         this.var_2749 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2751 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2752 = param1.readInteger();
         this.var_605 = param1.readString();
         this.var_2515 = param1.readInteger();
         this.var_2278 = param1.readInteger();
         this.var_499 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
