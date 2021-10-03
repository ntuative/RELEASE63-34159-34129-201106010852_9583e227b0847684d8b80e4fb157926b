package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowMessage extends WindowEvent
   {
      
      private static const const_1536:String = "WE_MESSAGE";
      
      private static const POOL:Array = [];
       
      
      public var message:String;
      
      public function WindowMessage()
      {
         super();
         _type = const_1536;
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowMessage = POOL.length > 0 ? POOL.pop() : new WindowMessage();
         _loc5_.message = param1;
         _loc5_._window = param2;
         _loc5_.var_716 = param3;
         _loc5_.var_490 = param4;
         _loc5_.var_487 = false;
         _loc5_.var_715 = POOL;
         return _loc5_;
      }
      
      override public function clone() : WindowEvent
      {
         return allocate(this.message,window,related,cancelable);
      }
      
      override public function toString() : String
      {
         return "WindowLinkEvent { type: " + _type + " message: " + this.message + " cancelable: " + var_490 + " window: " + _window + " }";
      }
   }
}
