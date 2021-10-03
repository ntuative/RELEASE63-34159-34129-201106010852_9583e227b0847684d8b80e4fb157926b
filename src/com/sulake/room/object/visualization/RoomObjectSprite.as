package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1186:int = 0;
       
      
      private var var_464:BitmapData = null;
      
      private var var_2584:String = "";
      
      private var var_327:Boolean = true;
      
      private var var_2457:String = "";
      
      private var var_2731:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1997:String;
      
      private var var_1572:Boolean = false;
      
      private var var_1571:Boolean = false;
      
      private var _offset:Point;
      
      private var var_282:int = 0;
      
      private var _height:int = 0;
      
      private var var_1299:Number = 0;
      
      private var var_2762:Boolean = false;
      
      private var var_2761:Boolean = true;
      
      private var var_2417:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var var_2499:int = 0;
      
      private var var_2763:Array = null;
      
      public function RoomObjectSprite()
      {
         this.var_1997 = BlendMode.NORMAL;
         this._offset = new Point(0,0);
         super();
         this.var_2499 = var_1186++;
      }
      
      public function dispose() : void
      {
         this.var_464 = null;
         this.var_282 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_464;
      }
      
      public function get assetName() : String
      {
         return this.var_2584;
      }
      
      public function get visible() : Boolean
      {
         return this.var_327;
      }
      
      public function get tag() : String
      {
         return this.var_2457;
      }
      
      public function get alpha() : int
      {
         return this.var_2731;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_1997;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1571;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1572;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_282;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1299;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2762;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2761;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2417;
      }
      
      public function get instanceId() : int
      {
         return this.var_2499;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_2763;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_282 = param1.width;
            this._height = param1.height;
         }
         this.var_464 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2584 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_327 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2457 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2731 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_1997 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_2763 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1572 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1571 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1299 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2762 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2761 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2417 = param1;
         ++this._updateID;
      }
   }
}
