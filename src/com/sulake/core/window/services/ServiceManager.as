package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2986:uint;
      
      private var var_154:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_284:IWindowContext;
      
      private var var_1236:IMouseDraggingService;
      
      private var var_1232:IMouseScalingService;
      
      private var var_1234:IMouseListenerService;
      
      private var var_1237:IFocusManagerService;
      
      private var var_1235:IToolTipAgentService;
      
      private var var_1233:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2986 = 0;
         this.var_154 = param2;
         this.var_284 = param1;
         this.var_1236 = new WindowMouseDragger(param2);
         this.var_1232 = new WindowMouseScaler(param2);
         this.var_1234 = new WindowMouseListener(param2);
         this.var_1237 = new FocusManager(param2);
         this.var_1235 = new WindowToolTipAgent(param2);
         this.var_1233 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1236 != null)
         {
            this.var_1236.dispose();
            this.var_1236 = null;
         }
         if(this.var_1232 != null)
         {
            this.var_1232.dispose();
            this.var_1232 = null;
         }
         if(this.var_1234 != null)
         {
            this.var_1234.dispose();
            this.var_1234 = null;
         }
         if(this.var_1237 != null)
         {
            this.var_1237.dispose();
            this.var_1237 = null;
         }
         if(this.var_1235 != null)
         {
            this.var_1235.dispose();
            this.var_1235 = null;
         }
         if(this.var_1233 != null)
         {
            this.var_1233.dispose();
            this.var_1233 = null;
         }
         this.var_154 = null;
         this.var_284 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1236;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1232;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1234;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1237;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1235;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1233;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
