package com.sulake.habbo.room.object.visualization.room.publicroom.rasterizer
{
   public class LayoutRasterizerData
   {
       
      
      private var var_2100:XMLList;
      
      public function LayoutRasterizerData(param1:XML)
      {
         super();
         this.var_2100 = param1.elements.element;
      }
      
      public function get elementList() : XMLList
      {
         return this.var_2100;
      }
      
      public function dispose() : void
      {
         this.var_2100 = null;
      }
   }
}
