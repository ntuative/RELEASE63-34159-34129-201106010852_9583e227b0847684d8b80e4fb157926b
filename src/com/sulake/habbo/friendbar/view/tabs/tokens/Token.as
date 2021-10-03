package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import com.sulake.habbo.friendbar.view.utils.DropAnimation;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class Token implements IDisposable
   {
      
      protected static const const_1971:Rectangle = new Rectangle(0,0,25,25);
       
      
      protected var _icon:IBitmapWrapperWindow;
      
      protected var _window:IWindowContainer;
      
      protected var _disposed:Boolean;
      
      protected var var_1364:FriendNotification;
      
      protected var _windowManager:IHabboWindowManager;
      
      protected var _assetLibrary:IAssetLibrary;
      
      protected var var_1101:DropAnimation;
      
      public function Token(param1:FriendNotification, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         this.var_1364 = param1;
         this._windowManager = param2;
         this._assetLibrary = param3;
      }
      
      public function get typeCode() : int
      {
         return this.var_1364.typeCode;
      }
      
      public function get viewOnce() : Boolean
      {
         return this.var_1364.viewOnce;
      }
      
      public function get notification() : FriendNotification
      {
         return this.var_1364;
      }
      
      public function get iconElement() : IWindow
      {
         return this._icon;
      }
      
      public function get windowElement() : IWindow
      {
         return this._window;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this._icon)
         {
            this._icon.dispose();
            this._icon = null;
         }
         if(this.var_1101)
         {
            this.var_1101.dispose();
            this.var_1101 = null;
         }
         this._windowManager = null;
         this._assetLibrary = null;
         this.var_1364 = null;
         this._disposed = true;
      }
      
      protected function prepare(param1:String, param2:String, param3:String, param4:String, param5:String, param6:Boolean) : void
      {
         var _loc7_:* = null;
         this._window = this._windowManager.buildFromXML(this._assetLibrary.getAssetByName(param3).content as XML) as IWindowContainer;
         this._window.findChildByName("title").caption = param1;
         this._window.findChildByName("message").caption = !!param2 ? param2 : "";
         _loc7_ = this._assetLibrary.getAssetByName(param5) as BitmapDataAsset;
         if(_loc7_)
         {
            IBitmapWrapperWindow(this._window.findChildByName("icon")).bitmap = _loc7_.content as BitmapData;
         }
         this._icon = this._windowManager.create("ICON_" + this.typeCode,WindowType.const_499,WindowStyle.const_155,WindowParam.const_182,Token.const_1971) as IBitmapWrapperWindow;
         this._icon.disposesBitmap = false;
         _loc7_ = this._assetLibrary.getAssetByName(param4) as BitmapDataAsset;
         if(_loc7_)
         {
            this._icon.bitmap = _loc7_.content as BitmapData;
         }
         if(this.var_1101)
         {
            this.var_1101.dispose();
         }
         if(param6)
         {
            this.var_1101 = new DropAnimation(this._icon,600,32);
         }
      }
   }
}
