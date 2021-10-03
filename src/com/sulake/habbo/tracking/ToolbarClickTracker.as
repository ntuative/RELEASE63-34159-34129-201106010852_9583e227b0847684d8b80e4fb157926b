package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1382:IHabboTracking;
      
      private var var_2059:Boolean = false;
      
      private var var_2817:int = 0;
      
      private var var_2029:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1382 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1382 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2059 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2817 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2059)
         {
            return;
         }
         ++this.var_2029;
         if(this.var_2029 <= this.var_2817)
         {
            this.var_1382.track("toolbar",param1);
         }
      }
   }
}
