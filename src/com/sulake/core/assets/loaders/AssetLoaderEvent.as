package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_29:String = "AssetLoaderEventComplete";
      
      public static const const_1230:String = "AssetLoaderEventProgress";
      
      public static const const_1233:String = "AssetLoaderEventUnload";
      
      public static const const_1220:String = "AssetLoaderEventStatus";
      
      public static const const_40:String = "AssetLoaderEventError";
      
      public static const const_1193:String = "AssetLoaderEventOpen";
       
      
      private var var_411:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_411 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_411;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_411);
      }
      
      override public function toString() : String
      {
         return formatToString("AssetLoaderEvent","type","status");
      }
   }
}
