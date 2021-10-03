package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1205:String;
      
      private var var_1393:Array;
      
      private var var_1188:Array;
      
      private var var_2058:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1205;
      }
      
      public function get choices() : Array
      {
         return this.var_1393.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1188.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2058;
      }
      
      public function flush() : Boolean
      {
         this.var_1205 = "";
         this.var_1393 = [];
         this.var_1188 = [];
         this.var_2058 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1205 = param1.readString();
         this.var_1393 = [];
         this.var_1188 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1393.push(param1.readString());
            this.var_1188.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2058 = param1.readInteger();
         return true;
      }
   }
}
