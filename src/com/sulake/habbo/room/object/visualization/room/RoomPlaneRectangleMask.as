package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2239:Number = 0.0;
      
      private var var_2242:Number = 0.0;
      
      private var var_2241:Number = 0.0;
      
      private var var_2240:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2239 = param1;
         this.var_2242 = param2;
         this.var_2241 = param3;
         this.var_2240 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2239;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2242;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2241;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2240;
      }
   }
}
