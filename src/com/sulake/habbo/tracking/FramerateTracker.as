package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1671:int;
      
      private var var_2398:int;
      
      private var var_784:int;
      
      private var var_498:Number;
      
      private var var_2399:Boolean;
      
      private var var_2397:int;
      
      private var var_1775:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_498);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2398 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2397 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2399 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_784;
         if(this.var_784 == 1)
         {
            this.var_498 = param1;
            this.var_1671 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_784);
            this.var_498 = this.var_498 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2399 && param3 - this.var_1671 >= this.var_2398)
         {
            this.var_784 = 0;
            if(this.var_1775 < this.var_2397)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1775;
               this.var_1671 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
