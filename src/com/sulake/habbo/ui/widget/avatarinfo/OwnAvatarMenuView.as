package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetWaveMessage;
   
   public class OwnAvatarMenuView extends AvatarInfoView
   {
      
      private static const const_459:int = 0;
      
      private static const const_1086:int = 1;
      
      private static const const_1085:int = 2;
       
      
      private var _data:AvatarInfoData;
      
      private var var_338:int;
      
      private var _buttons:IItemListWindow;
      
      public function OwnAvatarMenuView(param1:AvatarInfoWidget)
      {
         super(param1);
         var_1102 = false;
      }
      
      public static function setup(param1:OwnAvatarMenuView, param2:int, param3:String, param4:int, param5:int, param6:AvatarInfoData) : void
      {
         param1._data = param6;
         param1.var_338 = const_459;
         AvatarInfoView.setup(param1,param2,param3,param4,param5,false);
      }
      
      override public function dispose() : void
      {
         this._buttons = null;
         this._data = null;
         super.dispose();
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:* = null;
         if(!_widget || true || true)
         {
            return;
         }
         if(!_window)
         {
            _loc1_ = XmlAsset(_widget.assets.getAssetByName("own_avatar_menu")).content as XML;
            _window = _widget.windowManager.buildFromXML(_loc1_,0) as IWindowContainer;
            if(!_window)
            {
               return;
            }
         }
         this._buttons = _window.findChildByName("buttons") as IItemListWindow;
         this._buttons.procedure = this.buttonEventProc;
         _window.findChildByName("name").caption = _userName;
         _window.visible = false;
         this.updateButtons();
      }
      
      protected function updateButtons() : void
      {
         if(!_window || !this._data || !this._buttons)
         {
            return;
         }
         this._buttons.autoArrangeItems = false;
         var _loc1_:int = this._buttons.numListItems;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._buttons.getListItemAt(_loc2_).visible = false;
            _loc2_++;
         }
         if(this._data.allowNameChange && false)
         {
            this.var_338 = const_1085;
         }
         switch(this.var_338)
         {
            case const_459:
               this.showButton("change_name",this._data.allowNameChange);
               this.showButton("change_looks");
               this.showButton("dance_menu",_widget.hasClub,true);
               this.showButton("dance",true,true);
               this.showButton("dance_stop",false);
               this.showButton("wave",true,true);
               this.showButton("effects",true,true || false);
               break;
            case const_1086:
               this.showButton("dance_stop",true,_widget.isDancing);
               this.showButton("dance_1");
               this.showButton("dance_2");
               this.showButton("dance_3");
               this.showButton("dance_4");
               this.showButton("back");
               break;
            case const_1085:
               this.showButton("change_name");
               this.showButton("more");
         }
         this._buttons.autoArrangeItems = true;
         this._buttons.visible = true;
      }
      
      private function showButton(param1:String, param2:Boolean = true, param3:Boolean = true) : void
      {
         if(!this._buttons)
         {
            return;
         }
         var _loc4_:IWindowContainer = this._buttons.getListItemByName(param1) as IWindowContainer;
         if(!_loc4_)
         {
            return;
         }
         _loc4_.visible = param2;
         var _loc5_:IWindowContainer = _loc4_.getChildByName("button") as IWindowContainer;
         if(param3)
         {
            _loc5_.enable();
         }
         else
         {
            _loc5_.disable();
         }
         var _loc6_:ITextWindow = _loc5_.getChildByName("label") as ITextWindow;
         _loc6_.textColor = !!param3 ? uint(const_1366) : uint(const_1368);
         var _loc7_:IIconWindow = _loc5_.getChildByName("icon") as IIconWindow;
         if(_loc7_)
         {
            _loc7_.color = !!param3 ? uint(const_1366) : uint(const_1368);
         }
      }
      
      private function buttonEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "button")
            {
               _loc3_ = true;
               switch(param2.parent.name)
               {
                  case "change_name":
                     _loc4_ = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_612);
                     break;
                  case "change_looks":
                     _widget.openAvatarInfo();
                     break;
                  case "wave":
                     _loc4_ = new RoomWidgetWaveMessage();
                     break;
                  case "dance_menu":
                     _loc3_ = false;
                     this.changeMode(const_1086);
                     break;
                  case "dance":
                     _loc4_ = new RoomWidgetDanceMessage(1);
                     _widget.isDancing = true;
                     break;
                  case "dance_stop":
                     _loc4_ = new RoomWidgetDanceMessage(0);
                     _widget.isDancing = false;
                     break;
                  case "dance_1":
                  case "dance_2":
                  case "dance_3":
                  case "dance_4":
                     _loc4_ = new RoomWidgetDanceMessage(parseInt(param2.parent.name.charAt(param2.parent.name.length - 1)));
                     _widget.isDancing = true;
                     break;
                  case "effects":
                     _loc4_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_707);
                     break;
                  case "back":
                     _loc3_ = false;
                     this.changeMode(const_459);
                     break;
                  case "more":
                     _loc3_ = false;
                     _widget.useMinimizedOwnAvatarMenu = false;
                     this.changeMode(const_459);
               }
            }
            if(_loc4_)
            {
               _widget.messageListener.processWidgetMessage(_loc4_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(param2.name == "button")
            {
               param2.color = const_1365;
            }
            else if(param2.tags.indexOf("link") > -1)
            {
               if(param2.tags.indexOf("actions") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1367;
               }
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(param2.name == "button")
            {
               param2.color = const_1369;
            }
            else if(param2.tags.indexOf("link") > -1)
            {
               if(param2.tags.indexOf("actions") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1370;
               }
            }
         }
         if(_loc3_)
         {
            _widget.removeView(this,false);
         }
      }
      
      private function changeMode(param1:int) : void
      {
         this.var_338 = param1;
         this.updateButtons();
      }
   }
}
