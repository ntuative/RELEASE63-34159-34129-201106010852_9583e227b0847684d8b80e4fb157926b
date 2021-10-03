package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_108:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_137:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_727:int = 2;
      
      public static const const_796:int = 3;
      
      public static const const_1805:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1772:String = "";
      
      private var var_2307:int;
      
      private var var_2370:int = 0;
      
      private var var_2363:int = 0;
      
      private var var_605:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_238:Array;
      
      private var var_1452:int = 0;
      
      private var var_2368:String = "";
      
      private var var_2371:int = 0;
      
      private var var_2362:int = 0;
      
      private var var_2109:Boolean = false;
      
      private var var_1773:String = "";
      
      private var var_2180:Boolean = false;
      
      private var var_2364:Boolean = false;
      
      private var var_2365:Boolean = true;
      
      private var var_1122:int = 0;
      
      private var var_2375:Boolean = false;
      
      private var var_2374:Boolean = false;
      
      private var var_2367:Boolean = false;
      
      private var var_2372:Boolean = false;
      
      private var var_2366:Boolean = false;
      
      private var var_2369:Boolean = false;
      
      private var var_2373:int = 0;
      
      private var var_2107:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_238 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1772 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1772;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2307 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2307;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2370 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2370;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2363 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2363;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_605 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_605;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_238 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_238;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1452 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1452;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2368 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2368;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2364 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2364;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1122 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1122;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2375 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2375;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2374 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2374;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2367 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2367;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2372 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2372;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2366 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2366;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2369 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2369;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2373 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2373;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2365 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2365;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2107 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2107;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2371 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2371;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2362 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2362;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_2109 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_2109;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1773 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1773;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2180 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2180;
      }
   }
}
