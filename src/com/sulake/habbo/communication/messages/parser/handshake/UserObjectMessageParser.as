package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_605:String;
      
      private var var_920:String;
      
      private var var_2700:String;
      
      private var var_1773:String;
      
      private var var_2697:int;
      
      private var var_2696:String;
      
      private var var_2699:int;
      
      private var var_2698:int;
      
      private var var_2220:int;
      
      private var var_1122:int;
      
      private var _petRespectLeft:int;
      
      private var var_2211:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_605 = param1.readString();
         this.var_920 = param1.readString();
         this.var_2700 = param1.readString();
         this.var_1773 = param1.readString();
         this.var_2697 = param1.readInteger();
         this.var_2696 = param1.readString();
         this.var_2699 = param1.readInteger();
         this.var_2698 = param1.readInteger();
         this.var_2220 = param1.readInteger();
         this.var_1122 = param1.readInteger();
         this._petRespectLeft = param1.readInteger();
         this.var_2211 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_605;
      }
      
      public function get sex() : String
      {
         return this.var_920;
      }
      
      public function get customData() : String
      {
         return this.var_2700;
      }
      
      public function get realName() : String
      {
         return this.var_1773;
      }
      
      public function get tickets() : int
      {
         return this.var_2697;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2696;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2699;
      }
      
      public function get directMail() : int
      {
         return this.var_2698;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2220;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1122;
      }
      
      public function get petRespectLeft() : int
      {
         return this._petRespectLeft;
      }
      
      public function get identityId() : int
      {
         return this.var_2211;
      }
   }
}
