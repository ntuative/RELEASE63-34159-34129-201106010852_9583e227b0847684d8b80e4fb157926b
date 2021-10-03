package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2305:String;
      
      private var var_2222:int;
      
      private var var_2253:int;
      
      private var var_2223:String;
      
      private var var_2912:int;
      
      private var var_2032:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2305 = param1.readString();
         this.var_2222 = param1.readInteger();
         this.var_2253 = param1.readInteger();
         this.var_2223 = param1.readString();
         this.var_2912 = param1.readInteger();
         this.var_2032 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2305;
      }
      
      public function get unitPort() : int
      {
         return this.var_2222;
      }
      
      public function get worldId() : int
      {
         return this.var_2253;
      }
      
      public function get castLibs() : String
      {
         return this.var_2223;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2912;
      }
      
      public function get nodeId() : int
      {
         return this.var_2032;
      }
   }
}
