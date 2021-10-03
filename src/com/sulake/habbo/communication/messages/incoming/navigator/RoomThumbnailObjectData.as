package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1558:int;
      
      private var var_1557:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1558 = this.var_1558;
         _loc1_.var_1557 = this.var_1557;
         return _loc1_;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1558 = param1;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1557 = param1;
      }
      
      public function get pos() : int
      {
         return this.var_1558;
      }
      
      public function get imgId() : int
      {
         return this.var_1557;
      }
   }
}
