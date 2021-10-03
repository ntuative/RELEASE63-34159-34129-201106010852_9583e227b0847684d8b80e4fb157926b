package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2584:String;
      
      private var var_2582:String;
      
      private var var_464:BitmapDataAsset;
      
      private var var_1572:Boolean;
      
      private var var_1571:Boolean;
      
      private var var_2583:Boolean;
      
      private var _offsetX:int;
      
      private var var_1327:int;
      
      private var var_282:int;
      
      private var _height:int;
      
      private var var_858:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2584 = param1;
         this.var_2582 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_464 = _loc9_;
            this.var_858 = false;
         }
         else
         {
            this.var_464 = null;
            this.var_858 = true;
         }
         this.var_1572 = param4;
         this.var_1571 = param5;
         this._offsetX = param6;
         this.var_1327 = param7;
         this.var_2583 = param8;
      }
      
      public function dispose() : void
      {
         this.var_464 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_858 && this.var_464 != null)
         {
            _loc1_ = this.var_464.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_282 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_858 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1571;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1572;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_282;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2584;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2582;
      }
      
      public function get asset() : IAsset
      {
         return this.var_464;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2583;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1572)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1571)
         {
            return this.var_1327;
         }
         return -(this.height + this.var_1327);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1327;
      }
   }
}
