package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1250:int;
      
      private var _furniId:int;
      
      private var var_2227:int;
      
      private var var_2178:String;
      
      private var var_1668:int;
      
      private var var_411:int;
      
      private var var_2224:int = -1;
      
      private var var_2225:int;
      
      private var var_1669:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1250 = param1;
         this._furniId = param2;
         this.var_2227 = param3;
         this.var_2178 = param4;
         this.var_1668 = param5;
         this.var_411 = param6;
         this.var_2224 = param7;
         this.var_2225 = param8;
         this.var_1669 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1250;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2227;
      }
      
      public function get stuffData() : String
      {
         return this.var_2178;
      }
      
      public function get price() : int
      {
         return this.var_1668;
      }
      
      public function get status() : int
      {
         return this.var_411;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2224;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2225;
      }
      
      public function get offerCount() : int
      {
         return this.var_1669;
      }
   }
}
