package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_361:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_1795:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_2931:Boolean = false;
      
      private var var_2932:Boolean = false;
      
      private var var_2107:Boolean = false;
      
      private var var_2106:Boolean = false;
      
      private var var_2834:Boolean = false;
      
      private var var_1712:int = -1;
      
      private var var_2585:int = -1;
      
      private var var_1250:int = -1;
      
      private var var_1142:String = "";
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1795 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1795;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2931 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2931;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2932 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2932;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2107 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2107;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_2106 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_2106;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2834 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2834;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1712 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1712;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2585 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2585;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1250 = param1;
      }
      
      public function get offerId() : int
      {
         return this.var_1250;
      }
      
      public function set extraParam(param1:String) : void
      {
         this.var_1142 = param1;
      }
      
      public function get extraParam() : String
      {
         return this.var_1142;
      }
   }
}
