package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1780:int;
      
      private var var_2411:String;
      
      private var var_941:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1780 = param1.readInteger();
         this.var_2411 = param1.readString();
         this.var_941 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1780;
      }
      
      public function get figureString() : String
      {
         return this.var_2411;
      }
      
      public function get gender() : String
      {
         return this.var_941;
      }
   }
}
