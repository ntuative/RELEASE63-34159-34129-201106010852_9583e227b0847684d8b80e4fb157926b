package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1250:int;
      
      private var var_1816:String;
      
      private var var_1668:int;
      
      private var _upgrade:Boolean;
      
      private var var_2870:Boolean;
      
      private var var_2868:int;
      
      private var var_2869:int;
      
      private var var_2871:int;
      
      private var var_2873:int;
      
      private var var_2872:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1250 = param1.readInteger();
         this.var_1816 = param1.readString();
         this.var_1668 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2870 = param1.readBoolean();
         this.var_2868 = param1.readInteger();
         this.var_2869 = param1.readInteger();
         this.var_2871 = param1.readInteger();
         this.var_2873 = param1.readInteger();
         this.var_2872 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1250;
      }
      
      public function get productCode() : String
      {
         return this.var_1816;
      }
      
      public function get price() : int
      {
         return this.var_1668;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2870;
      }
      
      public function get periods() : int
      {
         return this.var_2868;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2869;
      }
      
      public function get year() : int
      {
         return this.var_2871;
      }
      
      public function get month() : int
      {
         return this.var_2873;
      }
      
      public function get day() : int
      {
         return this.var_2872;
      }
   }
}
