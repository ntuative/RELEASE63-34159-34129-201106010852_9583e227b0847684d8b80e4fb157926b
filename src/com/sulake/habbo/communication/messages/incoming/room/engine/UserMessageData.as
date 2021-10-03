package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1340:String = "M";
      
      public static const const_1713:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_159:Number = 0;
      
      private var var_158:Number = 0;
      
      private var var_454:int = 0;
      
      private var _name:String = "";
      
      private var var_1640:int = 0;
      
      private var var_920:String = "";
      
      private var var_605:String = "";
      
      private var var_2597:String = "";
      
      private var var_2307:int;
      
      private var var_2370:int = 0;
      
      private var var_2595:String = "";
      
      private var var_2596:int = 0;
      
      private var var_2363:int = 0;
      
      private var var_2818:String = "";
      
      private var var_191:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_191 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_191)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_159;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_191)
         {
            this.var_159 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_158;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_191)
         {
            this.var_158 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_454;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_191)
         {
            this.var_454 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_191)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1640;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_191)
         {
            this.var_1640 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_920;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_191)
         {
            this.var_920 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_605;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_191)
         {
            this.var_605 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2597;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_191)
         {
            this.var_2597 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2307;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_191)
         {
            this.var_2307 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2370;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_191)
         {
            this.var_2370 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2595;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_191)
         {
            this.var_2595 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2596;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_191)
         {
            this.var_2596 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2363;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_191)
         {
            this.var_2363 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2818;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_191)
         {
            this.var_2818 = param1;
         }
      }
   }
}
