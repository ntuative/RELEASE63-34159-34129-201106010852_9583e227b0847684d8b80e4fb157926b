package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1443:Boolean;
      
      private var var_2209:int;
      
      private var var_1844:int;
      
      private var var_1843:int;
      
      private var var_2206:int;
      
      private var var_2207:int;
      
      private var var_2210:int;
      
      private var var_2208:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1443;
      }
      
      public function get commission() : int
      {
         return this.var_2209;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1844;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1843;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2207;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2206;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2210;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2208;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1443 = param1.readBoolean();
         this.var_2209 = param1.readInteger();
         this.var_1844 = param1.readInteger();
         this.var_1843 = param1.readInteger();
         this.var_2207 = param1.readInteger();
         this.var_2206 = param1.readInteger();
         this.var_2210 = param1.readInteger();
         this.var_2208 = param1.readInteger();
         return true;
      }
   }
}
