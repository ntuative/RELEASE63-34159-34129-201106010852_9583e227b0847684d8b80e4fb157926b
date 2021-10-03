package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_693:String = "";
      
      public static const const_402:int = 0;
      
      public static const const_517:int = 255;
      
      public static const const_835:Boolean = false;
      
      public static const const_544:int = 0;
      
      public static const const_589:int = 0;
      
      public static const const_382:int = 0;
      
      public static const const_1205:int = 1;
      
      public static const const_1145:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2457:String = "";
      
      private var var_1923:int = 0;
      
      private var var_2731:int = 255;
      
      private var var_2740:Boolean = false;
      
      private var var_2741:int = 0;
      
      private var var_2739:int = 0;
      
      private var var_2738:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2457 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2457;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1923 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1923;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2731 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2731;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2740 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2740;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2741 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2741;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2739 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2739;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2738 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2738;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
