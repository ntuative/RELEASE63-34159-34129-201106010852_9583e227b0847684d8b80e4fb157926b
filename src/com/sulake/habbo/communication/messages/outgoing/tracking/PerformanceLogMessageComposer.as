package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2323:int = 0;
      
      private var var_1396:String = "";
      
      private var var_1672:String = "";
      
      private var var_2232:String = "";
      
      private var var_2611:String = "";
      
      private var var_1902:int = 0;
      
      private var var_2612:int = 0;
      
      private var var_2609:int = 0;
      
      private var var_1399:int = 0;
      
      private var var_2610:int = 0;
      
      private var var_1397:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2323 = param1;
         this.var_1396 = param2;
         this.var_1672 = param3;
         this.var_2232 = param4;
         this.var_2611 = param5;
         if(param6)
         {
            this.var_1902 = 1;
         }
         else
         {
            this.var_1902 = 0;
         }
         this.var_2612 = param7;
         this.var_2609 = param8;
         this.var_1399 = param9;
         this.var_2610 = param10;
         this.var_1397 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2323,this.var_1396,this.var_1672,this.var_2232,this.var_2611,this.var_1902,this.var_2612,this.var_2609,this.var_1399,this.var_2610,this.var_1397];
      }
   }
}
