package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_221:int = -1;
      
      private var var_1304:int = -1;
      
      private var var_1679:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_221;
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
      
      public function flush() : Boolean
      {
         this.var_221 = -1;
         this.var_1304 = -1;
         this.var_1679 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_221 = param1.readInteger();
         this.var_1304 = param1.readInteger();
         this.var_1679 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
