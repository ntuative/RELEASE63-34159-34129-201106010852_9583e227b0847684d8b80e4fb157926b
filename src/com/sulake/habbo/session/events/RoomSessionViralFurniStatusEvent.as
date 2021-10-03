package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_638:String = "RSVFS_STATUS";
      
      public static const const_588:String = "RSVFS_RECEIVED";
       
      
      private var var_196:String;
      
      private var var_221:int;
      
      private var var_411:int = -1;
      
      private var _shareId:String;
      
      private var var_2248:String;
      
      private var var_2249:Boolean;
      
      private var var_1594:int = 0;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.var_411 = this.status;
         this._shareId = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this.var_221;
      }
      
      public function get status() : int
      {
         return this.var_411;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2248;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2249;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1594;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_221 = param1;
      }
      
      public function set status(param1:int) : void
      {
         this.var_411 = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this._shareId = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2248 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2249 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1594 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_196;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_196 = param1;
      }
   }
}
