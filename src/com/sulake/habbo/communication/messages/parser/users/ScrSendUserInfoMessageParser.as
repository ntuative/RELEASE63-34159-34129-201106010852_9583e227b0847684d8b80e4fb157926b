package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2211:int = 1;
      
      public static const const_1745:int = 2;
       
      
      private var var_1039:String;
      
      private var var_2636:int;
      
      private var var_2638:int;
      
      private var var_2637:int;
      
      private var var_2635:int;
      
      private var var_2640:Boolean;
      
      private var var_2409:Boolean;
      
      private var var_2410:int;
      
      private var var_2408:int;
      
      private var var_2633:Boolean;
      
      private var var_2634:int;
      
      private var var_2639:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1039 = param1.readString();
         this.var_2636 = param1.readInteger();
         this.var_2638 = param1.readInteger();
         this.var_2637 = param1.readInteger();
         this.var_2635 = param1.readInteger();
         this.var_2640 = param1.readBoolean();
         this.var_2409 = param1.readBoolean();
         this.var_2410 = param1.readInteger();
         this.var_2408 = param1.readInteger();
         this.var_2633 = param1.readBoolean();
         this.var_2634 = param1.readInteger();
         this.var_2639 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1039;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2636;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2638;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2637;
      }
      
      public function get responseType() : int
      {
         return this.var_2635;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2640;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2409;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2410;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2408;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2633;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2634;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2639;
      }
   }
}
