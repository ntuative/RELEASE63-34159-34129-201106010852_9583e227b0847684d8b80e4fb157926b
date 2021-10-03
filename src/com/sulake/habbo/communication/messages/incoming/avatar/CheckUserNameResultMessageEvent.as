package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   
   public class CheckUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_575:int = 0;
      
      public static var var_882:int = 1;
      
      public static var var_880:int = 2;
      
      public static var var_883:int = 3;
      
      public static var var_881:int = 4;
      
      public static var var_884:int = 5;
       
      
      public function CheckUserNameResultMessageEvent(param1:Function)
      {
         super(param1,CheckUserNameResultMessageParser);
      }
      
      public function getParser() : CheckUserNameResultMessageParser
      {
         return var_10 as CheckUserNameResultMessageParser;
      }
   }
}
