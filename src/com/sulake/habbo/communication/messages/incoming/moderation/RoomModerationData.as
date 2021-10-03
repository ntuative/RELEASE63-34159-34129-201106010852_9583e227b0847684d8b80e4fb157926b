package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_357:int;
      
      private var var_2486:int;
      
      private var var_2506:Boolean;
      
      private var var_2278:int;
      
      private var _ownerName:String;
      
      private var var_118:RoomData;
      
      private var var_731:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_357 = param1.readInteger();
         this.var_2486 = param1.readInteger();
         this.var_2506 = param1.readBoolean();
         this.var_2278 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_118 = new RoomData(param1);
         this.var_731 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_118 != null)
         {
            this.var_118.dispose();
            this.var_118 = null;
         }
         if(this.var_731 != null)
         {
            this.var_731.dispose();
            this.var_731 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_357;
      }
      
      public function get userCount() : int
      {
         return this.var_2486;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2506;
      }
      
      public function get ownerId() : int
      {
         return this.var_2278;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_118;
      }
      
      public function get event() : RoomData
      {
         return this.var_731;
      }
   }
}
