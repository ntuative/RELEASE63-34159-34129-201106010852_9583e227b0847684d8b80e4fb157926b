package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      protected var var_99:Offer;
      
      private var var_1206:Array;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         this.var_99 = param1;
         this.var_1206 = param2;
      }
      
      public function get products() : Array
      {
         return this.var_1206;
      }
      
      public function get firstProduct() : IProduct
      {
         return this.var_1206[0] as IProduct;
      }
      
      public function get offer() : Offer
      {
         return this.var_99;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         for each(_loc1_ in this.var_1206)
         {
            _loc1_.dispose();
         }
         this.var_1206 = null;
         super.dispose();
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
   }
}
