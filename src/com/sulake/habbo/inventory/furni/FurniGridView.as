package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class FurniGridView
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _view:IWindowContainer;
      
      private var var_71:FurniModel;
      
      private var _roomEngine:IRoomEngine;
      
      private var _category:String;
      
      private var var_201:IItemGridWindow;
      
      private var var_508:IWindow;
      
      public function FurniGridView(param1:FurniModel, param2:String, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IRoomEngine)
      {
         super();
         this.var_71 = param1;
         this._category = param2;
         this._assetLibrary = param4;
         this._windowManager = param3;
         this._roomEngine = param5;
         var _loc6_:XmlAsset = this._assetLibrary.getAssetByName("inventory_furni_grid_xml") as XmlAsset;
         this._view = this._windowManager.buildFromXML(_loc6_.content as XML) as IWindowContainer;
         if(this._view != null)
         {
            this.var_201 = this._view.findChildByName("item_grid") as IItemGridWindow;
         }
      }
      
      public function dispose() : void
      {
         this.var_71 = null;
         this._windowManager = null;
         this._assetLibrary = null;
         this._roomEngine = null;
         this.var_201 = null;
         this.var_508 = null;
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
      }
      
      public function get window() : IWindowContainer
      {
         if(this._view == null)
         {
            return null;
         }
         if(this._view.disposed)
         {
            return null;
         }
         return this._view;
      }
      
      public function clearGrid() : void
      {
         if(this.var_201 != null)
         {
            this.var_201.removeGridItems();
         }
      }
      
      public function updateItem(param1:int, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = this.var_201.getGridItemAt(param1);
         if(_loc3_)
         {
            _loc3_ = param2;
         }
      }
      
      public function addItemToBottom(param1:IWindowContainer) : void
      {
         this.var_201.addGridItem(param1);
         param1.procedure = this.itemEventProc;
      }
      
      public function addItemAt(param1:IWindowContainer, param2:int) : void
      {
         this.var_201.addGridItemAt(param1,param2);
         param1.procedure = this.itemEventProc;
      }
      
      public function removeItem(param1:int) : IWindow
      {
         return this.var_201.removeGridItemAt(param1);
      }
      
      public function moveItemTo(param1:IWindowContainer, param2:int) : void
      {
         this.var_201.removeGridItem(param1);
         this.var_201.addGridItemAt(param1,param2);
      }
      
      public function setLock(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_201.autoArrangeItems = false;
            this.var_201.lock();
         }
         else
         {
            this.var_201.autoArrangeItems = true;
            this.var_201.unlock();
         }
      }
      
      private function itemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.const_54)
         {
            this.var_508 = null;
            this.var_71.cancelFurniInMover();
         }
         else if(param1.type == WindowMouseEvent.const_44)
         {
            if(param2 == null)
            {
               return;
            }
            this.var_71.toggleItemSelection(this._category,this.var_201.getGridItemIndex(param1.window));
            this.var_508 = param2;
         }
         else if(param1.type == WindowMouseEvent.const_25 && this.var_508 != null && this.var_508 == param2 && !this.var_71.isTradingOpen)
         {
            _loc3_ = this.var_71.requestSelectedFurniPlacement(true);
            if(_loc3_)
            {
               this.var_508 = null;
            }
         }
         else if(param1.type == WindowMouseEvent.const_54)
         {
            this.var_508 = null;
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_508 = null;
         }
         else if(param1.type == WindowMouseEvent.const_159)
         {
            this.var_71.requestCurrentActionOnSelection();
            this.var_508 = null;
         }
      }
   }
}
