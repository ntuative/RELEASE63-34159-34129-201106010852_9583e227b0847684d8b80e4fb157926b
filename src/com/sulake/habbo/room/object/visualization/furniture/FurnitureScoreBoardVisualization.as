package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureScoreBoardVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1462:String = "ones_sprite";
      
      private static const const_1463:String = "tens_sprite";
      
      private static const const_1464:String = "hundreds_sprite";
      
      private static const const_1461:String = "thousands_sprite";
       
      
      public function FurnitureScoreBoardVisualization()
      {
         super();
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1462:
               return _loc4_ % 10;
            case const_1463:
               return _loc4_ / 10 % 10;
            case const_1464:
               return _loc4_ / 100 % 10;
            case const_1461:
               return _loc4_ / 1000 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
   }
}
