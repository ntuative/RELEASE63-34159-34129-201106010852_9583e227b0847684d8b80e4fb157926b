package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1905:int;
      
      private var var_1231:int;
      
      private var var_2276:int;
      
      private var var_2273:int;
      
      private var var_2277:int;
      
      private var _energy:int;
      
      private var var_2275:int;
      
      private var _nutrition:int;
      
      private var var_2274:int;
      
      private var var_2278:int;
      
      private var _ownerName:String;
      
      private var var_2515:int;
      
      private var var_499:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1905;
      }
      
      public function get level() : int
      {
         return this.var_1231;
      }
      
      public function get levelMax() : int
      {
         return this.var_2276;
      }
      
      public function get experience() : int
      {
         return this.var_2273;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2277;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2275;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2274;
      }
      
      public function get ownerId() : int
      {
         return this.var_2278;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2515;
      }
      
      public function get age() : int
      {
         return this.var_499;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1905 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1231 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2276 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2273 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2277 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2275 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2274 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2278 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2515 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_499 = param1;
      }
   }
}
