package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1231:int;
      
      private var var_1761:int;
      
      private var var_2405:int;
      
      private var var_1794:int;
      
      private var var_1451:int;
      
      private var var_300:int;
      
      private var var_2403:String = "";
      
      private var var_2404:String = "";
      
      private var var_2406:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1231 = param1.readInteger();
         this.var_300 = param1.readInteger();
         this.var_2403 = param1.readString();
         this.var_1761 = param1.readInteger();
         this.var_2405 = param1.readInteger();
         this.var_1794 = param1.readInteger();
         this.var_1451 = param1.readInteger();
         this.var_2406 = param1.readInteger();
         this.var_2404 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1231;
      }
      
      public function get points() : int
      {
         return this.var_1761;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2405;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1794;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1451;
      }
      
      public function get badgeId() : int
      {
         return this.var_300;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2403;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2404;
      }
      
      public function get achievementID() : int
      {
         return this.var_2406;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
