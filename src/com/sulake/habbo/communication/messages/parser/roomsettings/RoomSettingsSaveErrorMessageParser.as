package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2029:int = 1;
      
      public static const const_2059:int = 2;
      
      public static const const_2099:int = 3;
      
      public static const const_2123:int = 4;
      
      public static const const_1692:int = 5;
      
      public static const const_2232:int = 6;
      
      public static const const_1910:int = 7;
      
      public static const const_1875:int = 8;
      
      public static const const_2133:int = 9;
      
      public static const const_1781:int = 10;
      
      public static const const_1710:int = 11;
      
      public static const const_1904:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1764:int;
      
      private var var_602:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1764 = param1.readInteger();
         this.var_602 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1764;
      }
      
      public function get info() : String
      {
         return this.var_602;
      }
   }
}
