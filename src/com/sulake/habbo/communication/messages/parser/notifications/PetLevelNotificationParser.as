package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1905:int;
      
      private var var_2434:String;
      
      private var var_1231:int;
      
      private var var_1304:int;
      
      private var var_1679:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1905 = param1.readInteger();
         this.var_2434 = param1.readString();
         this.var_1231 = param1.readInteger();
         this.var_1304 = param1.readInteger();
         this.var_1679 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1905;
      }
      
      public function get petName() : String
      {
         return this.var_2434;
      }
      
      public function get level() : int
      {
         return this.var_1231;
      }
      
      public function get petType() : int
      {
         return this.var_1304;
      }
      
      public function get breed() : int
      {
         return this.var_1679;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
