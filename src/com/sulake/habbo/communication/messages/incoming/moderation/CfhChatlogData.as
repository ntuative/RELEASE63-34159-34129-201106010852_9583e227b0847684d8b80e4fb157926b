package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1830:int;
      
      private var var_2516:int;
      
      private var var_1467:int;
      
      private var var_2451:int;
      
      private var var_118:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1830 = param1.readInteger();
         this.var_2516 = param1.readInteger();
         this.var_1467 = param1.readInteger();
         this.var_2451 = param1.readInteger();
         this.var_118 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1830);
      }
      
      public function get callId() : int
      {
         return this.var_1830;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2516;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1467;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2451;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_118;
      }
   }
}
