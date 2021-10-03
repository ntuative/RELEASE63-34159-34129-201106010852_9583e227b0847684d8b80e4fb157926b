package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2437:int;
      
      private var var_2438:int;
      
      private var var_2436:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2437 = param1;
         this.var_2438 = param2;
         this.var_2436 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2437,this.var_2438,this.var_2436];
      }
      
      public function dispose() : void
      {
      }
   }
}
