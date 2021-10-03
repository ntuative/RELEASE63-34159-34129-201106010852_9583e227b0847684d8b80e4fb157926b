package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_915:String = "RWWCIDE_CHAT_INPUT_CONTENT";
      
      public static const const_1166:String = "whisper";
      
      public static const const_1885:String = "shout";
       
      
      private var var_2940:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_915,param3,param4);
         this.var_2940 = param1;
         this._userName = param2;
      }
      
      public function get messageType() : String
      {
         return this.var_2940;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
