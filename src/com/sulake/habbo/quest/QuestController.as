package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_667:QuestsList;
      
      private var var_551:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_384:QuestTracker;
      
      private var var_1045:CampaignCompleted;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_384 = new QuestTracker(this._questEngine);
         this.var_667 = new QuestsList(this._questEngine);
         this.var_551 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_1045 = new CampaignCompleted(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_667.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_667.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_384.onQuest(param1);
         this.var_551.onQuest(param1);
         this._questCompleted.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_384.onQuestCompleted(param1);
         this.var_551.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_384.onQuestCancelled();
         this.var_551.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_384.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_667.onRoomExit();
         this.var_384.onRoomExit();
         this.var_551.onRoomExit();
         this.var_1045.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_384.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_667)
         {
            this.var_667.dispose();
            this.var_667 = null;
         }
         if(this.var_384)
         {
            this.var_384.dispose();
            this.var_384 = null;
         }
         if(this.var_551)
         {
            this.var_551.dispose();
            this.var_551 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_1045)
         {
            this.var_1045.dispose();
            this.var_1045 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_667;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_551;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_384;
      }
      
      public function get campaignCompleted() : CampaignCompleted
      {
         return this.var_1045;
      }
   }
}
