package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_605:String;
      
      private var var_2531:String;
      
      private var var_941:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_605 = param1;
         this.var_941 = param2;
         this.var_2531 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_605;
      }
      
      public function get race() : String
      {
         return this.var_2531;
      }
      
      public function get gender() : String
      {
         return this.var_941;
      }
   }
}
