package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1727:int = 1;
      
      public static const const_2065:int = 2;
      
      public static const const_1777:int = 3;
      
      public static const const_1739:int = 4;
       
      
      private var var_1390:int = 0;
      
      private var var_1391:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1390 = 0;
         this.var_1391 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1390 = param1.readInteger();
         if(this.var_1390 == 3)
         {
            this.var_1391 = param1.readString();
         }
         else
         {
            this.var_1391 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1390;
      }
      
      public function get parameter() : String
      {
         return this.var_1391;
      }
   }
}
