package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_221:int;
      
      private var var_2434:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_221 = param1;
         this.var_2434 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_221,this.var_2434];
      }
      
      public function dispose() : void
      {
      }
   }
}
