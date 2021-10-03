package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1690:int;
      
      private var var_1746:Number;
      
      private var var_2340:Number;
      
      private var var_2342:int;
      
      private var var_2341:Number;
      
      private var var_2343:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1690 = param1;
         this.var_1746 = param2;
         this.var_2340 = param3;
         this.var_2341 = param4;
         this.var_2343 = param5;
         this.var_2342 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1690;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1746 < 0)
         {
            return 0;
         }
         return this.var_1746 + (getTimer() - this.var_2342) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2340;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2341;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2343;
      }
   }
}
