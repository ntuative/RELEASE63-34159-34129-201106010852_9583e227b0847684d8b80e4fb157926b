package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_221:int = 0;
      
      private var var_1782:int = 0;
      
      private var var_1781:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_221;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1782;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1781;
      }
      
      public function flush() : Boolean
      {
         this.var_221 = 0;
         this.var_1782 = 0;
         this.var_1781 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_221 = param1.readInteger();
         this.var_1782 = param1.readInteger();
         this.var_1781 = param1.readString();
         return true;
      }
   }
}
