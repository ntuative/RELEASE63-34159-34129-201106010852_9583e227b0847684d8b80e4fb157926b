package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_178:IWindowContainer;
      
      private var var_2995:int;
      
      private var var_387:RoomEventViewCtrl;
      
      private var var_388:Timer;
      
      private var var_145:RoomSettingsCtrl;
      
      private var var_273:RoomThumbnailCtrl;
      
      private var var_1048:TagRenderer;
      
      private var var_386:IWindowContainer;
      
      private var var_389:IWindowContainer;
      
      private var var_669:IWindowContainer;
      
      private var var_2006:IWindowContainer;
      
      private var var_2005:IWindowContainer;
      
      private var var_1292:IWindowContainer;
      
      private var var_958:ITextWindow;
      
      private var var_1047:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_827:ITextWindow;
      
      private var var_1293:ITextWindow;
      
      private var var_1050:ITextWindow;
      
      private var var_831:ITextWindow;
      
      private var var_1552:ITextWindow;
      
      private var var_272:IWindowContainer;
      
      private var var_829:IWindowContainer;
      
      private var var_1548:IWindowContainer;
      
      private var var_2007:ITextWindow;
      
      private var var_668:ITextWindow;
      
      private var var_2004:IWindow;
      
      private var var_1296:IContainerButtonWindow;
      
      private var var_1291:IContainerButtonWindow;
      
      private var var_1295:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1294:IContainerButtonWindow;
      
      private var var_1551:IButtonWindow;
      
      private var var_1549:IButtonWindow;
      
      private var var_1553:IButtonWindow;
      
      private var var_830:IWindowContainer;
      
      private var var_1290:ITextWindow;
      
      private var var_1049:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_828:IButtonWindow;
      
      private var var_1550:Boolean = false;
      
      private const const_731:int = 75;
      
      private const const_908:int = 3;
      
      private const const_955:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_387 = new RoomEventViewCtrl(this._navigator);
         this.var_145 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_273 = new RoomThumbnailCtrl(this._navigator);
         this.var_1048 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_145);
         this.var_388 = new Timer(6000,1);
         this.var_388.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_388)
         {
            this.var_388.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_388.reset();
            this.var_388 = null;
         }
         this._navigator = null;
         this.var_387 = null;
         this.var_145 = null;
         this.var_273 = null;
         if(this.var_1048)
         {
            this.var_1048.dispose();
            this.var_1048 = null;
         }
         this.var_178 = null;
         this.var_386 = null;
         this.var_389 = null;
         this.var_669 = null;
         this.var_2006 = null;
         this.var_2005 = null;
         this.var_1292 = null;
         this.var_958 = null;
         this.var_1047 = null;
         this._ownerName = null;
         this.var_827 = null;
         this.var_1293 = null;
         this.var_1050 = null;
         this.var_831 = null;
         this.var_1552 = null;
         this.var_272 = null;
         this.var_829 = null;
         this.var_1548 = null;
         this.var_2007 = null;
         this.var_668 = null;
         this.var_2004 = null;
         this.var_1296 = null;
         this.var_1291 = null;
         this.var_1295 = null;
         this._remFavouriteButton = null;
         this.var_1294 = null;
         this.var_1551 = null;
         this.var_1549 = null;
         this.var_1553 = null;
         this.var_830 = null;
         this.var_1290 = null;
         this.var_1049 = null;
         this._buttons = null;
         this.var_828 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_388.reset();
         this.var_387.active = true;
         this.var_145.active = false;
         this.var_273.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_388.reset();
         this.var_145.load(param1);
         this.var_145.active = true;
         this.var_387.active = false;
         this.var_273.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_145.active = true;
         this.var_387.active = false;
         this.var_273.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_388.reset();
         this.var_145.active = false;
         this.var_387.active = false;
         this.var_273.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1550 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_388.reset();
         this.var_387.active = false;
         this.var_145.active = false;
         this.var_273.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_908;
         this._window.y = this.const_731;
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_178,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_178.height = Util.getLowestPoint(this.var_178);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_955;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_386);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_145.refresh(this.var_386);
         this.var_273.refresh(this.var_386);
         Util.moveChildrenToColumn(this.var_386,["room_details","room_buttons"],0,2);
         this.var_386.height = Util.getLowestPoint(this.var_386);
         this.var_386.visible = true;
         Logger.log("XORP: " + this.var_389.visible + ", " + this.var_1292.visible + ", " + this.var_669.visible + ", " + this.var_669.rectangle + ", " + this.var_386.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_272);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_387.refresh(this.var_272);
         if(Util.hasVisibleChildren(this.var_272) && !(this.var_145.active || this.var_273.active))
         {
            Util.moveChildrenToColumn(this.var_272,["event_details","event_buttons"],0,2);
            this.var_272.height = Util.getLowestPoint(this.var_272);
            this.var_272.visible = true;
         }
         else
         {
            this.var_272.visible = false;
         }
         Logger.log("EVENT: " + this.var_272.visible + ", " + this.var_272.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_145.active && !this.var_273.active && !this.var_387.active)
         {
            this.var_830.visible = true;
            this.var_1049.text = this.getEmbedData();
         }
         else
         {
            this.var_830.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_145.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_828)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_828.visible = _loc1_;
            if(this.var_1550)
            {
               this.var_828.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_828.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_145.active || this.var_273.active)
         {
            return;
         }
         this.var_958.text = param1.roomName;
         this.var_958.height = this.var_958.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_827.text = param1.description;
         this.var_1048.refreshTags(this.var_389,param1.tags);
         this.var_827.visible = false;
         if(param1.description != "")
         {
            this.var_827.height = this.var_827.textHeight + 5;
            this.var_827.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1291,"facebook_logo_small",_loc3_,null,0);
         this.var_1291.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1296,"thumb_up",_loc4_,null,0);
         this.var_1296.visible = _loc4_;
         this.var_831.visible = !_loc4_;
         this.var_1552.visible = !_loc4_;
         this.var_1552.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_389,"home",param2,null,0);
         this._navigator.refreshButton(this.var_389,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_389,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_958.y,0);
         this.var_389.visible = true;
         this.var_389.height = Util.getLowestPoint(this.var_389);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_389.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_145.active || this.var_273.active)
         {
            return;
         }
         this.var_1047.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1047.height = this.var_1047.textHeight + 5;
         this.var_1293.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1293.height = this.var_1293.textHeight + 5;
         Util.moveChildrenToColumn(this.var_669,["public_space_name","public_space_desc"],this.var_1047.y,0);
         this.var_669.visible = true;
         this.var_669.height = Math.max(86,Util.getLowestPoint(this.var_669));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_387.active)
         {
            return;
         }
         this.var_2007.text = param1.eventName;
         this.var_668.text = param1.eventDescription;
         this.var_1048.refreshTags(this.var_829,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_668.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_668.height = this.var_668.textHeight + 5;
            this.var_668.y = Util.getLowestPoint(this.var_829) + 2;
            this.var_668.visible = true;
         }
         this.var_829.visible = true;
         this.var_829.height = Util.getLowestPoint(this.var_829);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_145.active || this.var_273.active)
         {
            return;
         }
         this.var_1551.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1295.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1294.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1292.visible = Util.hasVisibleChildren(this.var_1292);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_387.active)
         {
            return;
         }
         this.var_1549.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1553.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1548.visible = Util.hasVisibleChildren(this.var_1548);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_178 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_386 = IWindowContainer(this.find("room_info"));
         this.var_389 = IWindowContainer(this.find("room_details"));
         this.var_669 = IWindowContainer(this.find("public_space_details"));
         this.var_2006 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2005 = IWindowContainer(this.find("rating_cont"));
         this.var_1292 = IWindowContainer(this.find("room_buttons"));
         this.var_958 = ITextWindow(this.find("room_name"));
         this.var_1047 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_827 = ITextWindow(this.find("room_desc"));
         this.var_1293 = ITextWindow(this.find("public_space_desc"));
         this.var_1050 = ITextWindow(this.find("owner_caption"));
         this.var_831 = ITextWindow(this.find("rating_caption"));
         this.var_1552 = ITextWindow(this.find("rating_txt"));
         this.var_272 = IWindowContainer(this.find("event_info"));
         this.var_829 = IWindowContainer(this.find("event_details"));
         this.var_1548 = IWindowContainer(this.find("event_buttons"));
         this.var_2007 = ITextWindow(this.find("event_name"));
         this.var_668 = ITextWindow(this.find("event_desc"));
         this.var_1291 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1296 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2004 = this.find("staff_pick_button");
         this.var_1295 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1294 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1551 = IButtonWindow(this.find("room_settings_button"));
         this.var_1549 = IButtonWindow(this.find("create_event_button"));
         this.var_1553 = IButtonWindow(this.find("edit_event_button"));
         this.var_830 = IWindowContainer(this.find("embed_info"));
         this.var_1290 = ITextWindow(this.find("embed_info_txt"));
         this.var_1049 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_828 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1295,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1551,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1294,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1549,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1553,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1049,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1296,this.onThumbUp);
         this.addMouseClickListener(this.var_2004,this.onStaffPick);
         this.addMouseClickListener(this.var_1291,this.onFacebookLike);
         this.addMouseClickListener(this.var_828,this.onZoomClick);
         this._navigator.refreshButton(this.var_1295,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1294,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_386,this.onHover);
         this.addMouseOverListener(this.var_272,this.onHover);
         this.var_1050.width = this.var_1050.textWidth;
         Util.moveChildrenToRow(this.var_2006,["owner_caption","owner_name"],this.var_1050.x,this.var_1050.y,3);
         this.var_831.width = this.var_831.textWidth;
         Util.moveChildrenToRow(this.var_2005,["rating_caption","rating_txt"],this.var_831.x,this.var_831.y,3);
         this.var_1290.height = this.var_1290.textHeight + 5;
         Util.moveChildrenToColumn(this.var_830,["embed_info_txt","embed_src_txt"],this.var_1290.y,2);
         this.var_830.height = Util.getLowestPoint(this.var_830) + 5;
         this.var_2995 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_1049.setSelection(0,this.var_1049.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.ZOOM_TOGGLE));
         this.var_1550 = !this.var_1550;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_388.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_145 != null)
         {
            this.var_145.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
