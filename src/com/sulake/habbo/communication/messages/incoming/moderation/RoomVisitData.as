package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_2104:Boolean;
      
      private var _roomId:int;
      
      private var var_958:String;
      
      private var var_2705:int;
      
      private var var_2706:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2104 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_958 = param1.readString();
         this.var_2705 = param1.readInteger();
         this.var_2706 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_2104;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_958;
      }
      
      public function get enterHour() : int
      {
         return this.var_2705;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2706;
      }
   }
}
