package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_2122:IID;
      
      private var var_1110:Boolean;
      
      private var var_1351:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_2122 = param1;
         this.var_1351 = new Array();
         this.var_1110 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_2122;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1110;
      }
      
      public function get receivers() : Array
      {
         return this.var_1351;
      }
      
      public function dispose() : void
      {
         if(!this.var_1110)
         {
            this.var_1110 = true;
            this.var_2122 = null;
            while(this.var_1351.length > 0)
            {
               this.var_1351.pop();
            }
            this.var_1351 = null;
         }
      }
   }
}
