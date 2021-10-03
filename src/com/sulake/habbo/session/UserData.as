package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_920:String = "";
      
      private var var_605:String = "";
      
      private var var_2597:String = "";
      
      private var var_2307:int;
      
      private var var_2370:int = 0;
      
      private var var_2595:String = "";
      
      private var var_2596:int = 0;
      
      private var var_2363:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2307;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2307 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_920;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_920 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_605;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_605 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2597;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2597 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2370;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2370 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2595;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2595 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2596;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2596 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2363;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2363 = param1;
      }
   }
}
