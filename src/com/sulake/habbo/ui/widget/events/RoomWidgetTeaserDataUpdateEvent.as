package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_608:String = "RWTDUE_TEASER_DATA";
      
      public static const const_940:String = "RWTDUE_GIFT_DATA";
      
      public static const const_944:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_221:int;
      
      private var _data:String;
      
      private var var_411:int;
      
      private var var_196:String;
      
      private var var_2248:String;
      
      private var var_2249:Boolean;
      
      private var var_1594:int = 0;
      
      private var var_2325:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_221;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_411;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2248;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2249;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2325;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1594;
      }
      
      public function set status(param1:int) : void
      {
         this.var_411 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2248 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2249 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2325 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_221 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_196;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_196 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1594 = param1;
      }
   }
}
