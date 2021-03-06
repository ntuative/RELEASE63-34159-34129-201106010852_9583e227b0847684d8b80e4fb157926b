package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.catalog.ChargeInfo;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.UseFurnitureMessageComposer;
   
   public class ChargeConfirmationDialog implements IDisposable
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_742:ChargeInfo;
      
      private var _window:IFrameWindow;
      
      private var _disposed:Boolean = false;
      
      public function ChargeConfirmationDialog(param1:HabboCatalog, param2:ICoreLocalizationManager)
      {
         super();
         this._catalog = param1;
         this._localization = param2;
      }
      
      public function close() : void
      {
         if(this._window != null)
         {
            this._window.visible = false;
         }
      }
      
      public function refresh() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.showChargeInfo(this.var_742);
         }
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this._catalog = null;
         this._localization = null;
         this.var_742 = null;
         if(this._window != null)
         {
            this._window.dispose();
         }
         this._window = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function showChargeInfo(param1:ChargeInfo) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_742 = param1;
         if(this._window == null)
         {
            this._window = this.createWindow("charge_confirmation") as IFrameWindow;
            _loc4_ = this._window.findChildByName("charge_button");
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCharge);
            _loc5_ = this._window.findChildByTag("close");
            _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onWindowClose);
            this._window.center();
         }
         this._catalog.windowManager.registerLocalizationParameter("catalog.charge.currentamount","charges","" + this.var_742.charges);
         var _loc2_:ChargeOffer = new ChargeOffer(this.var_742);
         var _loc3_:BalanceAndCost = new BalanceAndCost(this._catalog,this._localization,_loc2_);
         this._catalog.windowManager.registerLocalizationParameter("catalog.charge.info","cost",_loc3_.cost);
         this._catalog.windowManager.registerLocalizationParameter("catalog.charge.info","balance",_loc3_.balance);
         this._catalog.windowManager.registerLocalizationParameter("catalog.charge.info","patch_size","" + this.var_742.chargePatchSize);
         this._window.visible = true;
         this._window.activate();
         _loc3_.dispose();
         _loc2_.dispose();
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = this._catalog.assets.getAssetByName(param1) as XmlAsset;
         return this._catalog.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function onCharge(param1:WindowEvent) : void
      {
         this._catalog.connection.send(new UseFurnitureMessageComposer(this.var_742.stuffId,2));
      }
      
      private function onWindowClose(param1:WindowEvent) : void
      {
         Logger.log("Close window");
         if(this._window != null)
         {
            this._window.visible = false;
         }
      }
   }
}
