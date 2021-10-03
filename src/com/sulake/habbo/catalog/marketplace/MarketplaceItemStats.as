package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2225:int;
      
      private var var_2848:int;
      
      private var var_2847:int;
      
      private var _dayOffsets:Array;
      
      private var var_2052:Array;
      
      private var var_2053:Array;
      
      private var var_2850:int;
      
      private var var_2849:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2225;
      }
      
      public function get offerCount() : int
      {
         return this.var_2848;
      }
      
      public function get historyLength() : int
      {
         return this.var_2847;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_2052;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_2053;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2850;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2849;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2225 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2848 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2847 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_2052 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_2053 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2850 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2849 = param1;
      }
   }
}
