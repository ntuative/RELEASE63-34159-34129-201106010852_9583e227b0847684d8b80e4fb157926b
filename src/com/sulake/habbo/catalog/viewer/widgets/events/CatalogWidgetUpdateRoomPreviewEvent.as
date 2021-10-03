package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetUpdateRoomPreviewEvent extends Event
   {
       
      
      private var var_1383:String = "default";
      
      private var _floorType:String = "default";
      
      private var var_1384:String = "1.1";
      
      private var _tileSize:int = 64;
      
      public function CatalogWidgetUpdateRoomPreviewEvent(param1:String, param2:String, param3:String, param4:int, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_UPDATE_ROOM_PREVIEW,param5,param6);
         this._floorType = param1;
         this.var_1383 = param2;
         this.var_1384 = param3;
         this._tileSize = param4;
      }
      
      public function get wallType() : String
      {
         return this.var_1383;
      }
      
      public function get floorType() : String
      {
         return this._floorType;
      }
      
      public function get landscapeType() : String
      {
         return this.var_1384;
      }
      
      public function get tileSize() : int
      {
         return this._tileSize;
      }
   }
}
