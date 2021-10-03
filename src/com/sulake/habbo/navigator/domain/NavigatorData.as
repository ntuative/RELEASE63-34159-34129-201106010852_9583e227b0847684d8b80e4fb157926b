package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2012:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_214:MsgWithRequestId;
      
      private var var_671:RoomEventData;
      
      private var var_2779:Boolean;
      
      private var var_2783:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2292:int;
      
      private var var_274:GuestRoomData;
      
      private var var_1051:PublicRoomShortData;
      
      private var var_2782:int;
      
      private var var_2780:Boolean;
      
      private var var_2786:int;
      
      private var var_2777:Boolean;
      
      private var var_2008:int;
      
      private var var_2781:Boolean;
      
      private var var_1506:Array;
      
      private var var_1556:Array;
      
      private var var_2785:int;
      
      private var var_1555:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1297:Boolean;
      
      private var var_2776:int;
      
      private var var_2778:Boolean;
      
      private var var_2784:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1506 = new Array();
         this.var_1556 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_274 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_274 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1051 = null;
         this.var_274 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1051 = param1.publicSpace;
            this.var_671 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_671 != null)
         {
            this.var_671.dispose();
            this.var_671 = null;
         }
         if(this.var_1051 != null)
         {
            this.var_1051.dispose();
            this.var_1051 = null;
         }
         if(this.var_274 != null)
         {
            this.var_274.dispose();
            this.var_274 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_274 != null)
         {
            this.var_274.dispose();
         }
         this.var_274 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_671 != null)
         {
            this.var_671.dispose();
         }
         this.var_671 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_214 != null && this.var_214 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_214 != null && this.var_214 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_214 != null && this.var_214 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_214 = param1;
         this.var_1297 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_214 = param1;
         this.var_1297 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_214 = param1;
         this.var_1297 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_214 == null)
         {
            return;
         }
         this.var_214.dispose();
         this.var_214 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_214 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_214 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_214 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_671;
      }
      
      public function get avatarId() : int
      {
         return this.var_2292;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2779;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2783;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_274;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1051;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2780;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2786;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_2008;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2777;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2776;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2782;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2781;
      }
      
      public function get adIndex() : int
      {
         return this.var_2784;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2778;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2292 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2786 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2780 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2779 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2783 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2777 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_2008 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2776 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2782 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2781 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2784 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2778 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1506 = param1;
         this.var_1556 = new Array();
         for each(_loc2_ in this.var_1506)
         {
            if(_loc2_.visible)
            {
               this.var_1556.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1506;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1556;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2785 = param1.limit;
         this.var_1555 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1555 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_274.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_274 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_274.flatId;
         return this.var_2008 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1555 >= this.var_2785;
      }
      
      public function startLoading() : void
      {
         this.var_1297 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1297;
      }
   }
}
