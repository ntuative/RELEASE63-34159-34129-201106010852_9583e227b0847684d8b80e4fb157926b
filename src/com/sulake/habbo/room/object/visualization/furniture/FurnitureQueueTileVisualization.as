package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1465:int = 3;
      
      private static const const_1394:int = 2;
      
      private static const const_1392:int = 1;
      
      private static const const_1393:int = 15;
       
      
      private var var_303:Array;
      
      private var var_1140:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_303 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1394)
         {
            this.var_303 = new Array();
            this.var_303.push(const_1392);
            this.var_1140 = const_1393;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1140 > 0)
         {
            --this.var_1140;
         }
         if(this.var_1140 == 0)
         {
            if(this.var_303.length > 0)
            {
               super.setAnimation(this.var_303.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
