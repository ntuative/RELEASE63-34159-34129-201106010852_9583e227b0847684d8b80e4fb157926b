package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2735:Boolean;
      
      private var var_2734:int;
      
      private var var_1925:Array;
      
      private var var_802:Array;
      
      private var var_801:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2735;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2734;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1925;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_802;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_801;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1925 = [];
         this.var_802 = [];
         this.var_801 = [];
         this.var_2735 = param1.readBoolean();
         this.var_2734 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1925.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_802.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_801.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
