package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_750:int = 1;
      
      public static const const_749:int = 2;
      
      public static const const_823:int = 3;
      
      public static const const_1214:int = 4;
      
      public static const const_868:int = 5;
      
      public static const const_1146:int = 6;
       
      
      private var _type:int;
      
      private var var_1335:int;
      
      private var var_2348:String;
      
      private var var_2349:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1335 = param2;
         this.var_2348 = param3;
         this.var_2349 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2348;
      }
      
      public function get time() : String
      {
         return this.var_2349;
      }
      
      public function get senderId() : int
      {
         return this.var_1335;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
