package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1689:Boolean;
      
      private var var_2259:int;
      
      private var var_2260:String;
      
      private var var_357:int;
      
      private var var_2257:int;
      
      private var var_2007:String;
      
      private var var_2258:String;
      
      private var var_2256:String;
      
      private var var_885:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_885 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1689 = false;
            return;
         }
         this.var_1689 = true;
         this.var_2259 = int(_loc2_);
         this.var_2260 = param1.readString();
         this.var_357 = int(param1.readString());
         this.var_2257 = param1.readInteger();
         this.var_2007 = param1.readString();
         this.var_2258 = param1.readString();
         this.var_2256 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_885.push(_loc5_);
            _loc4_++;
         }
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
      
      public function get ownerAvatarId() : int
      {
         return this.var_2259;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2260;
      }
      
      public function get flatId() : int
      {
         return this.var_357;
      }
      
      public function get eventType() : int
      {
         return this.var_2257;
      }
      
      public function get eventName() : String
      {
         return this.var_2007;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2258;
      }
      
      public function get creationTime() : String
      {
         return this.var_2256;
      }
      
      public function get tags() : Array
      {
         return this.var_885;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1689;
      }
   }
}
