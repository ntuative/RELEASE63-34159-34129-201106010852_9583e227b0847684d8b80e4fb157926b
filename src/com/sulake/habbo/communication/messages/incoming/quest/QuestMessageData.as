package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1742:String;
      
      private var var_2339:int;
      
      private var var_2338:int;
      
      private var var_1677:int;
      
      private var _id:int;
      
      private var var_1744:Boolean;
      
      private var _type:String;
      
      private var var_1745:String;
      
      private var var_1743:int;
      
      private var _localizationCode:String;
      
      private var var_2337:int;
      
      private var var_2335:int;
      
      private var var_2336:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1742 = param1.readString();
         this.var_2339 = param1.readInteger();
         this.var_2338 = param1.readInteger();
         this.var_1677 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1744 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1745 = param1.readString();
         this.var_1743 = param1.readInteger();
         this._localizationCode = param1.readString();
         this.var_2337 = param1.readInteger();
         this.var_2335 = param1.readInteger();
         this.var_2336 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1745 = "";
         this.var_1743 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1742;
      }
      
      public function get localizationCode() : String
      {
         return this._localizationCode;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2339;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2338;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1677;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1744;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_1745;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1743;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2337;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2335;
      }
      
      public function get waitPeriodSeconds() : int
      {
         return this.var_2336;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1742;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this._localizationCode;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1744 = param1;
      }
   }
}
