package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_941:int;
      
      private var _online:Boolean;
      
      private var var_1695:Boolean;
      
      private var var_605:String;
      
      private var var_1586:int;
      
      private var var_1772:String;
      
      private var var_1771:String;
      
      private var var_1773:String;
      
      private var var_2757:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_941 = param1.readInteger();
         this._online = param1.readBoolean();
         this.var_1695 = param1.readBoolean();
         this.var_605 = param1.readString();
         this.var_1586 = param1.readInteger();
         this.var_1772 = param1.readString();
         this.var_1771 = param1.readString();
         this.var_1773 = param1.readString();
         this.var_2757 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_941;
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1695;
      }
      
      public function get figure() : String
      {
         return this.var_605;
      }
      
      public function get categoryId() : int
      {
         return this.var_1586;
      }
      
      public function get motto() : String
      {
         return this.var_1772;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1771;
      }
      
      public function get realName() : String
      {
         return this.var_1773;
      }
      
      public function get facebookId() : String
      {
         return this.var_2757;
      }
   }
}
