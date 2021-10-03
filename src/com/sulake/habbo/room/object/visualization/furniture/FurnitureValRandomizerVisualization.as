package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1054:int = 20;
      
      private static const const_653:int = 10;
      
      private static const const_1466:int = 31;
      
      private static const const_1465:int = 32;
      
      private static const const_654:int = 30;
       
      
      private var var_303:Array;
      
      private var var_759:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_303 = new Array();
         super();
         super.setAnimation(const_654);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_759)
            {
               this.var_759 = true;
               this.var_303 = new Array();
               this.var_303.push(const_1466);
               this.var_303.push(const_1465);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_653)
         {
            if(this.var_759)
            {
               this.var_759 = false;
               this.var_303 = new Array();
               if(direction == 2)
               {
                  this.var_303.push(const_1054 + 5 - param1);
                  this.var_303.push(const_653 + 5 - param1);
               }
               else
               {
                  this.var_303.push(const_1054 + param1);
                  this.var_303.push(const_653 + param1);
               }
               this.var_303.push(const_654);
               return;
            }
            super.setAnimation(const_654);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
