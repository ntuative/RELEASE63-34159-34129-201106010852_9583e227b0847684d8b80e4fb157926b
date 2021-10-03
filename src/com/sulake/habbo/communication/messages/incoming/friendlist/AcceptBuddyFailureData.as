package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_1080:String;
      
      private var var_1764:int;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1080 = param1.readString();
         this.var_1764 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_1080;
      }
      
      public function get errorCode() : int
      {
         return this.var_1764;
      }
   }
}
