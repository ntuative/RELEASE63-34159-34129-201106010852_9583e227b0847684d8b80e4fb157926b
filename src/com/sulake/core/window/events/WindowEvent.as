package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1770:String = "WE_DESTROY";
      
      public static const const_345:String = "WE_DESTROYED";
      
      public static const const_1684:String = "WE_OPEN";
      
      public static const const_1962:String = "WE_OPENED";
      
      public static const const_1855:String = "WE_CLOSE";
      
      public static const const_1715:String = "WE_CLOSED";
      
      public static const const_1689:String = "WE_FOCUS";
      
      public static const const_347:String = "WE_FOCUSED";
      
      public static const const_1765:String = "WE_UNFOCUS";
      
      public static const const_1796:String = "WE_UNFOCUSED";
      
      public static const const_1934:String = "WE_ACTIVATE";
      
      public static const const_580:String = "WE_ACTIVATED";
      
      public static const const_1831:String = "WE_DEACTIVATE";
      
      public static const const_630:String = "WE_DEACTIVATED";
      
      public static const const_335:String = "WE_SELECT";
      
      public static const const_49:String = "WE_SELECTED";
      
      public static const const_629:String = "WE_UNSELECT";
      
      public static const const_524:String = "WE_UNSELECTED";
      
      public static const const_1959:String = "WE_LOCK";
      
      public static const const_1925:String = "WE_LOCKED";
      
      public static const const_1846:String = "WE_UNLOCK";
      
      public static const const_1813:String = "WE_UNLOCKED";
      
      public static const const_821:String = "WE_ENABLE";
      
      public static const const_255:String = "WE_ENABLED";
      
      public static const const_997:String = "WE_DISABLE";
      
      public static const const_240:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_430:String = "WE_RELOCATED";
      
      public static const const_1265:String = "WE_RESIZE";
      
      public static const const_41:String = "WE_RESIZED";
      
      public static const const_1751:String = "WE_MINIMIZE";
      
      public static const const_1840:String = "WE_MINIMIZED";
      
      public static const const_1731:String = "WE_MAXIMIZE";
      
      public static const const_1931:String = "WE_MAXIMIZED";
      
      public static const const_1732:String = "WE_RESTORE";
      
      public static const const_1921:String = "WE_RESTORED";
      
      public static const const_356:String = "WE_CHILD_ADDED";
      
      public static const const_443:String = "WE_CHILD_REMOVED";
      
      public static const const_197:String = "WE_CHILD_RELOCATED";
      
      public static const const_119:String = "WE_CHILD_RESIZED";
      
      public static const const_320:String = "WE_CHILD_ACTIVATED";
      
      public static const const_549:String = "WE_PARENT_ADDED";
      
      public static const const_1669:String = "WE_PARENT_REMOVED";
      
      public static const const_1709:String = "WE_PARENT_RELOCATED";
      
      public static const const_899:String = "WE_PARENT_RESIZED";
      
      public static const const_1177:String = "WE_PARENT_ACTIVATED";
      
      public static const const_173:String = "WE_OK";
      
      public static const const_622:String = "WE_CANCEL";
      
      public static const const_113:String = "WE_CHANGE";
      
      public static const const_599:String = "WE_SCROLL";
      
      public static const const_105:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_716:IWindow;
      
      protected var var_1106:Boolean;
      
      protected var var_490:Boolean;
      
      protected var var_487:Boolean;
      
      protected var var_715:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_716 = param3;
         _loc5_.var_490 = param4;
         _loc5_.var_487 = false;
         _loc5_.var_715 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_716;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_490;
      }
      
      public function recycle() : void
      {
         if(this.var_487)
         {
            throw new Error("Event already recycled!");
         }
         this.var_716 = null;
         this._window = null;
         this.var_487 = true;
         this.var_1106 = false;
         this.var_715.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1106;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1106 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1106;
      }
      
      public function stopPropagation() : void
      {
         this.var_1106 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1106 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_490 + " window: " + this._window + " }";
      }
   }
}
