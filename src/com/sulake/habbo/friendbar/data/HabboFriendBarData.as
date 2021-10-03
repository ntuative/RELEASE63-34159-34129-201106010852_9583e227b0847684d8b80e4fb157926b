package com.sulake.habbo.friendbar.data
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.BuddyRequestsEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FindFriendsProcessResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendNotificationEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewBuddyRequestEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewConsoleMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.FindNewFriendsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.FollowFriendMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.ConversionPointMessageComposer;
   import com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.FriendNotificationMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteMessageParser;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.messenger.IHabboMessenger;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboMessenger;
   
   public class HabboFriendBarData extends Component implements IHabboFriendBarData
   {
      
      private static const const_298:Boolean = false;
      
      private static const const_1020:Boolean = false;
      
      private static const const_643:String = "Navigation";
      
      private static const const_642:String = "Friend Bar";
      
      private static const const_1381:String = "go.friendbar";
      
      private static const const_1384:String = "chat_btn_click";
      
      private static const const_1385:String = "find_friends_btn_click";
      
      private static const const_1019:String = "Toolbar";
      
      private static const const_1021:String = "open";
      
      private static const const_1018:String = "close";
      
      private static const const_1383:String = "FRIENDLIST";
      
      private static const const_1382:String = "MESSENGER";
       
      
      private var var_84:IHabboCommunicationManager;
      
      private var var_296:IHabboFriendList;
      
      private var var_424:IHabboMessenger;
      
      private var var_137:Array;
      
      private var var_297:Map;
      
      private var _friendRequests:Array;
      
      private var var_914:int;
      
      public function HabboFriendBarData(param1:HabboFriendBar, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_137 = new Array();
         this.var_297 = new Map();
         this._friendRequests = new Array();
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerAvailable);
         queueInterface(new IIDHabboFriendList(),this.onFriendListComponentAvailable);
         queueInterface(new IIDHabboMessenger(),this.onMessengerComponentAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_84)
            {
               this.var_84.release(new IIDHabboCommunicationManager());
               this.var_84 = null;
            }
            if(this.var_296)
            {
               this.var_296.release(new IIDHabboFriendList());
               this.var_296 = null;
            }
            if(this.var_424)
            {
               this.var_424.release(new IIDHabboMessenger());
               this.var_424 = null;
            }
            this.var_137 = null;
            this.var_297.dispose();
            this.var_297 = null;
            this._friendRequests = null;
            super.dispose();
         }
      }
      
      public function get numFriends() : int
      {
         return this.var_137.length;
      }
      
      public function getFriendAt(param1:int) : IFriendEntity
      {
         return this.var_137[param1];
      }
      
      public function getFriendByID(param1:int) : IFriendEntity
      {
         return this.var_297.getValue(param1);
      }
      
      public function getFriendByName(param1:String) : IFriendEntity
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_137)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get numFriendRequests() : int
      {
         return this._friendRequests.length;
      }
      
      public function getFriendRequestAt(param1:int) : FriendRequest
      {
         return this._friendRequests[param1];
      }
      
      public function getFriendRequestByID(param1:int) : FriendRequest
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._friendRequests)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getFriendRequestByName(param1:String) : FriendRequest
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._friendRequests)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function followToRoom(param1:int) : void
      {
         if(this.var_84)
         {
            this.var_84.getHabboMainConnection(null).send(new FollowFriendMessageComposer(param1));
            this.var_84.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_643,const_642,const_1381));
         }
      }
      
      public function startConversation(param1:int) : void
      {
         if(this.var_424)
         {
            this.var_424.startConversation(param1);
            events.dispatchEvent(new NewMessageEvent(false,param1));
            if(this.var_84)
            {
               this.var_84.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_643,const_642,const_1384));
            }
         }
      }
      
      public function findNewFriends() : void
      {
         if(this.var_84)
         {
            this.var_84.getHabboMainConnection(null).send(new FindNewFriendsMessageComposer());
            this.var_84.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_643,const_642,const_1385));
         }
      }
      
      public function toggleFriendList() : void
      {
         var _loc1_:* = null;
         if(this.var_296)
         {
            if(!this.var_296.disposed)
            {
               if(!this.var_296.isOpen())
               {
                  if(this._friendRequests.length > 0)
                  {
                     this.var_296.openFriendRequests();
                  }
                  else
                  {
                     this.var_296.openFriendList();
                  }
               }
               else
               {
                  _loc1_ = this.var_296.mainWindow;
                  if(_loc1_ != null && WindowToggle.isHiddenByOtherWindows(_loc1_))
                  {
                     _loc1_.activate();
                     return;
                  }
                  this.var_296.close();
               }
               if(this.var_84)
               {
                  this.var_84.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_1019,const_1383,!!this.var_296.isOpen() ? const_1021 : const_1018));
               }
            }
         }
      }
      
      public function toggleMessenger() : void
      {
         if(this.var_424)
         {
            if(!this.var_424.disposed)
            {
               this.var_424.toggleMessenger();
               if(this.var_84)
               {
                  this.var_84.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_1019,const_1382,!!this.var_424.isOpen() ? const_1021 : const_1018));
               }
            }
         }
      }
      
      private function onCommunicationManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_84 = param2 as IHabboCommunicationManager;
         this.var_84.addHabboConnectionMessageEvent(new MessengerInitEvent(this.onMessengerInitialized));
         this.var_84.addHabboConnectionMessageEvent(new FriendListUpdateEvent(this.onFriendListUpdate));
         this.var_84.addHabboConnectionMessageEvent(new FindFriendsProcessResultEvent(this.onFindFriendProcessResult));
         this.var_84.addHabboConnectionMessageEvent(new NewBuddyRequestEvent(this.onNewFriendRequest));
         this.var_84.addHabboConnectionMessageEvent(new BuddyRequestsEvent(this.onFriendRequestList));
         this.var_84.addHabboConnectionMessageEvent(new NewConsoleMessageEvent(this.onNewConsoleMessage));
         this.var_84.addHabboConnectionMessageEvent(new RoomInviteEvent(this.onRoomInvite));
         this.var_84.addHabboConnectionMessageEvent(new FriendNotificationEvent(this.onFriendNotification));
      }
      
      private function onMessengerComponentAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_424 = param2 as IHabboMessenger;
      }
      
      private function onFriendListComponentAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_296 = param2 as IHabboFriendList;
      }
      
      private function onMessengerInitialized(param1:IMessageEvent) : void
      {
         this.buildFriendList(MessengerInitEvent(param1).getParser().friends);
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc2_:FriendListUpdateMessageParser = FriendListUpdateEvent(param1).getParser();
         var _loc5_:Array = _loc2_.removedFriendIds;
         var _loc6_:Array = _loc2_.updatedFriends;
         var _loc7_:Array = _loc2_.addedFriends;
         for each(_loc8_ in _loc5_)
         {
            _loc3_ = this.var_297.getValue(_loc8_);
            if(_loc3_)
            {
               this.var_297.remove(_loc8_);
               this.var_137.splice(this.var_137.indexOf(_loc3_),1);
            }
         }
         for each(_loc4_ in _loc6_)
         {
            _loc3_ = this.var_297.getValue(_loc4_.id);
            if(_loc3_)
            {
               if(_loc4_.online || const_298)
               {
                  _loc3_.name = _loc4_.name;
                  _loc3_.realName = _loc4_.realName;
                  _loc3_.motto = _loc4_.motto;
                  _loc3_.gender = _loc4_.gender;
                  _loc3_.online = _loc4_.online;
                  _loc3_.allowFollow = _loc4_.followingAllowed;
                  _loc3_.figure = _loc4_.figure;
                  _loc3_.categoryId = _loc4_.categoryId;
                  _loc3_.lastAccess = _loc4_.lastAccess;
               }
               else
               {
                  this.var_297.remove(_loc4_.id);
                  this.var_137.splice(this.var_137.indexOf(_loc3_),1);
               }
            }
            else if(_loc4_.online || const_298)
            {
               _loc3_ = new FriendEntity(_loc4_.id,_loc4_.name,_loc4_.realName,_loc4_.motto,_loc4_.gender,_loc4_.online,_loc4_.followingAllowed,_loc4_.figure,_loc4_.categoryId,_loc4_.lastAccess);
               this.var_137.splice(0,0,_loc3_);
               this.var_297.add(_loc3_.id,_loc3_);
            }
         }
         for each(_loc4_ in _loc7_)
         {
            if(_loc4_.online || const_298)
            {
               if(this.var_297.getValue(_loc4_.id) == null)
               {
                  _loc3_ = new FriendEntity(_loc4_.id,_loc4_.name,_loc4_.realName,_loc4_.motto,_loc4_.gender,_loc4_.online,_loc4_.followingAllowed,_loc4_.figure,_loc4_.categoryId,_loc4_.lastAccess);
                  this.var_137.push(_loc3_);
                  this.var_297.add(_loc3_.id,_loc3_);
               }
            }
         }
         if(_loc7_.length > 0 || _loc6_.length > 0)
         {
            this.var_137 = !!const_298 ? this.sortByNameAndOnlineStatus(this.var_137) : this.sortByName(this.var_137);
         }
         events.dispatchEvent(new FriendBarUpdateEvent());
      }
      
      private function onFindFriendProcessResult(param1:FindFriendsProcessResultEvent) : void
      {
         events.dispatchEvent(new FindFriendsNotificationEvent(param1.success));
      }
      
      private function onNewFriendRequest(param1:NewBuddyRequestEvent) : void
      {
         var _loc2_:FriendRequestData = param1.getParser().req;
         this._friendRequests.push(new FriendRequest(_loc2_.requestId,_loc2_.requesterName));
         events.dispatchEvent(new FriendRequestEvent());
      }
      
      private function onFriendRequestList(param1:BuddyRequestsEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = param1.getParser().reqs;
         for each(_loc3_ in _loc2_)
         {
            this._friendRequests.push(new FriendRequest(_loc3_.requestId,_loc3_.requesterName));
         }
         events.dispatchEvent(new FriendRequestEvent());
      }
      
      private function onNewConsoleMessage(param1:NewConsoleMessageEvent) : void
      {
         var _loc2_:NewConsoleMessageMessageParser = param1.getParser();
         this.var_914 = _loc2_.senderId;
         events.dispatchEvent(new NewMessageEvent(true,this.var_914));
         this.makeNotification(String(this.var_914),FriendNotification.const_594,null,false);
      }
      
      private function onRoomInvite(param1:RoomInviteEvent) : void
      {
         var _loc2_:RoomInviteMessageParser = param1.getParser();
         this.var_914 = _loc2_.senderId;
         events.dispatchEvent(new NewMessageEvent(true,this.var_914));
         this.makeNotification(String(this.var_914),FriendNotification.const_594,null,true);
      }
      
      private function onFriendNotification(param1:FriendNotificationEvent) : void
      {
         var _loc2_:FriendNotificationMessageParser = param1.getParser();
         this.makeNotification(_loc2_.avatarId,_loc2_.typeCode,_loc2_.message,true);
      }
      
      private function makeNotification(param1:String, param2:int, param3:String, param4:Boolean) : void
      {
      }
      
      private function buildFriendList(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_.online || const_298)
            {
               _loc3_ = new FriendEntity(_loc2_.id,_loc2_.name,_loc2_.realName,_loc2_.motto,_loc2_.gender,_loc2_.online,_loc2_.followingAllowed,_loc2_.figure,_loc2_.categoryId,_loc2_.lastAccess);
               this.var_137.push(_loc3_);
               this.var_297.add(_loc3_.id,_loc3_);
            }
         }
         this.var_137 = !!const_298 ? this.sortByNameAndOnlineStatus(this.var_137) : this.sortByName(this.var_137);
         events.dispatchEvent(new FriendBarUpdateEvent());
      }
      
      private function sortByName(param1:Array) : Array
      {
         if(const_1020)
         {
            param1.sortOn("name",[Array.CASEINSENSITIVE]);
         }
         return param1;
      }
      
      private function sortByNameAndOnlineStatus(param1:Array) : Array
      {
         var _loc4_:* = null;
         var _loc2_:* = [];
         var _loc3_:* = [];
         var _loc5_:int = param1.length;
         while(_loc5_-- > 0)
         {
            _loc4_ = param1[_loc5_];
            if(_loc4_.online)
            {
               _loc2_.push(_loc4_);
            }
            else
            {
               _loc3_.push(_loc4_);
            }
         }
         if(const_1020)
         {
            _loc2_.sortOn("name",[Array.CASEINSENSITIVE]);
            _loc3_.sortOn("name",[0 | 0]);
         }
         _loc5_ = _loc3_.length;
         while(_loc5_-- > 0)
         {
            _loc2_.push(_loc3_.pop());
         }
         return _loc2_;
      }
   }
}
