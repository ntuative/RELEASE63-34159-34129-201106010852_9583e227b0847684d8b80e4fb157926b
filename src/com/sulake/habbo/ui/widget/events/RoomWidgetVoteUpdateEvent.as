package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_161:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_138:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1205:String;
      
      private var var_1393:Array;
      
      private var var_1188:Array;
      
      private var var_2058:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1205 = param2;
         this.var_1393 = param3;
         this.var_1188 = param4;
         if(this.var_1188 == null)
         {
            this.var_1188 = [];
         }
         this.var_2058 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1205;
      }
      
      public function get choices() : Array
      {
         return this.var_1393.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1188.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2058;
      }
   }
}
