package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1231:int;
      
      private var var_300:String;
      
      private var var_1970:int;
      
      private var var_2405:int;
      
      private var var_1794:int;
      
      private var var_1969:int;
      
      private var var_1968:Boolean;
      
      private var _category:String;
      
      private var var_2719:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1231 = param1.readInteger();
         this.var_300 = param1.readString();
         this.var_1970 = Math.max(1,param1.readInteger());
         this.var_2405 = param1.readInteger();
         this.var_1794 = param1.readInteger();
         this.var_1969 = param1.readInteger();
         this.var_1968 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2719 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_300;
      }
      
      public function get level() : int
      {
         return this.var_1231;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1970;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2405;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1794;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1969;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1968;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2719;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1231 > 1 || this.var_1968;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1969 = this.var_1970;
      }
   }
}
