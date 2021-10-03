package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_2032:int;
      
      private var var_2867:String;
      
      private var var_327:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_2032 = param1.readInteger();
         this.var_2867 = param1.readString();
         this.var_327 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_2032;
      }
      
      public function get nodeName() : String
      {
         return this.var_2867;
      }
      
      public function get visible() : Boolean
      {
         return this.var_327;
      }
   }
}
