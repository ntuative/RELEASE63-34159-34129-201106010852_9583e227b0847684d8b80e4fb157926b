package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_888:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_599:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_888);
         this.var_599 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_599;
      }
   }
}
