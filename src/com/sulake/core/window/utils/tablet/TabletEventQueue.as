package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.utils.GenericEventQueue;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class TabletEventQueue extends GenericEventQueue
   {
       
      
      protected var var_2971:Point;
      
      public function TabletEventQueue(param1:IEventDispatcher)
      {
         super(param1);
         this.var_2971 = new Point();
      }
      
      public function get touchPosition() : Point
      {
         return this.var_2971;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
         }
      }
   }
}
