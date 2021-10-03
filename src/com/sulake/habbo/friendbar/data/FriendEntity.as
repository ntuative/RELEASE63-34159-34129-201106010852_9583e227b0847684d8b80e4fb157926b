package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_941:int;
      
      private var _online:Boolean;
      
      private var var_1957:Boolean;
      
      private var var_605:String;
      
      private var var_1586:int;
      
      private var var_1772:String;
      
      private var var_1771:String;
      
      private var var_1773:String;
      
      private var var_983:Vector.<FriendNotification>;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1773 = param3;
         this.var_1772 = param4;
         this.var_941 = param5;
         this._online = param6;
         this.var_1957 = param7;
         this.var_605 = param8;
         this.var_1586 = param9;
         this.var_1771 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this.var_1957;
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
      
      public function get notifications() : Vector.<FriendNotification>
      {
         if(!this.var_983)
         {
            this.var_983 = new Vector.<FriendNotification>();
         }
         return this.var_983;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_941 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this._online = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1957 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_605 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1586 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1772 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1771 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1773 = param1;
      }
   }
}
