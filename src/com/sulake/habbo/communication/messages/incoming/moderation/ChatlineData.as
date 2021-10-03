package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2393:int;
      
      private var var_2395:int;
      
      private var var_2392:int;
      
      private var var_2394:String;
      
      private var var_2043:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2393 = param1.readInteger();
         this.var_2395 = param1.readInteger();
         this.var_2392 = param1.readInteger();
         this.var_2394 = param1.readString();
         this.var_2043 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2393;
      }
      
      public function get minute() : int
      {
         return this.var_2395;
      }
      
      public function get chatterId() : int
      {
         return this.var_2392;
      }
      
      public function get chatterName() : String
      {
         return this.var_2394;
      }
      
      public function get msg() : String
      {
         return this.var_2043;
      }
   }
}
