package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1972:int;
      
      private var _currentPosition:int;
      
      private var var_1971:int;
      
      private var var_1973:int;
      
      private var var_1974:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1972;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1971;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1973;
      }
      
      public function get syncCount() : int
      {
         return this.var_1974;
      }
      
      public function flush() : Boolean
      {
         this.var_1972 = -1;
         this._currentPosition = -1;
         this.var_1971 = -1;
         this.var_1973 = -1;
         this.var_1974 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1972 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1971 = param1.readInteger();
         this.var_1973 = param1.readInteger();
         this.var_1974 = param1.readInteger();
         return true;
      }
   }
}
