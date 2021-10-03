package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_507:uint = 0;
      
      public static const const_1723:uint = 1;
      
      public static const const_2182:int = 0;
      
      public static const const_2102:int = 1;
      
      public static const const_2216:int = 2;
      
      public static const const_2089:int = 3;
      
      public static const const_1963:int = 4;
      
      public static const const_401:int = 5;
      
      public static var var_406:IEventQueue;
      
      private static var var_652:IEventProcessor;
      
      private static var var_1911:uint = const_507;
      
      private static var stage:Stage;
      
      private static var var_172:IWindowRenderer;
       
      
      private var var_2626:EventProcessorState;
      
      private var var_2627:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_133:DisplayObjectContainer;
      
      protected var var_3007:Boolean = true;
      
      protected var var_1373:Error;
      
      protected var var_2191:int = -1;
      
      protected var var_1372:IInternalWindowServices;
      
      protected var var_1646:IWindowParser;
      
      protected var var_2965:IWindowFactory;
      
      protected var var_87:IDesktopWindow;
      
      protected var var_1647:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_581:Boolean = false;
      
      private var var_2628:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_172 = param2;
         this._localization = param4;
         this.var_133 = param5;
         this.var_1372 = new ServiceManager(this,param5);
         this.var_2965 = param3;
         this.var_1646 = new WindowParser(this);
         this.var_2627 = param7;
         if(!stage)
         {
            if(this.var_133 is Stage)
            {
               stage = this.var_133 as Stage;
            }
            else if(this.var_133.stage)
            {
               stage = this.var_133.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_87 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_87.limits.maxWidth = param6.width;
         this.var_87.limits.maxHeight = param6.height;
         this.var_133.addChild(this.var_87.getDisplayObject());
         this.var_133.doubleClickEnabled = true;
         this.var_133.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2626 = new EventProcessorState(var_172,this.var_87,this.var_87,null,this.var_2627);
         inputMode = const_507;
         this.var_1647 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1911;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_406)
         {
            if(var_406 is IDisposable)
            {
               IDisposable(var_406).dispose();
            }
         }
         if(var_652)
         {
            if(var_652 is IDisposable)
            {
               IDisposable(var_652).dispose();
            }
         }
         switch(value)
         {
            case const_507:
               var_406 = new MouseEventQueue(stage);
               var_652 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1723:
               var_406 = new TabletEventQueue(stage);
               var_652 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_507;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_133.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_133.removeChild(IGraphicContextHost(this.var_87).getGraphicContext(true) as DisplayObject);
            this.var_87.destroy();
            this.var_87 = null;
            this.var_1647.destroy();
            this.var_1647 = null;
            if(this.var_1372 is IDisposable)
            {
               IDisposable(this.var_1372).dispose();
            }
            this.var_1372 = null;
            this.var_1646.dispose();
            this.var_1646 = null;
            var_172 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1373;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2191;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1373 = param2;
         this.var_2191 = param1;
         if(this.var_3007)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1373 = null;
         this.var_2191 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1372;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1646;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2965;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_87;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_87.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1963,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1647;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_87,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_87)
         {
            this.var_87 = null;
         }
         if(param1.state != WindowState.const_547)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_172.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_581 = true;
         if(this.var_1373)
         {
            throw this.var_1373;
         }
         var_652.process(this.var_2626,var_406);
         this.var_581 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2628 = true;
         var_172.update(param1);
         this.var_2628 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_87 != null && !this.var_87.disposed)
         {
            if(this.var_133 is Stage)
            {
               this.var_87.limits.maxWidth = Stage(this.var_133).stageWidth;
               this.var_87.limits.maxHeight = Stage(this.var_133).stageHeight;
               this.var_87.width = Stage(this.var_133).stageWidth;
               this.var_87.height = Stage(this.var_133).stageHeight;
            }
            else
            {
               this.var_87.limits.maxWidth = this.var_133.width;
               this.var_87.limits.maxHeight = this.var_133.height;
               this.var_87.width = this.var_133.width;
               this.var_87.height = this.var_133.height;
            }
         }
      }
   }
}
