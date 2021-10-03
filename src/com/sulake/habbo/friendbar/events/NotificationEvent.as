package com.sulake.habbo.friendbar.events
{
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import flash.events.Event;
   
   public class NotificationEvent extends Event
   {
      
      public static const const_765:String = "FBE_NOTIFICATION_EVENT";
       
      
      public var var_2947:int;
      
      public var notification:FriendNotification;
      
      public function NotificationEvent(param1:int, param2:FriendNotification)
      {
         super(const_765);
         this.var_2947 = param1;
         this.notification = param2;
      }
   }
}
