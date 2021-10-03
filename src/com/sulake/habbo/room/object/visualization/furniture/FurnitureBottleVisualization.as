package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1054:int = 20;
      
      private static const const_653:int = 9;
      
      private static const const_1465:int = -1;
       
      
      private var var_303:Array;
      
      private var var_759:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_303 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_759)
            {
               this.var_759 = true;
               this.var_303 = new Array();
               this.var_303.push(const_1465);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_759)
            {
               this.var_759 = false;
               this.var_303 = new Array();
               this.var_303.push(const_1054);
               this.var_303.push(const_653 + param1);
               this.var_303.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
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
