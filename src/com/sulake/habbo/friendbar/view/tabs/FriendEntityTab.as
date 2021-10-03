package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.view.tabs.tokens.AchievementToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.MessengerToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.RoomEventToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
   import flash.display.BitmapData;
   import flash.utils.getQualifiedClassName;
   
   public class FriendEntityTab extends Tab
   {
      
      private static const const_1434:String = "entity_xml";
      
      private static const const_1437:String = "facebook_piece_xml";
      
      private static const const_1436:String = "controls_piece_xml";
      
      private static const const_647:String = "pieces";
      
      private static const const_1435:String = "icons";
      
      private static const const_1041:String = "icon_region";
      
      private static const const_646:String = "header";
      
      private static const const_1044:String = "facebook";
      
      private static const const_1042:String = "controls";
      
      private static const const_645:String = "canvas";
      
      private static const const_648:String = "name";
      
      private static const const_1043:String = "btn_message";
      
      private static const const_1045:String = "btn_visit";
      
      private static const const_1047:String = "icon";
      
      private static const const_467:String = "notification";
      
      private static const const_69:uint = 10338138;
      
      private static const const_1027:uint = 13891476;
      
      private static const POOL:Array = [];
      
      private static const const_448:Array = [];
       
      
      private var var_230:IFriendEntity;
      
      private var var_116:Vector.<Token>;
      
      public function FriendEntityTab()
      {
         super();
      }
      
      public static function allocate(param1:IFriendEntity) : FriendEntityTab
      {
         var _loc3_:* = null;
         var _loc2_:FriendEntityTab = false ? POOL.pop() : new FriendEntityTab();
         _loc2_.var_487 = false;
         _loc2_.friend = param1;
         if(param1.notifications.length > 0)
         {
            for each(_loc3_ in param1.notifications)
            {
               _loc2_.addNotificationToken(_loc3_,false);
            }
         }
         return _loc2_;
      }
      
      private static function purgeEntityPieces(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:IItemListWindow = IItemListWindow(param1.getChildByName(const_647));
         _loc3_ = _loc2_.getListItemByName(const_1044) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         _loc3_ = _loc2_.getListItemByName(const_1042) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         var _loc4_:* = [];
         _loc2_.groupListItemsWithTag(const_467,_loc4_);
         if(_loc4_.length > 0)
         {
            for each(_loc5_ in _loc4_)
            {
               _loc5_.parent = null;
            }
         }
         param1.height = name_1;
         param1.y = 0;
      }
      
      public function set friend(param1:IFriendEntity) : void
      {
         this.var_230 = param1;
         this.refresh();
      }
      
      public function get friend() : IFriendEntity
      {
         return this.var_230;
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_487)
            {
               if(_window)
               {
                  this.releaseEntityWindow(_window);
                  _window = null;
               }
               if(this.var_116)
               {
                  while(this.var_116.length > 0)
                  {
                     this.var_116.pop().dispose();
                  }
                  this.var_116 = null;
               }
               this.var_230 = null;
               var_487 = true;
               POOL.push(this);
            }
         }
      }
      
      override public function select() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!selected)
         {
            _loc1_ = IItemListWindow(window.getChildByName(const_647));
            if(this.friend.realName != null && this.friend.realName != "")
            {
               _loc2_ = var_705.buildFromXML(var_480.getAssetByName(const_1437).content as XML) as IWindowContainer;
               _loc2_.name = const_1044;
               _loc4_ = _loc2_.getChildByName(const_648) as ITextWindow;
               _loc4_.caption = this.friend.realName;
               if(!_loc4_.wordWrap)
               {
                  var_2157.crop(_loc4_);
               }
               _loc3_ = IBitmapWrapperWindow(_loc2_.getChildByName(const_1047));
               _loc3_.bitmap = var_480.getAssetByName(_loc3_.bitmapAssetName).content as BitmapData;
               _loc3_.width = _loc3_.bitmap.width;
               _loc3_.height = _loc3_.bitmap.height;
               _loc1_.addListItem(_loc2_);
            }
            if(this.var_116)
            {
               for each(_loc5_ in this.var_116)
               {
                  _loc1_.addListItem(_loc5_.windowElement);
               }
            }
            if(this.friend.online)
            {
               _loc2_ = var_705.buildFromXML(var_480.getAssetByName(const_1436).content as XML) as IWindowContainer;
               _loc2_.name = const_1042;
               _loc6_ = _loc2_.getChildByName(const_1043);
               if(_loc6_)
               {
                  _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
               }
               _loc6_ = _loc2_.getChildByName(const_1045);
               if(_loc6_)
               {
                  if(this.friend.allowFollow)
                  {
                     _loc6_.visible = true;
                     _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
                  }
                  else
                  {
                     _loc6_.visible = false;
                  }
               }
               _loc1_.addListItem(_loc2_);
            }
            window.height = _loc1_.height;
            window.y = name_1 - 0;
            super.select();
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(selected)
         {
            if(_window)
            {
               purgeEntityPieces(_window);
               if(this.var_116)
               {
                  _loc2_ = this.var_116.length - 1;
                  while(_loc2_ > -1)
                  {
                     _loc3_ = this.var_116[_loc2_];
                     if(_loc3_.viewOnce)
                     {
                        this.removeNotificationToken(_loc3_.typeCode,param1);
                     }
                     _loc2_--;
                  }
               }
            }
            super.deselect(param1);
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         _window.color = !!exposed ? uint(const_1027) : uint(const_69);
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = !!exposed ? uint(const_1027) : uint(const_69);
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      protected function refresh() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _window = this.allocateEntityWindow();
         }
         if(this.var_230)
         {
            _window.id = this.var_230.id;
            _loc1_ = IItemListWindow(_window.getChildByName(const_647)).getListItemByName(const_646) as IWindowContainer;
            _loc1_.findChildByName(const_648).caption = this.var_230.name;
            var_2157.crop(_loc1_.getChildByName(const_648) as ITextWindow);
            _loc2_ = IBitmapWrapperWindow(_loc1_.findChildByName(const_645));
            _loc2_.bitmap = var_1634.getAvatarFaceBitmap(this.var_230.figure);
            _loc2_.width = _loc2_.bitmap.width;
            _loc2_.height = _loc2_.bitmap.height;
         }
      }
      
      private function allocateEntityWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = false ? const_448.pop() : var_705.buildFromXML(var_480.getAssetByName(const_1434).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_645));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_646));
         var _loc4_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_1041));
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = name_5;
         _loc1_.height = name_1;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc3_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc4_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc2_.disposesBitmap = true;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName(const_646));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            _loc2_.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc3_ = IRegionWindow(param1.findChildByName(const_1041));
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.const_25,onMouseClick);
            param1.width = name_5;
            param1.height = name_1;
            _loc4_ = IBitmapWrapperWindow(param1.findChildByName(const_645));
            _loc4_.bitmap = null;
            purgeEntityPieces(param1);
            if(const_448.indexOf(param1) == -1)
            {
               const_448.push(param1);
            }
         }
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            switch(param1.window.name)
            {
               case const_1043:
                  this.removeNotificationToken(FriendNotification.const_594,true);
                  if(var_1095 && this.var_230)
                  {
                     var_1095.startConversation(this.var_230.id);
                     this.deselect(true);
                  }
                  break;
               case const_1045:
                  if(var_1095 && this.var_230)
                  {
                     var_1095.followToRoom(this.var_230.id);
                     this.deselect(true);
                  }
            }
         }
      }
      
      public function addNotificationToken(param1:FriendNotification, param2:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.removeNotificationToken(param1.typeCode,false);
         if(!this.var_116)
         {
            this.var_116 = new Vector.<Token>();
         }
         var _loc3_:Boolean = selected;
         if(_loc3_)
         {
            _loc5_ = this.var_116;
            this.var_116 = null;
            this.deselect(false);
            this.var_116 = _loc5_;
         }
         switch(param1.typeCode)
         {
            case FriendNotification.const_1849:
               _loc4_ = new RoomEventToken(this.friend,param1,var_705,var_480,param2);
               break;
            case FriendNotification.const_1939:
               _loc4_ = new AchievementToken(this.friend,param1,var_705,var_480,param2);
               break;
            case FriendNotification.const_1892:
               break;
            case FriendNotification.const_594:
               _loc4_ = new MessengerToken(this.friend,param1,var_705,var_480,param2);
               break;
            default:
               throw new Error("Unknown friend notification type: " + param1.typeCode + "!");
         }
         if(_loc4_)
         {
            this.var_116.push(_loc4_);
            IItemListWindow(_window.findChildByName(const_1435)).addListItemAt(_loc4_.iconElement,0);
         }
         if(_loc3_)
         {
            this.select();
         }
      }
      
      public function removeNotificationToken(param1:int, param2:Boolean) : void
      {
         var _loc4_:* = null;
         if(!this.var_116)
         {
            return;
         }
         var _loc3_:int = this.var_116.length - 1;
         while(_loc3_ > -1)
         {
            _loc4_ = this.var_116[_loc3_];
            if(_loc4_.typeCode == param1)
            {
               this.var_116.splice(_loc3_,1);
               if(param2)
               {
                  this.var_230.notifications.splice(this.var_230.notifications.indexOf(_loc4_.notification),1);
               }
               _loc4_.dispose();
               return;
            }
            _loc3_--;
         }
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " " + this.var_230.name;
      }
   }
}
