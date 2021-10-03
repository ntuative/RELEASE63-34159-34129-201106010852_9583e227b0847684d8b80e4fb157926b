package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_357:int;
      
      private var var_731:Boolean;
      
      private var var_958:String;
      
      private var _ownerName:String;
      
      private var var_2279:int;
      
      private var var_2486:int;
      
      private var var_2483:int;
      
      private var var_1795:String;
      
      private var var_2488:int;
      
      private var var_2489:Boolean;
      
      private var var_767:int;
      
      private var var_1586:int;
      
      private var var_2487:String;
      
      private var var_885:Array;
      
      private var var_2485:RoomThumbnailData;
      
      private var var_2289:Boolean;
      
      private var var_2484:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_885 = new Array();
         super();
         this.var_357 = param1.readInteger();
         this.var_731 = param1.readBoolean();
         this.var_958 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2279 = param1.readInteger();
         this.var_2486 = param1.readInteger();
         this.var_2483 = param1.readInteger();
         this.var_1795 = param1.readString();
         this.var_2488 = param1.readInteger();
         this.var_2489 = param1.readBoolean();
         this.var_767 = param1.readInteger();
         this.var_1586 = param1.readInteger();
         this.var_2487 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_885.push(_loc4_);
            _loc3_++;
         }
         this.var_2485 = new RoomThumbnailData(param1);
         this.var_2289 = param1.readBoolean();
         this.var_2484 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_885 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_357;
      }
      
      public function get event() : Boolean
      {
         return this.var_731;
      }
      
      public function get roomName() : String
      {
         return this.var_958;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2279;
      }
      
      public function get userCount() : int
      {
         return this.var_2486;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2483;
      }
      
      public function get description() : String
      {
         return this.var_1795;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2488;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2489;
      }
      
      public function get score() : int
      {
         return this.var_767;
      }
      
      public function get categoryId() : int
      {
         return this.var_1586;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2487;
      }
      
      public function get tags() : Array
      {
         return this.var_885;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2485;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2289;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2484;
      }
   }
}
