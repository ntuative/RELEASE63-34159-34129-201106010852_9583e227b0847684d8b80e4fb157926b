package com.sulake.habbo.friendbar.data
{
   public class FriendNotification
   {
      
      public static const const_594:int = -1;
      
      public static const const_1849:int = 0;
      
      public static const const_1939:int = 1;
      
      public static const const_1892:int = 2;
       
      
      public var typeCode:int = -1;
      
      public var message:String;
      
      public var viewOnce:Boolean;
      
      public function FriendNotification(param1:int, param2:String, param3:Boolean)
      {
         super();
         this.typeCode = param1;
         this.message = param2;
         this.viewOnce = param3;
      }
   }
}
