package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1811:String = "pricing_model_unknown";
      
      public static const const_409:String = "pricing_model_single";
      
      public static const const_410:String = "pricing_model_multi";
      
      public static const const_597:String = "pricing_model_bundle";
      
      public static const const_1787:String = "price_type_none";
      
      public static const const_884:String = "price_type_credits";
      
      public static const const_1238:String = "price_type_activitypoints";
      
      public static const const_1266:String = "price_type_credits_and_activitypoints";
       
      
      private var var_726:String;
      
      private var var_1130:String;
      
      private var var_1250:int;
      
      private var var_1678:String;
      
      private var var_1129:int;
      
      private var var_1131:int;
      
      private var var_1677:int;
      
      private var var_371:ICatalogPage;
      
      private var var_593:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2213:int = 0;
      
      private var var_2254:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1250 = param1;
         this.var_1678 = param2;
         this.var_1129 = param3;
         this.var_1131 = param4;
         this.var_1677 = param5;
         this.var_371 = param8;
         this.var_2213 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_2213;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_371;
      }
      
      public function get offerId() : int
      {
         return this.var_1250;
      }
      
      public function get localizationId() : String
      {
         return this.var_1678;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1129;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1131;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1677;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_593;
      }
      
      public function get pricingModel() : String
      {
         return this.var_726;
      }
      
      public function get priceType() : String
      {
         return this.var_1130;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2254;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2254 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1250 = 0;
         this.var_1678 = "";
         this.var_1129 = 0;
         this.var_1131 = 0;
         this.var_1677 = 0;
         this.var_371 = null;
         if(this.var_593 != null)
         {
            this.var_593.dispose();
            this.var_593 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_726)
         {
            case const_409:
               this.var_593 = new SingleProductContainer(this,param1);
               break;
            case const_410:
               this.var_593 = new MultiProductContainer(this,param1);
               break;
            case const_597:
               this.var_593 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_726);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_726 = const_409;
            }
            else
            {
               this.var_726 = const_410;
            }
         }
         else if(param1.length > 1)
         {
            this.var_726 = const_597;
         }
         else
         {
            this.var_726 = const_1811;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1129 > 0 && this.var_1131 > 0)
         {
            this.var_1130 = const_1266;
         }
         else if(this.var_1129 > 0)
         {
            this.var_1130 = const_884;
         }
         else if(this.var_1131 > 0)
         {
            this.var_1130 = const_1238;
         }
         else
         {
            this.var_1130 = const_1787;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_371.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_593.products)
         {
            _loc4_ = this.var_371.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
