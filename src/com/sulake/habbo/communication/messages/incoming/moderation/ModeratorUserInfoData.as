package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2238:int;
      
      private var var_2236:int;
      
      private var _online:Boolean;
      
      private var var_2237:int;
      
      private var var_2235:int;
      
      private var var_2234:int;
      
      private var var_2233:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2238 = param1.readInteger();
         this.var_2236 = param1.readInteger();
         this._online = param1.readBoolean();
         this.var_2237 = param1.readInteger();
         this.var_2235 = param1.readInteger();
         this.var_2234 = param1.readInteger();
         this.var_2233 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2238;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2236;
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2237;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2235;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2234;
      }
      
      public function get banCount() : int
      {
         return this.var_2233;
      }
   }
}
